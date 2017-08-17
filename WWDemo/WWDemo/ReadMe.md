# 在这里写一下一些说明文字
#	声明：不可用于商业途径传播
* [图片资源网址](http://www.iconfont.cn/home/index?spm=a313x.7781069.1998910419.1.2d672ab2kTlVeF)
&nbsp;[图标工场](http://icon.wuruihong.com)

---

##		ThirdLib
* &nbsp;[Toast](https://github.com/scalessec/Toast)
&nbsp;[MBProgressHUD](https://github.com/jdg/MBProgressHUD)
&nbsp;[SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)

---

##		说明
* 虽然用了CYLTabBarController 又想试试UISplitViewController
    * 参考内容：[文档](https://developer.apple.com/documentation/uikit/uisplitviewcontroller?language=objc) &nbsp;[NSHispter](http://nshipster.cn/uisplitviewcontroller/) &nbsp; [当天真遇到现实](http://www.cnblogs.com/XYQ-208910/p/4897925.html)
    * 简单做了splitViewController 根据属性和代理方法做更多操作
    * 用splitViewController来做根视图
        * 已完成的有1.改变主从视图的宽度
        * 2.屏幕旋转的时候的适配，不过还不知道为什么第一次转屏的时候，约束不能正确地改变过来
        * 未完成的1.不知道该怎么在splitViewController的详情视图中push控制器，未完成之完成只好使用modal的方式
        * 2.未完成之完成使用modal的方式的时候，modal出来一个带导航的控制器，然后以后的操作，就可以按着导航来做了
        * 3.未完成之完成，可以通过使用自定义的UINavigationBar和UINavgationController来做导航的高度的改变以及导航的item的位置的改变



