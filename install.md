<!-- TOC -->

- [安装MacOS系统](#安装macos系统)
- [复制EFI引导到系统盘](#复制efi引导到系统盘)

<!-- /TOC -->
==============

​
黑苹果的定义和说明网上已经有详细的讲解了，随便搜索一下"黑苹果"，就能出现很多文章描述，找到了下面一句总结性的话语：

> "黑苹果 (Hackintosh)" ------ 一台运行着 Mac OS 操作系统的 PC 硬件。

​
软件运行在硬件之上，所以一个软件的开发适配，都是在指定的硬件条件下进行的。苹果的产品大都有自己特殊的硬件要求。在苹果选择了x86之后，才有了黑苹果的可能。不过现在AMD的CPU也可以黑了，那个就更耗费精力了。

​
黑苹果之所以复杂繁琐，就是因为PC机的硬件本身太多太复杂，不像白苹果，一共就那么几种硬件，两手两脚基本就数得清。但是也正因为PC硬件丰富，你就有希望找到兼容MacOS的硬件，笔记本一般硬件都焊死，所以笔记本一般都比较的麻烦。

> 黑苹果所说的免驱，一般是完美兼容MacOS的硬件，MacOS内置的驱动就可以驱动它完美运行，而不需要你增加额外的第三方驱动去驱动它，并不是不需要驱动。

EFI 配置
--------

​ 想要在不是苹果官方生产的硬件上运行MacOS，那就需要让 MacOS
"认为"你现有的硬件是"合格"运行MacOS的硬件。

​
系统启动都有一个引导自检的过程，像Android的bootloader一样，PC也有，以前有BIOS启动，现在是UEFI启动(Unified
Extensible Firmware
Interface),UEFI是一种详细描述类型接口的标准。这种接口用于操作系统自动从预启动的操作环境，加载到一种操作系统上。

​
黑苹果就是在这个阶段去做一些"手脚"的，最重要的就是整理这一部分的EFI引导文件。

> 这个EFI文件是重中之重，会直接影响到你是否可以安装MacOS系统，请查找或配置符合你硬件的EFI文件，这里不会涉及EFI文件的相关概念和如何配置适用于黑苹果的EFI文件，你可能得移步到远景或者tonyx86等论坛进行学习或查找。

> 假如你的主板用的和我的是一样的，那么你可以尝试直接使用我的EFI文件进行安装，如果你还没有找到符合你硬件的EFI文件，还是先去网上找找或自己学习配置。

> 如果你是新手，对黑苹果的概念还不熟悉，又想安装体验MacOS系统，强烈建议你站在前人的肩膀上，在网上查找和你硬件差不多的先驱者们分享的EFI直接使用，路漫漫夕其修远，黑苹果是一个需要折腾的过程，等你安装上并且使用后，再慢慢了解其中因果是最为便捷的方式。

安装
----

\#\#\# 制作U盘启动器

​
其实EFI文件你搞定了，安装黑苹果将和安装Windows、Linux没什么差别了，或者说和安装白苹果一样了。和Windows、Linux系统的安装步骤一样，你需要制造一个U盘启动器，[查看这里制作你的U盘启动器](usb-installer.md)。

### 安装MacOS系统

​ 到这一步，假设你已经做好了U盘启动器了。现在万事俱备，只差实施了。

-   选择U盘启动

    将你制作好的U盘启动器插入到你将要安装系统的机器的USB口上，将机器开机，查找你主板的`Boot Menu`快捷键（一般都是F11或者F12，技嘉主板的是按F12），进入到启动选择界面，找到你的U盘启动器的名字，选择它的UEFI启动，例如我的U盘的名字是`SanDisk`，则我就选择`UEFI`那个分区启动，如果你的U盘品牌不一样，请找到你的U盘并且对号入座选择正确的启动项：

    ![image-20190228213550795](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mgscrvcbj31g00u0npd.jpg)

-   Clover引导界面选择安装

上面选择之后，就进入到了Clover的引导界面，如果你的系统盘够干净，那么应该只会剩下一个安装的选项，所以现在小孩和大人都不用做选择了，直接按回车键

![image-20190228214049098](https://ws2.sinaimg.cn/large/006tKfTcgy1g0mgxjmitsj318c0u0hdv.jpg)

回车之后会进入loading界面，这一步骤就是等待他加载完成出现安装向导界面了。如下：

![image-20190228214234816](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mgzcmgdxj31400u0gtv.jpg)

加载完成之后，来到安装向导界面，在这里选择语言，根据你的国家环境选择，祖国当然是`简体中文`啦：

![image-20190228214437758](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mh1hihkaj31400u0npd.jpg)

之后会来到`macOS实用工具`界面，我们需要将系统盘进行`抹掉`操作，所以要选择`磁盘工具`，进行抹盘，就是要格式化的意思，所以如果你将要安装的系统盘之前有什么重要的数据，那么事先就要先做好备份了。

![image-20190228214625338](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mh3dg6xqj31400u0e81.jpg)

之后进项抹盘操作，选择系统盘，然后点击`抹掉`

![image-20190228214821413](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mh5dkgkqj31ba0u01ky.jpg)

弹出抹盘的选项，系统盘符名称可以随便填写，我这填`MacOS`抹盘格式选择`MacOS拓展（日志式）`，之后点击`抹掉`按钮

![image-20190228215016715](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mh7d7hcyj31bw0u0kjl.jpg)

抹盘成功提示：

![image-20190228215218246](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mh9gwtebj31400u04qp.jpg)

回到`macOS实用工具`界面，选择`安装macOS`

![image-20190228215313180](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mhafhg69j31400u0hdt.jpg)

下面正式出现安装向导界面了
点击`继续`，你不点也不行，因为它就只有那么一个按钮 :joy:

![image-20190228215438181](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mhbwc7qdj31400u0k7i.jpg)

之后是`许可协议`，这回有两个按钮了:grinning:，但是你要想继续下去，也只能选择`同意`
:smirk:

![image-20190228215732534](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mhex5ucaj31400u04qp.jpg)

![image-20190228220101069](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mhijhwvkj311n0u0u0y.jpg)

下面这里要选择系统安装位置了，选择刚才抹掉的系统盘，然后继续点击`安装`

![image-20190228220155070](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mhjh371yj311y0u0b2a.jpg)

之后会出现安装进度条，在这个阶段机器会重启若干次，所以你要仔细盯着屏幕了，等机器重启的时候你要像之前那样，手动选择以U盘启动器方式启动，不然进不到下面的步骤，谨记，如果你晃了神，没能及时选择U盘启动，那么重新关机，再开机选择一次，安装进度也能继续进行。

![image-20190228220510291](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mhmv88tyj31400u01kx.jpg)

当你的机器再次重启的时候，在Clover的引导界面会多出一个选项，这个选项就是我们刚才安装的系统盘，这一次选择启动到我们的系统盘

![image-20190228220743645](https://ws2.sinaimg.cn/large/006tKfTcgy1g0mhpjayzmj30zf0u01l0.jpg)

选中回车之后，又是一个loading界面

![image-20190228220911545](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mhr1u0u9j31400u040a.jpg)

继续之前的安装工作

![image-20190228220924568](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mhr9t2o3j31400u07s6.jpg)

这个步骤可能还是会有重启，所以和之前上面的操作一样，手动选择U盘启动器，clover引导界面选择启动到我们的系统盘，大概十几分钟后安装完毕会提示下面即将要重启的提示，记住，只要重启，你就要手动选择U盘启动，现在的引导文件只在我们的U盘启动器里面，还没有在我们的系统盘里面，所以要引导系统，就需要选择U盘引导启动。

![image-20190228221034996](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mhshw8ixj31400u01kx.jpg)

重启之后再一次来到clover引导界面，这一回，又多了几个启动项了，最左边就是我们的重装启动项了（就是之前我们第一次引导出现的那个）
第二个和第三个是都是预启动的启动项
我们不选它们，只选择启动到我们的系统盘

![image-20190228221518335](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mhxes1lzj31420u0npf.jpg)

这一回来到的就是设置向导界面了，一个大大的`welcome`，这里选择的是国家，我们选择`China`

![image-20190228221843220](https://ws2.sinaimg.cn/large/006tKfTcgy1g0mi0yot26j31400u0hdt.jpg)

选择键盘布局，可以自由选择，后面进了系统还可以选，我这里只选`ABC`了，之后点击`Continue`

![image-20190228221935453](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mi1uvc9rj31400u0alc.jpg)

数据隐私协议，点击`Continue`

![image-20190228222023815](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mi2penwfj31400u01ho.jpg)

是否要转移旧数据到这台新机器上，这里选择不转移，继续点击`Continue`

![image-20190228222057257](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mi39zlbrj31400u07wh.jpg)

登录AppleID，这里先不要登录，不然这里会联网，会花费时间，选择`Set Up Later`,继续点击`Continue`,它会再次提醒你真的要跳过吗？当然是.....`Skip`啊

![image-20190228222222343](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mi4reqirj31400u07wh.jpg)

![image-20190228222309533](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mi5kx9dej31400u0x5h.jpg)

之后又是条款之类的啦 一直 `Agree`

![image-20190228222330695](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mi5y0a9jj31400u0nkc.jpg)

![image-20190228222347816](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mi691u2ij31400u0x0h.jpg)

之后来到创建用户阶段，其他的都好说，`Hint`的输入框是当你锁屏输入密码错误的时候会给与的提示字符，按你喜欢的设置就可以了，设置完后继续点击`Continue`

![image-20190228222514317](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mi7qn4qwj31400u07wh.jpg)

来到系统特性说明啦，出现这个那么感觉是不是快可以结束了?，应该是的，依然`Continue`，安装系统就是百般顺从的过程

![image-20190228222832928](https://ws2.sinaimg.cn/large/006tKfTcgy1g0mib6rwp9j31400u0qo6.jpg)

嚯\~
选择皮肤了\~那应该快了，这个时候需要问一下你的眼睛喜欢哪一种色调了，然后点击它，还是`Continue`

![image-20190228222952454](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mickeap7j31400u0b29.jpg)

谢天谢地，出现了这个界面，神功即将练成。

![image-20190228223119097](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mie28bp2j31400u0hat.jpg)

终于\~
终于等到你\~进入桌面了，这个时候首先跳出来的就是来识别一下你的键盘键位Mac到底识别的对不对，跟着它的提示，找你的`shift`按钮按下去吧。

![image-20190228232111734](https://ws2.sinaimg.cn/large/006tKfTcgy1g0mjtyo88bj31400u0npd.jpg)

桌面呈现在你的眼前
**祝贺你，神功已练成了**\~（这张图是我网上随便找的，我的桌面太乱就不截图了:joy:）

![âmojaveâçå¾çæç´¢ç\"æ](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mij1xnzpj31400u0kex.jpg)

### 复制EFI引导到系统盘

神功虽练成，但是你还是需要使用外部的U盘来进行引导系统的启动，所以下面，你需要将引导文件装载到你系统盘的EFI分区，到了这一步我已经明确知道你已经拥有MacOS环境了，那么就使用`Clover Configurator`软件挂载吧，这个步骤和制作U盘启动器时候把EFI文件复制进U盘里的步骤是一样样的，只不过这一次你是要把EFI文件复制到你已经安装好的系统盘的EFI分区里而已。为了你不用回去看步骤，我还是复制以前的放这里吧，连贯一些

软件下载可以去这里[下载](https://mackie100projects.altervista.org/download-clover-configurator/),不是
**Mac App
Store**下载的软件，MacOS会启用了新的安全机制检查不让运行，命令行执行`sudo spctl --master-disable`命令即可运行。

打开了`Clover Configurator`软件后，切到`Mount EFI`标签，这里会显示两个EFI分区，分别给两个分区都挂载到系统上，点击`Mount Partition`输入用户密码挂载EFI分区。

![image-20190228224240124](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mipvuhk4j31hx0u01ae.jpg)

这个时候分别打开系统盘的EFI和U盘的EFI分区，将U盘EFI分区里的`EFI文件夹`整个复制到系统盘的EFI分区里就搞定了！这回神功就附体了！

**PS**:
如果你现在选择不复制EFI文件也是可以的，在PE这里也是可以复制EFI文件的，方法也就是挂载两个EFI分区，复制文件就行了

> 不过如果你的硬盘不被你的主板认为第一启动盘的时候，你需要将你的系统盘设置为第一启动盘，这里我们可以使用PE系统，将clover引导作为第一启动项，如果你不知道你的主板是不是已经将你的系统盘作为第一启动盘了，那么就跟着照做吧

启动到你的PE系统里(如何U盘启动前面已经说了)，运行`DiskGenius`，去看你的系统盘的EFI分区在PE里的盘符是多少，可以看到我的系统盘的EFI分区盘符是`D`

![image-20190228225618849](/Users/qinkangdeid/Library/Application%20Support/typora-user-images/image-20190228225618849.png)

![image-20190228225751309](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mj5oo8w0j31qk0u0x6p.jpg)

打开盘符D,可以看到我们的EFI文件夹。这里开始使用PE上的一个引导工具将Clover引导作为第一启动项，`BOOTICE`软件没有哪个PE没有自带吧？

![image-20190228225853405](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mj6rci1cj30u00woe82.jpg)

![image-20190228225904800](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mj6y833uj31400u01kx.jpg)

点击添加，然后选到系统的EFI分区盘符选择并且选择EFI文件夹里面的`CLOVERX64.efi`文件，在我这里我的盘符就是`D`

![image-20190228230006137](https://ws3.sinaimg.cn/large/006tKfTcgy1g0mj80prmvj31400u04qp.jpg)

![image-20190228230143109](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mj9p791ej31400u0u0x.jpg)

之后在软件界面最下面会看到一条新建的引导项

![image-20190228230214754](https://ws1.sinaimg.cn/large/006tKfTcgy1g0mja8puuqj31400u01kx.jpg)

给他起个名字叫`Clover`然后点击保存设置，然后点击最左边的上移，将这条新的名字叫`Clover`的引导排在第一位，就像下面这样

![image-20190228230336519](https://ws4.sinaimg.cn/large/006tKfTcgy1g0mjbnrworj31400u0ham.jpg)

这回真的可以大功告成了！所有的步骤都完成了，拔出你的PE U盘
重新启动你的机器吧，这个时候它就会乖乖的启动到Clover引导界面，然后进入你的MacOS系统了，接下来，折腾你的新系统吧\~enjoy
it !!!
