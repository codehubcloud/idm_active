# 注意事项：

## 本项目已归档，不再维护。

转用 [FDM](https://www.freedownloadmanager.org/zh/)，不再应付 IDM 新的烦扰提示了。

------------------------------------------------------------------------

## IDM 激活脚本

一个用于激活和重置 [Internet Download Manager](https://www.internetdownloadmanager.com/) 试用版的开源工具。

## 功能特点

- 使用注册表键锁定方法冻结 IDM 试用版并激活软件
- 即使安装 IDM 更新，激活状态和试用期限依然保留
- 重置 IDM 试用期限
- 完全开源
- 基于透明的批处理脚本

## IAS 最新版本

最新发布 - v2.0（2025 年 3 月 09 日）
[GitHub](https://github.com/WindowsAddict/IDM-Activation-Script) - [BitBucket](https://bitbucket.org/WindowsAddict/idm-activation-script/)

## 下载 / 如何使用？

- 首先全新安装 [Internet Download Manager](https://www.internetdownloadmanager.com/)。确保之前的破解补丁已被移除或卸载（如果有的话）。
- 之后按照以下步骤激活它。

## 注意

- 📌 脚本中的激活选项目前无法使用，请使用“冻结试用版”选项将 30 天试用期限锁定为永久。

### 方法 1 - PowerShell

（推荐）

- 右键点击 Windows 开始菜单，选择 PowerShell 或终端（非 CMD）。
- 复制并粘贴以下代码，然后按回车键
  `irm https://github.com/codehubcloud/idm_active/blob/master/idm_active_script.ps1 | iex`
- 你将看到激活选项，按照屏幕上的说明操作。
- 就这么简单。

### 方法 2 - 传统方式

- 从 [GitHub](https://github.com/WindowsAddict/IDM-Activation-Script/archive/refs/heads/main.zip) 或 [Bitbucket](https://bitbucket.org/WindowsAddict/idm-activation-script/get/main.zip) 下载文件。
- 右键点击下载的压缩文件并解压。
- 在解压后的文件夹中，运行名为 `idm_active.cmd` 的文件。
- 你将看到激活选项，按照屏幕上的说明操作。
- 就这么简单。

## 信息

#### 冻结试用版

- IDM 提供 30 天试用期限，你可以使用脚本中的此选项将试用期限永久锁定，这样你就无需再次重置试用期限，试用也不会过期。
- 应用此选项时需要联网。
- 可以直接安装 IDM 更新，无需再次冻结试用版。

#### 激活

- 此脚本使用注册表锁定方法激活 Internet Download Manager（IDM）。
- 激活时需要联网。
- 可以直接安装 IDM 更新，无需再次激活。
- 激活后，如果在某些情况下，IDM 开始显示激活提示窗口，只需再次运行激活选项，无需使用重置选项。

#### 重置 IDM 激活/试用期限

- Internet Download Manager 提供 30 天试用期限，你可以随时使用此脚本重置激活/试用期限。
- 此选项还可用于恢复 IDM 报告虚假序列号等类似错误时的状态。

#### 操作系统要求

- 本项目支持 Windows 7/8/8.1/10/11 及其服务器版本。
- 使用 PowerShell 运行 IAS 的方法支持 Windows 8 及更高版本。

#### 高级信息

- 要以无人值守模式激活，使用 `/act` 参数运行脚本。
- 要以无人值守模式冻结试用版，使用 `/frz` 参数运行脚本。
- 要以无人值守模式重置，使用 `/res` 参数运行脚本。

## 工作原理

- IDM 将与试用和激活相关的数据存储在多个注册表键中。其中一些键被锁定以防止篡改，数据以特定模式存储，用于跟踪虚假序列号问题和剩余试用天数。为了激活它，此脚本通过在 IDM 中触发几次下载来生成这些注册表键，识别这些键并锁定它们，使 IDM 无法编辑和查看。这样，IDM 就不会显示使用虚假序列号激活的警告。

用心制作 ❤️
