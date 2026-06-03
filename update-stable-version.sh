#!/usr/bin/env bash
#
# update-stable-version.sh — 选取一个 GitHub Release 作为最新稳定版，更新文档并提交
#   Pick a GitHub Release as the latest stable version, update the docs, and commit.
#
# 用法 / Usage:
#   ./update-stable-version.sh [version]
#
#   - 传入版本号时使用该版本 / when a version is given, use it
#       例 / e.g.:  ./update-stable-version.sh v0.2.0
#                   ./update-stable-version.sh 0.2.0
#   - 不传参数则自动取最新的 Release / without an argument, the latest release is used
#
# 它会做什么 / What it does:
#   1. 解析目标版本号 / resolve the target version (argument or latest release)
#   2. 通过 gh 校验该 Release 确实存在于仓库 / verify the release exists via the gh CLI
#   3. 调用 update-version.sh 更新 README.md / README.zh.md / latest-version
#      call update-version.sh to update README.md / README.zh.md / latest-version
#   4. 若有改动则自动提交 / commit automatically if anything changed
#
# 依赖 / Requirements:
#   - gh (GitHub CLI)，需已认证 / authenticated GitHub CLI
#     在 GitHub Actions 中设置环境变量 GH_TOKEN 即可 / set GH_TOKEN env var in GitHub Actions
#
set -euo pipefail

# 切换到脚本所在目录，保证相对路径正确 / cd to the script's dir so relative paths work
cd "$(dirname "$0")"

REPO="Kineviz/kineviz-desktop"
BUMP_SCRIPT="./update-version.sh"

# --- 前置检查 / Pre-flight checks ---
if ! command -v gh >/dev/null 2>&1; then
  echo "错误 / Error: 未找到 gh (GitHub CLI)，请先安装。 / gh (GitHub CLI) is not installed." >&2
  exit 1
fi

if [[ ! -x "$BUMP_SCRIPT" && ! -f "$BUMP_SCRIPT" ]]; then
  echo "错误 / Error: 找不到 $BUMP_SCRIPT" >&2
  exit 1
fi

# --- 1. 解析目标版本 / Resolve the target version ---
INPUT_VERSION="${1:-}"

if [[ -z "$INPUT_VERSION" ]]; then
  echo "未指定版本，正在获取最新 Release... / No version given, fetching the latest release..."
  INPUT_VERSION="$(gh release view --repo "$REPO" --json tagName --jq '.tagName')"
  if [[ -z "$INPUT_VERSION" ]]; then
    echo "错误 / Error: 无法获取最新 Release。 / Failed to fetch the latest release." >&2
    exit 1
  fi
  echo "最新 Release / Latest release: $INPUT_VERSION"
fi

# 数字版本号 (去掉前导 v) / numeric version (leading 'v' stripped)
NUM_VERSION="${INPUT_VERSION#v}"

if [[ ! "$NUM_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "错误 / Error: 版本号格式应为 x.y.z 或 vx.y.z，收到: '$INPUT_VERSION'" >&2
  exit 1
fi

# --- 2. 校验该 Release 是否存在 / Verify the release exists ---
# 标签可能带或不带 'v' 前缀，两种都试 / tag may or may not be 'v'-prefixed, try both
FOUND_TAG=""
for TAG in "v$NUM_VERSION" "$NUM_VERSION"; do
  if gh release view "$TAG" --repo "$REPO" >/dev/null 2>&1; then
    FOUND_TAG="$TAG"
    break
  fi
done

if [[ -z "$FOUND_TAG" ]]; then
  echo "错误 / Error: 在 $REPO 的 Releases 中找不到版本 '$INPUT_VERSION'。" >&2
  echo "可用的 Releases / Available releases:" >&2
  gh release list --repo "$REPO" --limit 10 >&2 || true
  exit 1
fi

echo "已确认稳定版 / Confirmed stable release: $FOUND_TAG"

# --- 3. 更新文档 / Update the docs ---
bash "$BUMP_SCRIPT" "$NUM_VERSION"

# --- 4. 若有改动则提交 / Commit if anything changed ---
if git diff --quiet -- README.md README.zh.md latest-version; then
  echo "文档无变化，跳过提交。 / No doc changes, skipping commit."
  exit 0
fi

# 在 CI 等无身份环境下设置一个默认提交身份 / set a default commit identity when none is configured (e.g. CI)
if ! git config user.email >/dev/null 2>&1; then
  git config user.email "github-actions[bot]@users.noreply.github.com"
  git config user.name "github-actions[bot]"
fi

git add README.md README.zh.md latest-version
git commit -m "docs: set stable version to $NUM_VERSION"

echo "已提交 / Committed: docs: set stable version to $NUM_VERSION"
echo "完成。 / Done."
