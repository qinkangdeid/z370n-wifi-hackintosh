[TOC]

# z370n-wifi-hackintosh
<!-- TOC -->

- [z370n-wifi-hackintosh](#z370n-wifi-hackintosh)
    - [硬件配置](#硬件配置)
    - [目录一览](#目录一览)
    - [分支使用介绍](#分支使用介绍)
    - [BIOS 设置](#bios-设置)
    - [更新日志](#更新日志)
    - [安装](#安装)
    - [如何更新](#如何更新)
    - [网卡](#网卡)
    - [蓝牙/WIFI](#蓝牙wifi)
    - [USB定制](#usb定制)
    - [后续问题解决途径](#后续问题解决途径)

<!-- /TOC -->
## 硬件配置

> 包含我所知的网友的配置

| 硬件           | 型号                                            |
| -------------- | ----------------------------------------------- |
| 主板           | 技嘉 z370n-wifi                                 |
| CPU            | i5-8400 / i5-8500 / i5-8600K  /  i7-8700k                  |
| CPU散热        | 猫头鹰 NH-L9i                                    |
| 机箱(带电源)   | 立人-H80                                        |
| 蓝牙wifi(可选) |  BCM94352Z(DW1560) / BCM94360CS2                    |
| 内存           | 骇客神条16GB  / 芝奇幻光戟 32G / 海盗船 32G              |
| SSD            | Samsung SM951 512GB / Samsung 960 EVO / 970 EVO |
|显卡| RX570蓝宝石 |

## 目录一览

```bash
└── z370n-wifi-hackintosh
    ├── EFI       ---- MacOS引导文件
    ├── CHANGELOG.md    ---- 更新日志 
    ├── README.md   ---- README.md 
    ├── BIOS     ---- 主板相关bios(包含原始BIOS和适用于MacOS下的BIOS设置文件) 
    └── SSDT  ---- SSDT方式定制的USB patch文件
```

## 分支使用介绍
> 一般的 你只需要将EFI整个复制到你制作的启动U盘里的EFI分区即可,其他文件只是我的备份
> - 10.13.x  —> high-sierra
> - 10.14.x  —> mojave  
> - master  ---> 一般都是目前MacOS最新版本的配置 例如现在最新版本是mojave，master分支会和 mojave保持一致


## BIOS 设置

目前我的BIOS版本：`F10` 

> 现在默认的BIOS也可以启动了，其实并非需要修改的那么细致，不过这是我最早期安装的时候的BIOS设置，所以一直沿用下来，如果你熟悉了可以按需设置，如果你不熟悉，那还是按照下面的来设置一下

BIOS需要做以下修改:

- 先把之前的配置还原：

    - Save & Exit → Load Optimized Defaults

- 之后进行下述配置:

    - Save & Exit → Load Optimized Defaults
    - M.I.T. → Advanced Memory Settings  Extreme Memory Profile(X.M.P.) : - - Profile1 (设置内存的运行频率)
    - BIOS → Fast Boot : Disabled
    - BIOS → LAN PXE Boot Option ROM : Disabled
    - BIOS → Storage Boot Option Control : UEFI
    - Peripherals → Trusted Computing → Security Device Support : Disabled
    - Peripherals → Network Stack Configuration → Network Stack : Disabled
    - Peripherals → USB Configuration → Legacy USB Support : Auto
    - Peripherals → USB Configuration → XHCI Hand-off : Enabled
    - Chipset → Vt-d : Disabled
    - Chipset → Wake on LAN Enable : Disabled
    - Chipset → IOAPIC 24-119 Entries : Enabled

- 内置显卡    
 -  Peripherals → Initial Display Output : IGFX
 -  Chipset → Integrated Graphics : Enabled
 -  Chipset → DVMT Pre-Allocated :128M 

- 外置显卡
 -  Peripherals → Initial Display Output : PCIe 1 Slot
 - Chipset → Integrated Graphics : Disabled (Set to Enabled after installing macOS if you want Hardware Encoding, HEVC, etc)


## 更新日志

[查看更新日志](CHANGELOG.md)


## 安装

[查看安装方法](install.md)


## 如何更新

1. 复制最新的EFI文件到EFI分区即可
2. 像白果一样去`软件更新`安装更新补丁即可

- 检测更新

  ![image-20190408184641508](https://ws1.sinaimg.cn/large/006tNc79gy1g1vf2epczdj30xj0u0qbg.jpg)

  ![image-20190408184713467](https://ws3.sinaimg.cn/large/006tNc79gy1g1vf2wv9svj31120f2dll.jpg)


## 网卡

- 左侧网口 

    > `IntelMausiEthernet.kext`.
- 右侧网口 

    > `SmallTree-Intel-211-AT-PCIe-GBE.kext`

## 蓝牙/WIFI

默认的主板上的蓝牙/WIFI网卡不能用于黑苹果。你需要更换为兼容的网卡，有两块网卡能够兼容黑苹果：

- 原装网卡BCM94360CS2 

> 此款网卡原生驱动 不需要添加第三方驱动

- Dell的DW1560(具体型号为BCM94352Z) 
> 这块网卡需要添加相应驱动，参考黑果小兵版主的[教程](https://blog.daliansky.net/Broadcom-BCM94352z-DW1560-drive-new-posture.html)设置

## USB定制

USB有两种方法：
- Hackintool定制

  EFI里默认的使用方式是`Hackintool`软件制作`USBPorts.kext`

  这种方式比较容易定制符合自己机箱的端口

- SSDT定制

  在SSDT文件夹里`SSDT-UIAC.aml`
本质上两者应该没啥区别 只是定制的难易程度 我瞎猜的:smiley:  有大佬知道不要喷我

**Z370N-WIFI USB端口位置**

![image-20190413124841765](https://ws4.sinaimg.cn/large/006tNc79gy1g20wtg7bz9j30rs0go7dp.jpg)**以下是我目前定制的USB端口**，如果你要拓展你机箱上的USB口，具体修改方法参考[Hackintool(原Intel FB-Patcher)使用教程及插入姿势](<https://blog.daliansky.net/Intel-FB-Patcher-tutorial-and-insertion-pose.html>)，不过要确保在`15`个端口以内(含)，一个USB3.0就占用两个端口，用3.0的需求应该比2.0的多点吧，所以结合你自己的实际需要，你可以屏蔽USB3.0上的2.0端口以获取更多可用的USB3.0端口

![image-20190413125013669](https://ws3.sinaimg.cn/large/006tNc79gy1g20wv06u38j30u00zlwlf.jpg)

## 后续问题解决途径

- [Google is your good friend](https://www.google.com)
- [黑果小兵博客](https://blog.daliansky.net)
- [远景论坛](http://pcbeta.com)
- [insanelymac](https://www.insanelymac.com)
- [tonymacx86](https://www.tonymacx86.com)

