[TOC]

# 制作U盘启动

## 制作黑苹果U盘启动器

### 前期准备：

- 8GB以上U盘(空盘、有数据的提前备份，制作时会格式化)
- Mac镜像
- 符合你PC配置的EFI引导文件

> 这个EFI文件是重中之重，会直接影响到你是否可以安装系统，请查找或配置符合你硬件的EFI文件，这里不会涉及EFI文件的相关概念和如何配置适用于> 黑苹果的EFI文件，你可能得移步到远景或者tonyx86等论坛进行查找学习。

> 假如你的主板用的和我的是一样的，那么你可以尝试直接使用我的EFI文件进行安装，如果你还没有找到符合你硬盘的EFI文件，还是先去网上找找或自己 配置

> 如果你是新手，对黑苹果的概念还不熟悉，又想安装体验Mac系统，强烈建议你站在前人的肩膀人，在网上查找和你硬件差不多的先驱者们分享的EFI拿来使用，路漫漫夕其修远，黑苹果是一个需要折腾的过程，等你安装上并且使用后，再慢慢了解其中因果是最为便捷的方式。

### 方式一

— 下载原装镜像制作

- 下载镜像

如果你已经有Mac环境了(实体机或者虚拟机)，直接去App Store搜索系统版本名称下载镜像，例如现在最新版本是Mojave![image-20190213142743822](https://ws2.sinaimg.cn/large/006tNc79gy1g04s4fmtn2j313u0qgwwz.jpg)

![image-20190213142849534](https://ws4.sinaimg.cn/large/006tNc79gy1g04s5zq4i5j31ha0d4q6x.jpg)

之后会跳到设置中心的`软件更新`下载系统镜像

![image-20190213142944047](https://ws3.sinaimg.cn/large/006tNc79gy1g04s6eppj9j31180esn20.jpg)

镜像很大，下载需要时间，下载完成后会在`启动台`里看到镜像![image-20190213143109210](https://ws4.sinaimg.cn/large/006tNc79gy1g04s7w0onfj30dc05qmym.jpg)

- 格式化U盘

   将U盘插入USB上，格式化U盘。
   打开 `应用程序 → 实用工具 → 磁盘工具`，将U盘「抹掉」(格式化) 成「Mac OS X 扩展（日志式）」格式、GUID 分区图，并将 U 盘命名为「Mojave」注意：这里的盘符名称你可以随意指定，但是下一步制作U盘启动的时候选择的U盘名称要和这里设置的一样。![image-20190213144135166](https://ws4.sinaimg.cn/large/006tNc79gy1g04skuu6pmj30au07qdja.jpg)

![image-20190213144347164](https://ws1.sinaimg.cn/large/006tNc79gy1g04slr6khdj31fe0i4nja.jpg)

![image-20190213144655916](https://ws1.sinaimg.cn/large/006tNc79gy1g04so910azj30qc078jxl.jpg)

此时可以看到你的U盘名称变成了Mojave

![image-20190213144813702](https://ws4.sinaimg.cn/large/006tNc79gy1g04splpfw2j31fa0g611k.jpg)

你也可以去`Volumes`下面查看U盘名称

![image-20190213145108476](https://ws2.sinaimg.cn/large/006tNc79gy1g04ssmrec4j30sq07gt9t.jpg)

打开 “应用程序→实用工具→终端”，将下面的一段命令复制并粘贴进去：
如要制作 **macOS Mojave 启动盘**，然后输入下面这段命令：

> 此命令需要输入管理员密码

```bash
sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Mojave /Applications/Install\ macOS\ Mojave.app --nointeraction
```

回车操作后，便已经在制作中了.耐心等待，这个时间持续比较久

![image-20190213145444362](https://ws4.sinaimg.cn/large/006tNc79gy1g04swdlxm2j31bm05sq40.jpg)

完整的制作日志如下：

```bash
 ~ sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/Mojave /Applications/Install\ macOS\ Mojave.app --nointeraction
Password:
Erasing disk: 0%... 10%... 20%... 30%... 100%
Copying to disk: 0%... 10%... 20%... 30%... 40%... 50%... 60%... 70%... 80%... 90%... 100%
Making disk bootable...
Copying boot files...
Install media now available at "/Volumes/Install macOS Mojave"
```

到这里U盘启动制作完毕。

### 方式二

— 下载网上资源镜像制作

如果你没有Mac环境，没办法从appStore下载镜像的话或者你怕自己命令行制作有问题的话，也可以从网上资源查找镜像下载制作，这此步骤适用于Windows、Mac环境。
你可以到[黑苹果乐园](https://imac.hk/category/macos/)下载镜像，下载下来的是一个`dmg`结尾的文件,使用烧录软件烧录即可。

烧录软件我使用[etcher](https://www.balena.io/etcher/) 


## 复制EFI引导文件

​        使用你喜欢的任何可以挂在EFI分区的方式（ 不论系统），将EFI引导文件复制到U盘启动器的EFI分区内。
### 方式一

如果是在Mac环境下，我使用`Clover Configurator`软件挂，毕竟以后黑苹果要改配置都用得上它。切到`Mount EFI`标签，找到你的U盘名字，点击`Mount Partition`输入密码挂载

![image-20190213151458936](https://ws2.sinaimg.cn/large/006tNc79gy1g04thg6n71j31hw0u0too.jpg)

挂载之后再访达可以看到盘符，现在这个盘符内容是空的![image-20190213154052143](https://ws1.sinaimg.cn/large/006tNc79gy1g04u8di62gj316u0o4thy.jpg)

复制你准备好的EFI文件进入即可，注意一定要带EFI文件夹名称

![image-20190213154158135](https://ws3.sinaimg.cn/large/006tNc79gy1g04u9iiofxj316s0o8thz.jpg)
 
### 方式二

使用WindowsPE复制你的EFI文件


到这里整个安装介质已经准备完毕了，下面就是把系统安装到你PC硬盘上了。一定要确保你找或你配置的EFI外文件是合适你现有硬件的，不然你就算制作成功了U盘启动，到了安装步骤可能连安装向导也出不来。

