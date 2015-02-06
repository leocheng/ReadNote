
**********************************************************
*    个人使命宣言                                         *
*    家庭第一                                             *
*    借重宗教的力量                                       *
*    在诚信问题上绝不妥协                                  *
*    念及相关的每一个人                                    *
*    未听取正反双方意见，不妄下断语                         *
*    征求他人意见                                          *
*    维护不在场的人                                        *
*    诚恳但立场坚定                                        *
*    每年掌握一种新技能                                    *
*    今天计划明天的工作                                    *
*    利用等待的空闲时间                                    *
*    态度积极                                             *
*    保持幽默感                                           *
*    生活与工作有条不紊                                   *
*    别怕犯错，怕的是不能吸取教训                          *
*    协助属下成功                                         *
*    多请教别人                                           *
*    专注于当前的工作，不为下一次任务或提升瞎操心           *
**********************************************************

===============================
查看Pad版本信息
计算器：1x1-1+
===============================
repo下载代码

===============================
Android 编译命令及选项
1 运行 build/envsetup.sh, 该文件提供 m,mm,mmm 等命令
#. ./build/envsetup.sh
注意 : . . 之间是空格
m -->编译整个 android 工程
mm -->编译当前目录下的模块
mmm path -->编译指定目录下的模块

高通平台：执行mm,mmm等命令之前，每次需要执行
	source build/envsetup.sh
	choosecombo 1 3 3 2 2
	mmm path
单编译perso
make perso -j8
重新编译
make -j16 r

MTK平台：
./makeMtk -t pixo7_3g new
./makeMtk e1k mm packages/apps/Settings
PIXO8_3G的Blur效果是实现了的，只需要编译的时候打开即可：
      ./makeMtk  -o=JRD_BLUR_SUPPORT=yes  pixo8_3g  new

单编译perso
./makeMtk -t pixo7_3g perso

2 配置参数
运行该命令后会出现 :
Build for the simulator or the device?
     1. Device
     2. Simulator

Which would you like? [1]

Build type choices are:
     1. release
     2. debug

Which would you like? [1]

Product choices are:
     1. emulator
     2. generic
     3. sim
You can also type the name of a product if you know it.
Which would you like? [generic]

以上产品选项是默认的 , 如果 vendor/ 目录下有产品 , 则会自动扫描进去 . 

===============================
烧版本
	-->帐号：zmtang 密码：z0605
	-->帐号：mchen 密码：m1221
正式版本：appli
每日开发板本：daily_version
MTK：
	1）点download
	2）pad关机
	3）插如USB线
	
QCOM:
    叫IT（long.zhao）帮忙把51-android.rules这个文件放在/etc/udev/rules.d/目录下
    把out/host/linux-x86/bin/fastboot拷贝到你的：~/bin/
    1.adb reboot bootloader
    2.将/out/host/linux-x86/bin/fastboot拷贝到项目根目录下，并执行fastboot devices
    3.把附件中的qcomfalsh.sh脚本放在项目根目 录，并运行： qcomflash.sh out/target/product/pop8lte
    4.fastboot reboot

===============================
GIt提交
git log -->查看历史提交
git log --author "mingxiao.li" -->查看具体某个人的提交记录
git show -->查看相应标签的版本信息
git status -->查看已修改过的地方，只显示到文件
git diff -->查看具体修改了那些地方，具体到代码
git fetch [remote-name] -->从远程仓库抓取数据到本地，但并不负责将数据合并到当前分支
git pull -->自动从远程仓库抓取数据到本地，并合并数据到当前分支
git reset -->取消对文件的暂存操作
git checkout -->取消对文件的修改
git branch -r -->查看当前项目所属的Project

patch_delivery_cli.php -->提交修改到gerrit上面，一般使用patch_delivery_cli.php -b

repo sync -->同步整个工程的代码  
repo sync packages/apps/Settings/ -->下载某个模块的代码

===============================
Git

1）查看log
    git log
    git log --stat                  查看每次的提交记录以及文件变更记录
    git log -5                      显示最近的5条log
    git log -p                      显示log以及详细修改的内容，与上一条可以结合使用
    git log --stat                  显示log以及修改的文档，与上上一条可以结合使用
    git show <commit id>            显示对应修改记录的详细修改
    git show <commit id> --stat     显示对应修改记录的概要信息

2）查看修改
    git diff                        与暂存区比较
    git diff HEAD                   与版本库比较
    git diff --cached               暂存区与版本库比较
    git diff <commit_1> <commit_2>  查看 commit_1 与 commit_2 之间的修改内容
     
3）查看文件的变动
    git status
    git status -s                   查看精简模式的修改   

4）撤销、重置
    git checkout                    汇总显示工作区、暂存区与HEAD之间的差异
    git checkout file_1 file_2      工作区的修改被暂存区的内容替换
    git checkout HEAD               用版本库的内容替换暂存区以及工作区的修改
    git reset
    git reset -- filename
    git reset HEAD                  暂存区被版本库替换，回撤添加到暂存区的内容，工作区不变
    git reset HEAD^                 工作区不变，暂存区与引用都回撤一次
    git reset --soft <commit>       暂存区和工作区不变，引用切换到对应的指引
    git reset --soft HEAD^          暂存区和工作区不变，引用回撤一次
    git reset --hard <commit>       暂存区和工作区改变、引用都切换到对应的指引

5）查看提交
    git show <commit>               查看对应的提交内容

6）分支
    git branch -a                   查看所有分支
    git branch -v                   查看当前所在分支，以及最近的一次提交
    
    git checkout branch_name        切换到分支 branch_name
    git checkout -b new_branch_name 拉新分支

7）保存进度
    git stash                       保存当前的工作区和暂存区的进度
    git stash list                  显示进度列表
    git stash pop                   从最近的保存的进度恢复，同时移除stash列表中的最新一条记录
    git stash apply                 从最近的保存的进度恢复，但不会移除stash列表中的记录
    git stash drop <stash>          删除某个存储的进度，默认为最近的一个进度
    git stash clear                 删除所有的存储的进度
    
8）删除
    删除未被add的文件
    git clean -n                    显示将要删除的文件和目录
    git clean -f                    删除未被 add 的文件
    git clean -df                   删除未被 add 的文件和目录
    删除已添加的文件
    git rm file_1 file_2
    
9）打Tag
    git tag -m "comment"
    
10）添加
    git add -u                      添加所有文件
    git add -i                      选择性添加
    
11）提交
    git commit -m "comment"
    git commit --amend -m "comment"
    
12）移动、改名
    git mv file_old_name new_name   改名
    
13）文件忽略
    设置全局忽略文件
    git config --global core.excludesfile /data/nishome/tdsw1/mingxiao.li/projects/my_gitignore
    
14）克隆
    git clone https://github.com/AidyGo/netty.git
    git pull
    git push 
    
    
    
15）rev-parse
    git rev-parse --symbolic --branches     显示分支
    git rev-parse --symbolic --tags         显示tag
    git rev-parse --symbolic --glob=refs/*  显示tag
    
16）文件追溯
    git blame file_name             显示文件的每一行是在什么时候引入的
    git blame -L 6,+5 file_name     只追踪某几行的记录
    

(2) git revert

撤销某次操作，此次操作之前和之后的commit和history都会保留，并且把这次撤销
作为一次最新的提交
    * git revert HEAD                  撤销前一次 commit
    * git revert HEAD^               撤销前前一次 commit
    * git revert commit-id （比如：fa042ce57ebbe5bb9c8db709f719cec2c58ee7ff）撤销指定的版本，撤销也会作为一次提交进行保存。
git revert是提交一个新的版本，将需要revert的版本的内容再反向修改回去，版本会递增，不影响之前提交的内容
git reset --hard HEAD^
git reset --soft HEAD^ 提交失败，回撤

 ! [remote rejected] HEAD -> refs/for/MTK6582-KK1-PIXO8_3G-DINT (you are not allowed to upload merges)
error: failed to push some refs to 'ssh://mingxiao.li@10.128.161.209:29418/mtk6582_tablet/packages/apps/JrdLauncher'
FAIL TO PUSH IN [.]
git pull --rebase

git stash 保存当前工作区内容
git stash pop 恢复工作区内容

3) 将添加到暂存区的文件撤销
    git checkout branch_name -- file_name
    
4) 切换分支
    git checkout -b 本地分支名 远程分支名
    
 查看当前的远程库：
	git remote

添加远程仓库：
	git remote add [shortname] [url]

从远程仓库抓取数据：
	git fetch [remote-name]

推送数据到远程仓库:
	git push [remote-name] [branch-name]

查看远程仓库信息：
	git remote show [remote-name]
    
    
===============================
搜索引擎搜索
1）逻辑操作符
	与 -->空格，&，AND
	或 -->OR, |
	屏蔽 -->-
2）强制整体搜索
	用“”括起来
	*代表一个字符
3）强制搜索忽略的字符
	前面加上+号
4）指定搜索的文件类型
	filetype:pdf
	例如 云计算 filetype:pdf OR doc
5）intitle
	只搜索网页标题中包含制定关键字1，网页内容中包含关键字2的网页
	intitle:关键字1 关键字2
6）inurl
	搜索网页链接中包含关键字1，网页文档中包含关键字2的网页
	inurl:关键字1 关键字2
7）site
	搜索的内容来源于制定的网站
	例如 手机游戏开发  site:www.csdn.net

===============================
Monkey测试
	adb shell monkey -p your.package.name -v 500

===============================
改图
	ling.yu@tcl.com
===============================
定制
	xurong.zhu@tcl.com
===============================
logcat
	将log输出到指定文件
		adb logcat >file_path
	输出指定格式的log
		adb logcat -s "activitymanager"
	清楚log
		adb logcat -c
    输出优先级大于warn级别
		adb logcat *:W
	
Usage: logcat [options] [filterspecs]
options include:
  -s              Set default filter to silent.
                  Like specifying filterspec '*:s'
  -f <filename>   Log to file. Default to stdout
  -r [<kbytes>]   Rotate log every kbytes. (16 if unspecified). Requires -f
  -n <count>      Sets max number of rotated logs to <count>, default 4
  -v <format>     Sets the log print format, where <format> is one of:

                  brief process tag thread raw time threadtime long

  -c              clear (flush) the entire log and exit
  -d              dump the log and then exit (don't block)
  -t <count>      print only the most recent <count> lines (implies -d)
  -g              get the size of the log's ring buffer and exit
  -b <buffer>     Request alternate ring buffer, 'main', 'system', 'radio'
                  or 'events'. Multiple -b parameters are allowed and the
                  results are interleaved. The default is -b main -b system.
  -B              output the log in binary
===============================
ADB
    1）清除之前的存储数据重新安装apk文件
        adb install -r file.apk
    2）获取设备的dpi
        adb shell dumpsys activity
        adb shell dumpsys window
        adb shell dumpsys window displays
    3）查看bug报告
        adb shell bugreport
    4）查看机器的全部信息参数
        adb shell getprop
    5）查看机器的SN号
        adb shell getprop ro.serialno
    6）查看所有应用
        adb shell ps | grep "launcher"
    7) 查看数据库
        adb shell sqlite3 /data/data/com.jrdcom.launcher/launcher.db
        推出sqlite3: .exit
        显示数据库： .databases
        显示表：.tables
        显示索引: .indices table_name
        显示表结构：.schema table_name

===============================
grep搜索
    grep -rn -i "something" path
    adb shell ps | grep "launcher"

===============================
服务器
    cd .gvfs/shuangli.liu\ on\ 10.128.161.138/
    cp out/host/linux-x86/bin/fastboot ~/bin
    qcomflash.sh out/target/product/pop10/

===============================
find ./ -name "default_lockscreen_wallpaper"

===============================
WIN7 虚拟机
    首先从137服务器复制镜像（注意最后有个点，可以修改成你用于放置镜像的路径）
        scp -r public@10.128.161.137:WIN7 .
    输入密码"mobile#3"
    然后打开VirtualBox, 在"Oracle VM VirtualBox Manager"界面按"Ctrl+A"导入此镜像即可直接使用，初步测试HP和联想的主机都可以使用。

    BTW：虚拟机下载的问题一般都是在选择USB设备连接到主机还是虚拟机的问题，了解清楚后处理起来就得心应手了。
    
===============================
Eclipse Tab键设置
我们有时无法区分空格（SPACE）和制表符（TAB）Window->preferences->General->Editors->TextEditors->Showwhitespacecharacters
	windows -->Preferences -->Java -->Code Style -->Formatter

===============================
git clone:
    1) git clone <repository> <directory>
        git clone mingxiao.li@<repository> <directory> //以指定的用户名访问<repository>
        git clone -b branch_name
    2) git clone --bare <repository> <directory.git>
    3) git clone --mirror <repository> <directory.git>

===============================
链接个人电脑：
    ssh -l jinping.ni 10.128.181.105

===============================
无法push apk到pop10
	mount -o rw,remount /custpack


===============================
网址：
EP：
    http://ep.tclcom.com/Pages/default.aspx
项目主页：
    http://10.128.161.108:9001/p/tablet
ManPower:
    http://10.128.161.39/mpwt/
Epas:
    http://kaoqin.hq.ta-mp.com:81/index.asp
Bugzille:
    http://bugzilla.tcl-ta.com/index.cgi
Gerrit_SZ:
    http://10.128.161.91:8080/#/c/58067/
MSGM:
    http://172.24.63.229/msgm/login.aspx?ReturnUrl=%2fmsgm%2fMain.aspx
SCD_WIKI
    http://10.128.161.108/wiki/index.php/%E9%A6%96%E9%A1%B5
TCL ITSM System:
    http://itsm.tclcom.com/arsys/shared/login.jsp?/arsys/
Clid:
    http://10.128.161.131/clid/software/
    http://10.128.161.131/clid/software/clid/php/
Gerrit_NB
    http://172.16.11.162:8081/#/c/105024/1

内部共享文档
smb://10.128.161.108/share/
    1_sw_delivery: 各个项目发布的版本
    2_sw_archive: 项目文档、培训资料
    4_tools: 各个软件工具
    
===================================
QCOM
如何控制多个Launcher的编译选项：device/tct/pop8lte/perso/isdm_sys_properties.plf
             <VAR>
             <SIMPLE_VAR>
             <SDMID>JRD_PRODUCT_PACKAGES_Launcher3</SDMID>
             <C_TYPE>AsciiString</C_TYPE>
             <C_NAME>JRD_PRODUCT_PACKAGES_Launcher3</C_NAME>
             <ARRAY>NOT_ARRAY</ARRAY>
             <METATYPE>Byte,0,1</METATYPE>
             <IS_CUSTO>1</IS_CUSTO>
             <VALUE>1</VALUE>
             <FEATURE>Launcher3</FEATURE>
             <DESC>this SDMID is indicated that if Launcher3 is needed,  "1" is yes, and "0" is no.   </DESC>
             </SIMPLE_VAR>
             </VAR>
    
===================================        
	将服务端文件拷贝到本地
	    scp ./out/target/product/pop8lte/custpack/JRD_custres/app/SystemUI-res.apk mingxiao.li@10.128.181.180:~/Downloads/
	    
===================================
    Ctrl + l 目录地址

===================================
    NXClient
     HOST: 10.128.186.252
     PORT: 22
     
===================================
    SSH: 一种协议，用于计算机之间的加密登录，主要用于远程登录
    基本用法：
        1) 已用户名username登录主机host
            ssh username@host
        2）默认端口号22，登录到指定端口
            ssh -p 端口号 username@host
        3）远程主机的公钥的保存位置：$HOME/.ssh/known_hosts
        4）生成自己的公钥：
            ssh-keygen
===================================
链接nx
    smb://10.128.186.252/mingxiao.li
    帐号：tct-hq\mingxiao.li
    密码：mobile#3
    
===================================
加班格式：
    以后凡周末加班的同事，请在离开办公室之前发送加班报告。
    标题：XX项目XX年XX月XX日XXX（your name）周末加班报告。
    邮件接收人：
        To：TL，关系项目的SPM，唐冲
        CC:  Yuemeng.Pan
    内容包括：
        1）加班原因（哪个项目，因为什么问题？）
        2）问题原因，尤其是对于衰退(regression)问题，需要说明问题的由来
        3）加班结果（问题解决情况，代码提交的gitweb链接）

===================================
0*0-0+    MMITEST
1*1-1+    查看可匹配的PERSO
2*2-2+    EngineerMode
3*3-3+    查看Version和Date
4*4-4+    查看SN
6*6-6+    FactoryChargingMode
0*837837* 查看Version information
0*09*     SalesTracker


===================================
   打印机的添加方法：
   xp-开始-运行下面路径后，找到5F-A添加即可。
   \\printersz.hq.ta-mp.com\

===================================
在Clid网站上定位查询perso
    1.如POP8LTE AA8+AA的版本，快速定位到AA perso，则需要点击“ List of XX Name already used ”按钮，在弹出来的窗口中ctrl+F，搜索“AA”。
      即能看到搜索结果为“custo:AL_EU_CLID - XX name:AA”，custo后面的大写字母AL_EU_CLID则是真正的perso。
      直接点击[BACKUP_SW_AA8]-->AL_EU_CLID ,点击右侧的Edit perso-->Screens-->on:便能看到XX Name为AA。

    2.如PIXO8_3G  BD8+AF的版本，搜索“AF”后，结果为：custo:AL_EU_CLID/AL_DE_Germany_CLID - XX name:AF
       即应该点击[BACKUP_SW_BD8]-->:AL_EU_CLID-->AL_DE_Germany_CLID,才能看到真正的AF perso定制情况。

===================================
资源分离
    /pop8_lte_global/device/tct/pop8lte/perso/jrd_product_constant.mk
资源翻译
    /pop8_lte_global/device/tct/pop8lte/perso/string_res.ini
    
===================================
Comment中添加备注
复现路径：
产生原因：
处理结果：
潜在影响：
    
===================================
PR格式
    // [BUGFIX]-Modify-Begin by mingxiao.li,12/03/2014,PR:840720

===================================
POP10独立APK编译

===================================
ubuntu下SourceInsight打开失败
    删除%HOME/Soutce Insight/Settings下的所有文件
    
    
===================================
EPas填写
1）软件开发效率 30%
        平均每天解决PR/CE/FR的数量，PR/CR/FR停留的时间
 	    Duration	 	停留时间<=2 days
        Quality	 	    每日解决数量>=1
2）代码提交质量  20%
        修改被拒 绝的数量＋修改带来衰退的数量
     	Quality	 	<= 1/month
3）学习提高  30%
        学习AMS + PowerManagerService
        Duration	 	>= 25 days
 
===================================
 打印时间
    private static long preTime = 0;
    private static long allTime  = 0;
    public static void printTime(String msg) {
        long dTime = System.currentTimeMillis() - preTime;
        allTime += dTime;
        if(msg.startsWith("onPause() -- begin")) {
            dTime = 0;
            allTime = 0;
        }
        android.util.Log.i("aidy", msg + " -- dTime = " + dTime + " -- allTime = " + allTime + " -- current = " + System.currentTimeMillis());
        preTime = System.currentTimeMillis();
    }	 	 	 	 	 

===================================
Merge代码
目前Pixi3-7s项目采用同一个Launcher,命名为Launcher3,实际代码是从POP10的Jrdlauncher衍生而来。
因此，在后续的项目维护中，请确认当前问题是否能在POP10 Launcher3 / JrdLauncher, PIXI3-7S Launcher3重现，若重现，还请相互Merge代码。
    Merge代码的Git命令：git cherry-pick  commitId
例如：POP10上Launcher3的一个修改：
    commit bb17ab15d0adf167428b015c55165c5f2cfb2dd8
    Author: mingxiao.li <mingxiao.li@tcl.com>
    Date:   Wed Jan 21 09:37:40 2015 +0800
    ###%%%comment:[VDF][ACC1][13969][1a - Fatal]Screen rotation takes too long
想Merge到Tint8 Launcher3，则：
    git cherry-pick bb17ab15d0adf167428b015c55165c5f2cfb2dd8
    git reset HEAD
    git status --s        //此时能够看到Merge过来的修改
注意：git cherry-pick 仅限于使用在当前git库下的分支。否则，会提示fatal: bad object错误。



Wmd  sz的编译机制加了copy modem的功能，默认需要编译modem，不需要编译modem的话，请注释掉下面的行。
Vim  build/core/main.mk + 1003

#ying.pang for prebuild nonhlos begin
ifneq ($(JRD_ALL_NONHLOS), true)
droidcore: copy-nonhlos
endif
#ying.pang for prebuild nonhlos end

注释掉 droidcore: copy-nonhlos即可
或者仅仅编译android;
./makeTcl –t  Pixi3_7_4G   JRD_ALL_NONHLOS=false new























