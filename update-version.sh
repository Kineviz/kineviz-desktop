#!/usr/bin/env bash
#
# update-version.sh — 快速更新文档中的版本号 / Quickly bump the version referenced in the docs
#
# 用法 / Usage:
#   ./update-version.sh <new-version>
#
# 示例 / Example:
#   ./update-version.sh 0.2.0
#
# 它会做什么 / What it does:
#   1. 从 latest-version 读取当前版本号 / Read the current version from `latest-version`
#   2. 在 README.md 和 README.zh.md 中把旧版本号全部替换为新版本号
#      Replace every occurrence of the old version with the new one in README.md and README.zh.md
#   3. 把新版本号写回 latest-version / Write the new version back to `latest-version`
#
set -euo pipefail

# 切换到脚本所在目录，保证相对路径正确 / cd to the script's dir so relative paths work
cd "$(dirname "$0")"

VERSION_FILE="latest-version"
FILES=("README.md" "README.zh.md")

# --- 校验参数 / Validate argument ---
if [[ $# -ne 1 ]]; then
  echo "用法 / Usage: $0 <new-version>" >&2
  echo "示例 / Example: $0 0.2.0" >&2
  exit 1
fi

NEW_VERSION="$1"

# 去掉可能的前导 'v' / strip an optional leading 'v'
NEW_VERSION="${NEW_VERSION#v}"

# 校验版本号格式 (x.y.z) / validate semver-ish format
if [[ ! "$NEW_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "错误 / Error: 版本号格式应为 x.y.z (例如 0.2.0)，收到: '$NEW_VERSION'" >&2
  exit 1
fi

# --- 读取旧版本 / Read the old version ---
if [[ ! -f "$VERSION_FILE" ]]; then
  echo "错误 / Error: 找不到 $VERSION_FILE" >&2
  exit 1
fi

OLD_VERSION="$(tr -d '[:space:]' < "$VERSION_FILE")"

if [[ -z "$OLD_VERSION" ]]; then
  echo "错误 / Error: $VERSION_FILE 为空" >&2
  exit 1
fi

if [[ "$OLD_VERSION" == "$NEW_VERSION" ]]; then
  echo "当前版本已是 $NEW_VERSION，无需更新。 / Already at $NEW_VERSION, nothing to do."
  exit 0
fi

# 把版本号中的点转义为正则字面量 / escape dots for literal regex matching
OLD_ESCAPED="${OLD_VERSION//./\\.}"

echo "更新版本 / Updating version: $OLD_VERSION -> $NEW_VERSION"

# --- 执行替换 / Perform the replacement ---
for f in "${FILES[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "  跳过 (不存在) / skip (missing): $f"
    continue
  fi

  count="$(grep -o "$OLD_ESCAPED" "$f" | wc -l | tr -d '[:space:]')"

  # 用临时文件方式替换，兼容 GNU/BSD sed / use a temp file for GNU/BSD sed portability
  tmp="$(mktemp)"
  sed "s/${OLD_ESCAPED}/${NEW_VERSION}/g" "$f" > "$tmp"
  mv "$tmp" "$f"

  echo "  $f: 替换 $count 处 / replaced $count occurrence(s)"
done

# --- 写回版本文件 / Write back the version file ---
printf '%s\n' "$NEW_VERSION" > "$VERSION_FILE"
echo "已更新 / Updated $VERSION_FILE -> $NEW_VERSION"

echo "完成。 / Done."
