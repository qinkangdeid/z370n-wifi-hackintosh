# z370n-wifi-hackintosh
# 配置

硬件 | 型号 
---|---
主板 | 技嘉 z370n-wifi  
CPU| i5-8400 / i5-8500
CPU散热|猫头鹰NH-L9i 
机箱(带电源)|立人-H80 
蓝牙wifi(可选)|博通 BCM94352Z 
内存| 骇客神条16GB 
SSD | Samsung SM951 512GB / Samsung 960 EVO / 970 EVO


# BIOS Settings
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

2. Save and Exit BIOS by pressing F10. 3. Reenter BIOS upon computer restart and it should be there.

# 升级日志


  ## 2018-10-07

 - BIOS升级到F5
 
 - Colver升级到4674

 - 系统版本更新到 10.14.0



  ## 2018-07-12

 - Colver升级到4568

 - 系统版本更新到 10.13.6 (17G65)

 - apfs.efi相应升级到10.13.6

 - 更新USB补丁

    - 更新版本导致USB补丁失效

      修改如下：

      name: `com.apple.driver.usb.AppleUSBXHCI`

      Find:`837D880F 0F83A704 0000`

      Replace:`837D880F 90909090 9090`

      Comment:` change 15 port limit to 26 in XHCI kext for 10.13.6 beta 1 (credit Canvas)`

      MatchOS:`10.13.x`

---


