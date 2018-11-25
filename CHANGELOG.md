

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

