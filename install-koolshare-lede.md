---
title: KoolShare-LEDE-x86安装

date: 2019-05-03T11:59:16+08:00
draft: false


tags: ["Router"]
categories: ["折腾"]

author: "qinkangdeid"

featuredImage: "/images/omv/koolshare-lede.png"

toc: true
autoCollapseToc: true
math: false
lightgallery: true
linkToMarkdown: true
share:
  enable: true
comment: true

---

   前期矿难就入了一款蜗牛星际的矿机，之前一直安装的是黑裙在使用，也因为已经装了OMV了，体验完了之后看看还有什么用处，正好是双网口，

这颗CPU用来做软路由的也很多。所以就想拿来刷LEDE做软路由用了，也有很多人是PVE上装的LEDE+黑裙，J1900也不强，虽说个人这样使用也是够的。我没有太多的要求要上什么双路由之类的，也不玩虚拟，所以我就实体安装一个就行，以后就都不用动了，只装一个LEDE。

我这里是打算用软路由做主路由，硬路由做AP。软路由对于家用来说，比硬路由更加有优势，也不用愁硬路由那几百M的内存了，而且还有很多插件使用，爽歪歪。

> 已经有太多人写了很多优秀文章了，一定会有不同的操作或更简单的方法，我也是个小白，所以这里只是我一个实际操作记录。仅供参考

## 前期准备
- x86设备（我这里就是蜗牛J1900）
- 固件
- PE
- 系统盘（大于8G应该就OK了 我这里是16G的垃圾msata）
- 显示器

## 下载固件
固件下载可以直接到官方[固件下载]([http://firmware.koolshare.cn/LEDE_X64_fw867/](http://firmware.koolshare.cn/LEDE_X64_fw867/)
)下载,我的msata的硬盘，所以没工具不能扯下来Windows写盘，所以我选择了`虚拟机转盘或PE下写盘专用`，我选择UEFI方式的启动固件,待会在PE下写盘。

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150636.png)





写盘需要用到`physdiskwrite`这个软件，下载地址见下：
> 链接: https://pan.baidu.com/s/16nQzGnp9Y8JlOVuSDAqiOA 提取码: vc5t 

## 固件写盘
假设你已经有了PE系统了，将之前下载的固件和写盘工具两个一起复制到你的PE盘里。
PE启动盘插入到你的x86机器里，U盘启动进PE。
- 格式化系统盘
启动`DiskGenius`对系统盘进行`删除所有分区`操作
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150655.png)

 弹出确认窗口 `是(Y)`

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150713.png)

保存更改

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150729.png)

之后可以看见系统盘空空如也

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150747.png)

- 将固件写入系统盘
这个时候查看你的PE盘里的固件和写盘工具在PE下的盘符是多少，我的是 U，
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150804.png)


然后快捷键`win+R`在弹出的窗口输入`cmd`进入命令行（如果你系统盘可以使用其他的介质在Windows上读取的话，就可以不用在PE下制作了）

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150819.png)

切换到你的固件所在盘符，我的是 U
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150838.png)

之后使用`physdiskwrite -u 你的固件名称`来刷写进系统盘中，例如我现在的固件名为`openwrt-koolshare-mod-v2.30-r10402-51ad900e2c-x86-64-uefi-gpt-squashfs.img.gz
`
那么我的刷写命令是：

```bash
physdiskwrite -u openwrt-koolshare-mod-v2.30-r10402-51ad900e2c-x86-64-uefi-gpt-squashfs.img.gz
```
之后按回车，选择要刷写的系统盘的位置，看准你的系统盘是哪一个了，不要刷错了，我的是在第 0 个位置，所以我选 0 
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150855.png)


之后会有一个确认提示，确认无误后就填写  `y`,之后回车

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150911.png)


回车之后就开始将固件刷写进系统盘里了，耐心等待，大概需要一两分钟，成功之后会有如下提示：
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150927.png)


这个时候固件刷写完毕了，整个过程就完成了。

## 重启LEDE
现在拔出你的PE启动盘，点击`重启`，之后你会看见屏幕在刷一大堆日志

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320150944.png)


刷到最后不动了，例如下面这样就表示启动成功了

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151004.png)


之后你随便敲击一下键盘，即可看见logo界面和bash命令行

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151022.png)



## 修改LEDE管理地址
LEDE的默认管理地址是`192.168.1.1`,这个地址通常也是光猫的管理地址，为了不引起冲突，需要修改LEDE的默认管理地址为其他地址，直接在刚在命令行上修改地址
输入命令`vim /etc/config/network`,之后按字母`i`进入编辑模式,将默认的`192.168.1.1`修改为其他的地址，我这里将其修改为`192.168.100.1` 之后按`:wq!`保存退出，粗暴一点，直接再敲击输入`reboot`重启LEDE。

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151040.png)

## 进入LEDE管理界面
这个时候再次启动了LEDE，可以吧显示器断开软路由机器了，之后将网线插到软路由的一个网口上，进入LEDE后台管理界面，工作机器浏览器输入你刚才修改的LEDE管理地址我这里是`192.168.100.1`
> 用户名 root 
> 密码 koolshare

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151057.png)


- 修改wan拨号
如果你想要使用路由拨号，那么你需要修改你的光猫为`桥接模式`，把拨号工作交给软路由。
软路由有两个网口，一个用来做wan，一个用来做lan口。怎么设置是没所谓的，随便指定一个就好了。
我现在的lan口是`eth0`,wan口是`eth1`

进到`网络`-->`接口`-->`WAN`标签下，设置`PPPoE`拨号,填入你的宽带账号和密码，保存应用即可

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151111.png)

等待一小会，去`总览`就能看见网络信息了
![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151125.png)

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151140.png)

现在你打开网页，应该就可以上网了。

LEDE的软件中心插件真的很多

![](https://raw.githubusercontent.com/qinkangdeid/pics/imgs/20200320151156.png)


