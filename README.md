[TOC]

# z370n-wifi-hackintosh

## 更新日志

[查看更新日志](CHANGELOG.md)

## 安装

[查看安装方法](install.md)


## 目录一览

```bash
└── z370n-wifi-hackintosh    -----  总目录
    ├── CHANGELOG.md    ---- 更新日志
    ├── EFI       ---- MacOS引导文件 
    ├── README.md   ---- README.md 
    ├── bios     ---- 主板相关bios(包含原始BIOS和适用于MacOS下的BIOS设置文件) 
    ├── cpu_unkown ---- MacOS下 CPU 未知修改文件
    └── ssdt  ---- 主板所有USB端口配置(此配置文件已经包含在EFI中)
```

## 分支使用介绍
> 一般的 你只需要将EFI整个复制到你制作的启动U盘里的EFI分区即可,其他文件只是我的备份
> - 10.13.x  —> high-sierra
> - 10.14.x  —> mojave  
> - master  ---> 一般都是目前MacOS最新版本的配置 例如现在最新版本是mojave，master分支会和 mojave保持一致

## 配置

| 硬件           | 型号                                            |
| -------------- | ----------------------------------------------- |
| 主板           | 技嘉 z370n-wifi                                 |
| CPU            | i5-8400 / i5-8500 / i5-8600K                    |
| CPU散热        | 猫头鹰 NH-L9i                                    |
| 机箱(带电源)   | 立人-H80                                        |
| 蓝牙wifi(可选) |  BCM94352Z(DW1560) / BCM94360CS2                    |
| 内存           | 骇客神条16GB  / 芝奇幻光戟 32G                        |
| SSD            | Samsung SM951 512GB / Samsung 960 EVO / 970 EVO |

## BIOS 设置

BIOS需要做以下修改:

1. 先把之前的配置还原：**Save & Exit → Load Optimized Defaults**

2. 之后进行下述配置:

> M.I.T. → Advanced Memory Settings Extreme Memory Profile(X.M.P.) : Profile1

> BIOS → Fast Boot : Disabled

> BIOS → LAN PXE Boot Option ROM : Disabled

> BIOS → Storage Boot Option Control : UEFI

> Peripherals → Trusted Computing → Security Device Support : Disable

> Peripherals → Network Stack Configuration → Network Stack : Disabled

> Peripherals → USB Configuration → Legacy USB Support : Auto

> Peripherals → USB Configuration → XHCI Hand-off : Enabled

> Chipset → Vt-d : Disabled

> Chipset → Wake on LAN Enable : Disabled

> Chipset → IOAPIC 24-119 Entries : Enabled

 **Intel iGPU:**
> Peripherals → Initial Display Output : IGFX

> Chipset → Integrated Graphics : Enabled

> Chipset → DVMT Pre-Allocated :128M (if this setting isn’t showing then: 1. Set Integrated Graphics: Enabled. 


## 网卡







## 蓝牙/WIFI

默认的主板上的蓝牙/WIFI网卡不能用于黑苹果。你需要更换为兼容的网卡，有两块网卡能够兼容黑苹果：

- 原装网卡BCM94360CS2 

> 此款网卡原生驱动 不需要添加第三方驱动

- Dell的DW1560(具体型号为BCM94352Z) 
> 这块网卡需要添加相应驱动，参考黑锅小兵版主的[教程](https://blog.daliansky.net/Broadcom-BCM94352z-DW1560-drive-new-posture.html)设置



