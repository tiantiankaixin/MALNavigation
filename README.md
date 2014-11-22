MALNavigationItem
=================

可定制的navagationitem
    当我们使用系统的方法设置navigationItem的leftItem或者rightItem时，我们会
发现item位置会有偏差(左边的偏右，右边的偏左)。当设置navigationItem的titleView时，
会发现图片被拉伸。因此我对系统的设置方法做了一个简单的封装，可以方便的设置navigationItem
的leftItem，titleView,rightItem并可以自主控制item的偏移量。

使用方法:
一、将demo里的CusBarItem文件夹加入工程。
二、在要设置的文件里加入头文件#import "UINavigationItem+CustomItem.h"
三、设置
    1、通过文字设置item
    [self.navigationItem setItemWithTitle:@"自定义item" textColor:[UIColor redColor] fontSize:16 itemType:center];
    参数说明：①、文字内容 ②、文字颜色 ③、字体大小 
    ④、item的格式 left对应leftItem  center对应titleView   right对应rightItem
    2、通过图片设置item
     [self.navigationItem setItemWithImage:@"test1.png" size:CGSizeMake(48/2, 26/2) itemType:left];
    参数说明：①、图片名称 ②、图片尺寸 ③、同上
    3、为item添加点击事件
       1、2两种设置方法均会返回一个CustomBarItem实例，获得这个实例进行事件添加
      CustomBarItem *rightItem = [self.navigationItem setItemWithImage:@"test.png" size:CGSizeMake(39/2, 40/2) itemType:right];
      [rightItem addTarget:self selector:@selector(search) event:(UIControlEventTouchUpInside)];
    4、设置item偏移量
       同3先拿到CustomBarItem实例然后进行设置
       [rightItem setOffset:10];//数值越大，则leftItem越靠左  rightItem越靠右  默认值为10
    5、当用文字设置item时设置item的尺寸
       [rightItem setTitleViewSize:CGSizeMake(width, height)];
四、demo里有具体的例子相信大家一看就明白了。