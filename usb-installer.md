[TOC]

# 制作黑苹果U盘启动器

## 前期准备：

- 8GB以上U盘(空盘、有数据的提前备份，制作时会格式化)
- Mac镜像(在Mac环境AppStore下载或网上找网友分享的镜像)
- 符合你PC配置的EFI引导文件

## 制作启动盘

### 方式一

-  App Store下载镜像制作
  - 下载镜像

​       `如果你已经有Mac环境了(实体机或者虚拟机)`，直接去App Store搜索系统版本名称下载镜像，例如现在最新版本是Mojave![image-20190213142743822](https://ws2.sinaimg.cn/large/006tNc79gy1g04s4fmtn2j313u0qgwwz.jpg)

![image-20190213142849534](https://ws4.sinaimg.cn/large/006tNc79gy1g04s5zq4i5j31ha0d4q6x.jpg)

之后会跳到设置中心的`软件更新`下载系统镜像

![image-20190213142944047](https://ws3.sinaimg.cn/large/006tNc79gy1g04s6eppj9j31180esn20.jpg)

镜像很大，下载需要时间，下载完成后会在`启动台`里看到镜像



![image-20190213143109210](https://ws4.sinaimg.cn/large/006tNc79gy1g04s7w0onfj30dc05qmym.jpg)



- 格式化U盘

   > 镜像已经准备完毕，下面就是制作U盘启动了

   将要用于制作启动盘的U盘插入USB上，打开 `应用程序 → 实用工具 → 磁盘工具`，将U盘`抹掉`(格式化) 成`Mac OS X 扩展（日志式）`格式、`GUID 分区图`，并将 U 盘命名为`Mojave`

    **注意 **：这里的盘符名称你可以随意指定，但是下一步制作U盘启动的时候选择的U盘名称要和这里设置的一样。

   

   ![image-20190213144135166](https://ws4.sinaimg.cn/large/006tNc79gy1g04skuu6pmj30au07qdja.jpg)

![image-20190213144347164](https://ws1.sinaimg.cn/large/006tNc79gy1g04slr6khdj31fe0i4nja.jpg)

![image-20190213144655916](https://ws1.sinaimg.cn/large/006tNc79gy1g04so910azj30qc078jxl.jpg)

此时可以看到你的U盘名称变成了Mojave

![image-20190213144813702](https://ws4.sinaimg.cn/large/006tNc79gy1g04splpfw2j31fa0g611k.jpg)

你也可以去`Volumes`下面查看U盘名称

![image-20190213145108476](https://ws2.sinaimg.cn/large/006tNc79gy1g04ssmrec4j30sq07gt9t.jpg)

打开 `应用程序→实用工具→终端`(或者使用你喜欢的任何一个终端工具)，将下面的一段命令复制并粘贴进去：
如要制作 **MacOS Mojave** 启动盘，然后输入下面这段命令：

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

-  下载网上资源镜像制作

​	`如果你没有Mac环境`，没办法从AppStore下载镜像的话或者你怕自己命令行制作有问题的话，也可以从网上查找网友大神们已经制作好的镜像制作，此步骤适用于Windows、Mac环境。
你可以到[黑苹果乐园](https://imac.hk/category/macos/)下载镜像，下载下来的是一个`dmg`结尾的文件,使用烧录软件烧录即可。

烧录软件我使用[etcher](https://www.balena.io/etcher/) 

基本只需要点三次就可以完成：

- 选取烧录镜像

![image-20190213181324610](https://ws1.sinaimg.cn/large/006tNc79gy1g04yn3c5yqj318c0qkq4n.jpg)

- 选择要烧录的U盘

![image-20190213181611080](https://ws2.sinaimg.cn/large/006tNc79gy1g04ypzgsv4j31ef0u0agh.jpg)

- 点击烧录

![image-20190213181642150](https://ws3.sinaimg.cn/large/006tNc79gy1g04yqimuunj31e60u07b8.jpg)

之后看到烧录进度条

![image-20190213181705549](https://ws3.sinaimg.cn/large/006tNc79gy1g04yqxb5m7j31e60u0kjj.jpg)

烧录成功，就是这么简单！

![image-20190213181721413](https://ws4.sinaimg.cn/large/006tNc79gy1g04yr7egmhj31ei0u0n7e.jpg)



## 复制EFI引导文件

​        使用你喜欢的任何可以挂载EFI分区的方式，将EFI引导文件复制到U盘启动器的EFI分区内。

### 方式一

如果是在Mac环境下，我使用`Clover Configurator`软件挂载，毕竟以后黑苹果要改配置都用得上它。软件下载可以去这里[下载](https://mackie100projects.altervista.org/download-clover-configurator/),不是 **Mac App Store**下载的软件，MacOS会启用了新的安全机制检查不让运行，命令行执行`sudo spctl --master-disable`命令即可运行。

打开了`Clover Configurator`软件后，切到`Mount EFI`标签，找到你的U盘名字，点击`Mount Partition`输入用户密码挂载EFI分区。

![image-20190213151458936](https://ws2.sinaimg.cn/large/006tNc79gy1g04thg6n71j31hw0u0too.jpg)

挂载之后在`访达`可以看到盘符，现在这个盘符里面内容是空的，什么也没有![image-20190213154052143](https://ws1.sinaimg.cn/large/006tNc79gy1g04u8di62gj316u0o4thy.jpg)

把你准备好的`EFI文件`复制到刚才`挂载的U盘的EFI分区`即可，**注意一定要带EFI文件夹名称**

![image-20190213154158135](https://ws3.sinaimg.cn/large/006tNc79gy1g04u9iiofxj316s0o8thz.jpg)

### 方式二

​	使用WindowsPE复制你的EFI文件，找一个U盘制作一个WindowsPE启动器，插上你的PEU盘，启动到PE，在PE的环境插入你制作的MacOS启动盘，之后使用`DiskGenius`软件挂载你的EFI盘符，使用Windows熟悉的方式(鼠标右键复制-粘贴)复制到刚才`挂载的U盘的EFI分区`即可。






















​	到这里整个安装介质已经准备完毕了，下面就是把系统安装到你PC硬盘上了。一定要确保你找或你配置的EFI文件是合适你现有硬件的，不然你就算制作成功了U盘启动，到了安装步骤可能连安装向导也出不来。
