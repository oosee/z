<div align="center">
<img width="768" src="https://raw.githubusercontent.com/oosee/z/main/images/openwrt.png"/>
<h1>OpenWrt — 多设备固件云编译</h1>

<img src="https://img.shields.io/github/downloads/oosee/z/total.svg?style=for-the-badge&color=32C955"/>
<img src="https://img.shields.io/github/stars/oosee/z.svg?style=for-the-badge&color=orange"/>
<img src="https://img.shields.io/github/forks/oosee/z.svg?style=for-the-badge&color=ff69b4"/>
<img src="https://img.shields.io/github/license/oosee/z.svg?style=for-the-badge&color=blueviolet"/>

[![](https://img.shields.io/badge/-目录:-696969.svg)](#readme) [![](https://img.shields.io/badge/-项目说明-FFFFFF.svg)](#项目说明-) [![](https://img.shields.io/badge/-固件特色-FFFFFF.svg)](#固件特色-) [![](https://img.shields.io/badge/-固件下载-FFFFFF.svg)](#固件下载-) [![](https://img.shields.io/badge/-重要更新-FFFFFF.svg)](#重要更新-) [![](https://img.shields.io/badge/-插件预览-FFFFFF.svg)](#插件预览-) [![](https://img.shields.io/badge/-定制固件-FFFFFF.svg)](#定制固件-) [![](https://img.shields.io/badge/-提示-FFFFFF.svg)](#提示-) [![](https://img.shields.io/badge/-链接-FFFFFF.svg)](#链接-)
</div>


## 项目说明 [![](https://img.shields.io/badge/-本项目基本介绍-FFFFFF.svg)](#项目说明-)
- 固件构成：[![Lean](https://img.shields.io/badge/Lede-Lean-ff69b4.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede) [![P3TERX](https://img.shields.io/badge/OpenWrt-P3TERX-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/P3TERX/Actions-OpenWrt) [![Flippy](https://img.shields.io/badge/Package-Flippy-orange.svg?style=flat&logo=appveyor)](https://github.com/unifreq/openwrt_packit) [![oosee](https://img.shields.io/badge/Build-oosee-32C955.svg?style=flat&logo=appveyor)](https://github.com/oosee/z)
- 项目使用 Github Actions 拉取 [Lean](https://github.com/coolsnowwolf/lede) 的 Openwrt 源码仓库进行云编译
- 固件默认管理地址：`192.168.2.2` 默认用户：`root` 默认密码：`password`
- ARMv8 盒子固件分为 [Mini精简版](https://github.com/oosee/z/releases/tag/ARMv8_MINI) 和 [Plus加强版](https://github.com/oosee/z/releases/tag/ARMv8_PLUS)
- ARMv8 系列固件包含 [Flippy](https://github.com/unifreq/openwrt_packit) 发布的所有已适配的盒子固件，并提供 [Docker](https://hub.docker.com/r/ooosee/zz) 镜像固件
- 首次使用请采用全新安装，避免出现升级失败以及其他一些可能的 BUG


## 固件特色 [![](https://img.shields.io/badge/-本项目固件特色-FFFFFF.svg)](#固件特色-)
1. 集成部分常用有线、无线、3G / 4G 网卡驱动
2. 集成 Docker 服务，可在 OpenWrt 内自由部署 Docker 应用
3. 集成应用过滤插件，支持游戏、视频、聊天、下载等 APP 过滤
4. 集成在线用户插件，可查看所有在线用户 IP 地址与实时速率等
5. ARMv8 系列固件内置晶晨宝盒，支持在线更新固件及内核等
6. 固件定时自动编译，以确保获得最新体验，如果之前使用稳定则无需追新


## 固件下载 [![](https://img.shields.io/badge/-状态及下载链接-FFFFFF.svg)](#固件下载-)
点击下表中 [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?style=flat&logo=hack-the-box)](https://github.com/oosee/z/releases) 即可跳转到该设备固件下载页面
| 平台+设备名称 | 固件编译状态 | 配置文件 | 固件下载 |
| :-------------: | :-------------: | :-------------: | :-------------: |
| [![](https://img.shields.io/badge/OpenWrt-X86_64_Mini-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/X86_64-Mini-OpenWrt.yml) | [![](https://github.com/oosee/z/actions/workflows/X86_64-Mini-OpenWrt.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/X86_64-Mini-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/X86_64/mini.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/oosee/z/releases/tag/X86_64_MINI) |
| [![](https://img.shields.io/badge/OpenWrt-X86_64_Plus-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/X86_64-Plus-OpenWrt.yml) | [![](https://github.com/oosee/z/actions/workflows/X86_64-Plus-OpenWrt.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/X86_64-Plus-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/X86_64/plus.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/oosee/z/releases/tag/X86_64_PLUS) |
| [![](https://img.shields.io/badge/OpenWrt-ARMv8_Mini-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/ARMv8-Mini-OpenWrt.yml) | [![](https://github.com/oosee/z/actions/workflows/ARMv8-Mini-OpenWrt.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/ARMv8-Mini-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/ARMV8/mini.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/oosee/z/releases/tag/ARMv8_MINI) |
| [![](https://img.shields.io/badge/OpenWrt-ARMv8_Plus-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/ARMv8-Plus-OpenWrt.yml) | [![](https://github.com/oosee/z/actions/workflows/ARMv8-Plus-OpenWrt.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/ARMv8-Plus-OpenWrt.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/ARMV8/plus.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/oosee/z/releases/tag/ARMv8_PLUS) |
| [![](https://img.shields.io/badge/OpenWrt-Docker_Mini-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/ARMv8-Docker-Mini.yml) | [![](https://github.com/oosee/z/actions/workflows/ARMv8-Docker-Mini.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/ARMv8-Docker-Mini.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/DOCKER/mini.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://hub.docker.com/r/ooosee/zz/tags?name=mini) |
| [![](https://img.shields.io/badge/OpenWrt-Docker_Plus-32C955.svg?logo=openwrt)](https://github.com/oosee/z/blob/main/.github/workflows/ARMv8-Docker-Plus.yml) | [![](https://github.com/oosee/z/actions/workflows/ARMv8-Docker-Plus.yml/badge.svg)](https://github.com/oosee/z/actions/workflows/ARMv8-Docker-Plus.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/oosee/z/blob/main/configs/DOCKER/plus.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://hub.docker.com/r/ooosee/zz/tags?name=plus) |


## 重要更新 [![](https://img.shields.io/badge/-近期更新的内容-FFFFFF.svg)](#重要更新-)
> [!IMPORTANT]
> [None](https://github.com/oosee/z/releases)


## 插件预览 [![](https://img.shields.io/badge/-插件及功能预览-FFFFFF.svg)](#插件预览-)
<details>
<summary><b>&nbsp;ARMv8 盒子 Mini 精简版插件预览</b></summary>
<br/>
<img src="https://raw.githubusercontent.com/oosee/z/main/images/mini.png"/>
</details>

<details>
<summary><b>&nbsp;ARMv8 盒子 Plus 加强版插件预览</b></summary>
<br/>
<img src="https://raw.githubusercontent.com/oosee/z/main/images/plus.png"/>
</details>

<details>
<summary><b>&nbsp;X86_64、R2S&4S 软路由插件预览</b></summary>
<br/>
<details>
<summary><b>├── 状态</b></summary>
　├── 概况<br/>
　├── 防火墙<br/>
　├── 路由表<br/>
　├── 系统日志<br/>
　├── 内核日志<br/>
　├── 系统进程<br/>
　├── 实时信息<br/>
　├── 实时监控<br/>
　├── 在线用户<br/>
　├── WireGuard 状态<br/>
　├── 负载均衡<br/>
　└── 释放内存
</details>
<details>
<summary><b>├── 系统</b></summary>
　├── 系统<br/>
　├── 管理权<br/>
　├── TTYD<br/>
　├── 软件包<br/>
　├── 启动项<br/>
　├── 计划任务<br/>
　├── 挂载点<br/>
　├── 磁盘管理<br/>
　├── 备份/升级<br/>
　├── 自定义命令<br/>
　├── 定时重启<br/>
　├── 文件传输<br/>
　├── 主题设置<br/>
　├── 重启<br/>
　└── 关机
</details>
<details>
<summary><b>├── 服务</b></summary>
　├── PassWall<br/>
　├── PassWall2<br/>
　├── Hello World<br/>
　├── iKoolProxy 滤广告<br/>
　├── V2ray 服务器<br/>
　├── 广告屏蔽大师 Plus+<br/>
　├── ShadowSocksR Plus+<br/>
　├── AdGuard Home<br/>
　├── 应用过滤<br/>
　├── MosDNS<br/>
　├── 全能推送<br/>
　├── 微信推送<br/>
　├── 上网时间控制<br/>
　├── 解锁网易云灰色歌曲<br/>
　├── OpenClash<br/>
　├── 动态 DNS<br/>
　├── MultiSD_Lite<br/>
　├── SmartDNS<br/>
　├── 网络唤醒<br/>
　├── 迅雷快鸟<br/>
　├── Frps<br/>
　├── UU游戏加速器<br/>
　├── UPnP<br/>
　├── KMS 服务器<br/>
　├── AirPlay 2 音频接收<br/>
　├── udpxy<br/>
　├── Nps 内网穿透<br/>
　├── uHTTPd<br/>
　├── Frp 内网穿透<br/>
　└── MWAN3 分流助手
</details>
<details>
<summary><b>├── 容器</b></summary>
　├── 概览<br/>
　├── 容器<br/>
　├── 镜像<br/>
　├── 网络<br/>
　├── 存储卷<br/>
　├── 事件<br/>
　└── 设置
</details>
<details>
<summary><b>├── 存储</b></summary>
　├── 文件浏览器<br/>
　├── 可道云<br/>
　├── NFS 管理<br/>
　├── 微力同步<br/>
　├── Alist 文件列表<br/>
　├── qBittorrent<br/>
　├── USB 打印服务器<br/>
　├── 硬盘休眠<br/>
　├── 挂载 SMB 网络共享<br/>
　├── 网络共享<br/>
　├── FTP 服务器<br/>
　├── Rclone<br/>
　├── Aria2 配置<br/>
　├── miniDLNA<br/>
　└── Transmission
</details>
<details>
<summary><b>├── VPN</b></summary>
　├── N2N v2 VPN<br/>
　├── SoftEther VPN 服务器<br/>
　├── OpenVPN 服务器<br/>
　├── PPTP VPN 服务器<br/>
　├── IPSec VPN 服务器<br/>
　└── ZeroTier
</details>
<details>
<summary><b>├── 网络</b></summary>
　├── 接口<br/>
　├── DHCP/DNS<br/>
　├── 主机名<br/>
　├── IP/MAC 绑定<br/>
　├── 静态路由<br/>
　├── 防火墙<br/>
　├── 诊断<br/>
　├── Socat<br/>
　├── SQM QoS<br/>
　├── 网速控制<br/>
　├── 多线多拨<br/>
　├── 负载均衡<br/>
　└── Turbo ACC 网络加速
</details>
<details>
<summary><b>├── 带宽</b></summary>
　├── 显示<br/>
　├── 配置<br/>
　├── 备份<br/>
　├── 网速<br/>
　└── 流量
</details>
　└── <b>退出</b>
</details>


## 定制固件 [![](https://img.shields.io/badge/-个性化编译教程-FFFFFF.svg)](#定制固件-)
1. 登录 Gihub 账号，然后 Fork 此项目到自己的 Github 仓库
2. 修改 `configs` 目录对应文件添加或删除插件，或者上传自己的 `xx.config` 配置文件
3. 插件对应名称及功能请参考恩山网友帖子：[Applications 添加插件应用说明](https://www.right.com.cn/forum/thread-3682029-1-1.html)
4. 如需修改默认 IP、添加或删除插件包以及一些其他设置请在 `diy-mini&plus.sh` 文件内修改
5. 添加或修改 `xx.yml` 文件，最后点击 `Actions` 运行要编译的 `workflow` 即可开始编译
6. 编译大概需要3-5小时，编译完成后在仓库主页 [Releases](https://github.com/oosee/z/releases) 对应 Tag 标签内下载固件
<details>
<summary><b>&nbsp;如果你觉得修改 config 文件麻烦，那么你可以点击此处尝试本地提取</b></summary>

1. 首先装好 Linux 系统，推荐 Debian 11 或 Ubuntu LTS

2. 安装编译依赖环境

   ```bash
   sudo apt update -y
   sudo apt full-upgrade -y
   sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
   bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
   git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
   libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
   mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools \
   libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
   vim wget xmlto xxd zlib1g-dev
   ```

3. 下载源代码，更新 feeds 并安装到本地

   ```bash
   git clone https://github.com/coolsnowwolf/lede
   cd lede
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   ```

4. 复制 diy-script.sh 文件内所有内容到命令行，添加自定义插件和自定义设置

5. 命令行输入 `make menuconfig` 选择配置，选好配置后导出差异部分到 seed.config 文件

   ```bash
   make defconfig
   ./scripts/diffconfig.sh > seed.config
   ```

7. 命令行输入 `cat seed.config` 查看这个文件，也可以用文本编辑器打开

8. 复制 seed.config 文件内所有内容到 configs 目录对应文件中覆盖就可以了

   **如果看不懂编译界面可以参考 YouTube 视频：[软路由固件 OpenWrt 编译界面设置](https://www.youtube.com/watch?v=jEE_J6-4E3Y&list=WL&index=7)**
</details>


## 提示 [![](https://img.shields.io/badge/-仓库源文件地址-FFFFFF.svg)](#提示-)
> [!TIP]
> [Haiibo](https://github.com/haiibo/OpenWrt)


## 链接 [![](https://img.shields.io/badge/-感谢奉献和分享-FFFFFF.svg)](#链接-)
 [ImmortalWrt](https://github.com/immortalwrt) | [coolsnowwolf](https://github.com/coolsnowwolf) | [P3TERX](https://github.com/P3TERX) | [Flippy](https://github.com/unifreq) 

 [Ophub](https://github.com/ophub) | [SuLingGG](https://github.com/SuLingGG) | [QiuSimons](https://github.com/QiuSimons) | [IvanSolis1989](https://github.com/IvanSolis1989) 


<a href="#readme">
<img src="https://img.shields.io/badge/-返回顶部-FFFFFF.svg" title="返回顶部" align="right"/>
</a>
