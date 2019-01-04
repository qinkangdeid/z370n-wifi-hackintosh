[TOC]

# z370n-wifi-hackintosh

## 配置

| 硬件           | 型号                                            |
| -------------- | ----------------------------------------------- |
| 主板           | 技嘉 z370n-wifi                                 |
| CPU            | i5-8400 / i5-8500                               |
| CPU散热        | 猫头鹰NH-L9i                                    |
| 机箱(带电源)   | 立人-H80                                        |
| 蓝牙wifi(可选) | ~博通 BCM94352Z~ BCM94360CS2                    |
| 内存           | 骇客神条16GB  / 芝奇灯条                        |
| SSD            | Samsung SM951 512GB / Samsung 960 EVO / 970 EVO |

## BIOS Settings

**Save & Exit → Load Optimized Defaults**

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





