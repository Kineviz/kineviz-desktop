**English** | [中文](README.zh.md)

# Kineviz Desktop — Installation & User Guide

## 1. Introduction

**Kineviz Desktop** is the desktop edition of **GraphXR**, the graph data visualization and analytics platform.

GraphXR is a no-code, browser-based graph visualization and analytics tool from Kineviz, widely used for knowledge graphs, network analysis, investigations and forensics, life sciences, financial risk control, and more. The desktop edition delivers the full Web experience while running locally on your computer—making it convenient for offline use, working with local data, and enjoying smoother performance.

- Official website: <https://www.kineviz.com>
- Online product: <https://graphxr.kineviz.com>
- Desktop downloads: <https://github.com/Kineviz/kineviz-desktop/releases>

> Latest version: **v0.9.0**

---

## 2. System Requirements

| Operating System | Requirement |
| --- | --- |
| Windows | Windows 10 / 11 (x64 or ARM64) |
| macOS | macOS 11 or later (supports both Intel and Apple Silicon) |

- Memory: 8 GB or more recommended (16 GB recommended for large graphs).
- Network: An internet connection is required for the initial sign-in and for some online features.

---

## 3. Download the Installer

Open the releases page, go to the latest version **v0.9.0**, and download the file that matches your operating system:

Releases: <https://github.com/Kineviz/kineviz-desktop/releases>

### Windows

| File | Chip | Notes |
| --- | --- | --- |
| [`Kineviz-Desktop-Setup-0.9.0-win-x64.exe`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-Setup-0.9.0-win-x64.exe) | Intel / AMD (x64) | **Recommended** — standard installer, just double-click to install |
| [`Kineviz-Desktop-Setup-0.9.0-win-arm64.exe`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-Setup-0.9.0-win-arm64.exe) | ARM64 | **Recommended** — standard installer for ARM-based PCs |
| [`Kineviz-Desktop-0.9.0-win-x64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-win-x64.zip) | Intel / AMD (x64) | Portable archive — unzip and run directly |
| [`Kineviz-Desktop-0.9.0-win-arm64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-win-arm64.zip) | ARM64 | Portable archive — unzip and run directly |

> Most Windows PCs use the `x64` build. Only choose the `arm64` build if your device uses an ARM processor (e.g., Snapdragon-based PCs).

### macOS

| File | Chip | Notes |
| --- | --- | --- |
| [`Kineviz-Desktop-0.9.0-mac-x64.dmg`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-mac-x64.dmg) | Intel | **Recommended** — disk image installer |
| [`Kineviz-Desktop-0.9.0-mac-arm64.dmg`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-mac-arm64.dmg) | Apple Silicon (M1/M2/M3, etc.) | **Recommended** — disk image installer |
| [`Kineviz-Desktop-0.9.0-mac-x64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-mac-x64.zip) | Intel | Archive form |
| [`Kineviz-Desktop-0.9.0-mac-arm64.zip`](https://github.com/Kineviz/kineviz-desktop/releases/download/v0.9.0/Kineviz-Desktop-0.9.0-mac-arm64.zip) | Apple Silicon | Archive form |

> How to check your Mac's chip: click the  menu in the top-left corner → "About This Mac", and look at the "Chip / Processor" information. Choose the `arm64` build for Apple M-series chips, or the `x64` build for Intel processors.

> `latest.yml`, `latest-mac.yml`, and `latest-arm64.yml` are configuration files used by the app's auto-update mechanism—**regular users do not need to download them**.

---

## 4. Installation Steps

### Windows

1. Double-click the downloaded `Kineviz-Desktop-Setup-0.9.0-win-x64.exe` (or the `-win-arm64.exe` build for ARM-based PCs).
2. Follow the prompts to complete the installation (you can choose the install location and whether to create a desktop shortcut).
3. Once installed, launch **Kineviz Desktop** from the Start menu or the desktop icon.

> If Windows SmartScreen shows a warning, click "More info" → "Run anyway".

### macOS

1. Double-click the downloaded `.dmg` file.
2. In the window that appears, drag the **Kineviz Desktop** icon into the "Applications" folder.
3. Open **Kineviz Desktop** from Launchpad or the Applications folder.

> If, on first launch, you see "cannot be opened because it is from an unidentified developer", go to "System Settings → Privacy & Security", find the related prompt and click "Open Anyway"; or right-click the icon in "Applications" → "Open".

---

## 5. Getting Started

1. After launching the app, sign in or create a Kineviz account as prompted.
2. Once signed in, you can create a Project and import data to visualize and analyze graphs.
3. The desktop edition works the same way as the online version at <https://graphxr.kineviz.com>—if you are already familiar with the Web version, you can get started right away.

---

## 6. FAQ

**Q: What is the difference between the desktop and online editions?**
A: The features and experience are essentially identical. The desktop edition runs locally, which is better suited for offline scenarios, working with local files, and performance-intensive workloads.

**Q: I can't find an installer that fits my computer.**
A: Confirm your operating system and chip type, then pick the matching file on the releases page: <https://github.com/Kineviz/kineviz-desktop/releases>

**Q: How do I update to a new version?**
A: Watch for new versions on the releases page, then download the latest installer and install over the existing version.

---

## 7. Getting Help

- Product website & docs: <https://www.kineviz.com>
- Releases & downloads: <https://github.com/Kineviz/kineviz-desktop/releases>
- Feedback: open an Issue in the GitHub repository.
