[English](README.md) | **中文**

# Kineviz Desktop 安装使用说明

## 一、简介

**Kineviz Desktop** 是图数据可视化与分析平台 **GraphXR** 的桌面软件版本。

GraphXR 是 Kineviz 公司推出的一款无需编码、基于浏览器的图数据可视化分析工具，广泛应用于知识图谱、网络分析、调查取证、生物医药、金融风控等领域。桌面版在保留 Web 版完整体验的基础上，让你可以在本地电脑上独立运行，方便离线使用、处理本地数据，并获得更顺畅的性能体验。

- 官方网站：<https://www.kineviz.com>
- 产品在线版：<https://graphxr.kineviz.com>
- 桌面版下载地址：<https://github.com/Kineviz/kineviz-desktop/releases>

> 当前最新版本：**v0.1.17**

---

## 二、系统要求

| 操作系统 | 要求 |
| --- | --- |
| Windows | Windows 10 / 11（x64 或 ARM64） |
| macOS | macOS 11 及以上（支持 Intel 与 Apple Silicon 芯片） |

- 内存：建议 8 GB 及以上（处理较大图数据时建议 16 GB）。
- 网络：首次登录及使用部分在线功能需要联网。

---

## 三、下载安装包

打开发布页面，进入最新版本 **v0.1.17**，根据你的操作系统选择对应文件下载：

发布地址：<https://github.com/Kineviz/kineviz-desktop/releases>

### Windows

| 文件名 | 适用芯片 | 说明 |
| --- | --- | --- |
| [`Kineviz-Desktop-Setup-0.1.17-win-x64.exe`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-Setup-0.1.17-win-x64.exe) | Intel / AMD（x64） | **推荐**，标准安装程序，双击即可安装 |
| [`Kineviz-Desktop-Setup-0.1.17-win-arm64.exe`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-Setup-0.1.17-win-arm64.exe) | ARM64 | **推荐**，适用于 ARM 架构 PC 的标准安装程序 |
| [`Kineviz-Desktop-0.1.17-win-x64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-win-x64.zip) | Intel / AMD（x64） | 免安装压缩包，解压后直接运行 |
| [`Kineviz-Desktop-0.1.17-win-arm64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-win-arm64.zip) | ARM64 | 免安装压缩包，解压后直接运行 |

> 大多数 Windows 电脑使用 `x64` 版本。仅当设备为 ARM 处理器（如骁龙平台 PC）时才选择 `arm64` 版本。

### macOS

| 文件名 | 适用芯片 | 说明 |
| --- | --- | --- |
| [`Kineviz-Desktop-0.1.17-mac-x64.dmg`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-mac-x64.dmg) | Intel | **推荐**，磁盘镜像安装包 |
| [`Kineviz-Desktop-0.1.17-mac-arm64.dmg`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-mac-arm64.dmg) | Apple Silicon（M1/M2/M3 等） | **推荐**，磁盘镜像安装包 |
| [`Kineviz-Desktop-0.1.17-mac-x64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-mac-x64.zip) | Intel | 压缩包形式 |
| [`Kineviz-Desktop-0.1.17-mac-arm64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.1.17/Kineviz-Desktop-0.1.17-mac-arm64.zip) | Apple Silicon | 压缩包形式 |

> 如何查看 Mac 芯片类型：点击屏幕左上角  图标 →「关于本机」，查看「芯片 / 处理器」信息。Apple M 系列选择 `arm64` 版本，Intel 处理器选择 `x64` 版本。

> `latest.yml`、`latest-mac.yml`、`latest-arm64.yml` 为软件自动更新使用的配置文件，**普通用户无需下载**。

---

## 四、安装步骤

### Windows

1. 双击下载好的 `Kineviz-Desktop-Setup-0.1.17-win-x64.exe`（ARM 架构 PC 请使用 `-win-arm64.exe` 版本）。
2. 按提示完成安装（可选择安装目录、是否创建桌面快捷方式）。
3. 安装完成后，从「开始菜单」或桌面图标启动 **Kineviz Desktop**。

> 如果 Windows SmartScreen 弹出提示，点击「更多信息」→「仍要运行」即可。

### macOS

1. 双击下载好的 `.dmg` 文件。
2. 在弹出的窗口中，将 **Kineviz Desktop** 图标拖入「应用程序 / Applications」文件夹。
3. 在「启动台」或「应用程序」中打开 **Kineviz Desktop**。

> 若首次打开时提示「无法打开，因为来自身份不明的开发者」，请前往「系统设置 →隐私与安全性」，找到相关提示并点击「仍要打开」；或在「应用程序」中右键点击图标 →「打开」。

---

## 五、开始使用

1. 启动应用后，按提示登录或注册 Kineviz 账号。
2. 登录后即可创建项目（Project），导入数据进行图谱可视化与分析。
3. 桌面版的操作方式与在线版 <https://graphxr.kineviz.com> 基本一致，如已熟悉 Web 版可直接上手。

---

## 六、常见问题

**Q：桌面版和在线版有什么区别？**
A：功能体验基本一致。桌面版运行在本地，更适合离线场景、处理本地文件以及对性能要求较高的场景。

**Q：找不到适合我电脑的安装包？**
A：请确认操作系统及芯片类型，再到发布页选择对应文件：<https://github.com/Kineviz/kineviz-desktop/releases>

**Q：如何更新到新版本？**
A：关注发布页面的新版本，下载最新安装包覆盖安装即可。

---

## 七、获取帮助

- 产品官网与文档：<https://www.kineviz.com>
- 版本发布与下载：<https://github.com/Kineviz/kineviz-desktop/releases>
- 问题反馈：可在 GitHub 仓库提交 Issue。
