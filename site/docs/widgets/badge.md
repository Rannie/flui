# Badge

图标右上角的圆形徽标数字。

## FLBadge

**FLBadge** 为子组件提供了显示隐藏 badge 的能力，也可以配置 badge 的颜色，文字，位置。

<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-%E6%88%AA%E5%B1%8F2019-12-13%E4%B8%8A%E5%8D%889.26.21.png" />
</p>

```dart
BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
        icon: FLBadge(
          child: Icon(Icons.home),
          hidden: !_showBadge,
          shape: FLBadgeShape.circle,
        ),
        title: Text('home')
    ),
    BottomNavigationBarItem(
        icon: FLBadge(
          child: Icon(Icons.chat),
          hidden: !_showBadge,
          text: '99+',
        ),
        title: Text('chat')
    ),
    BottomNavigationBarItem(
        icon: FLBadge(
          child: Icon(Icons.shopping_cart),
          hidden: !_showBadge,
          position: FLBadgePosition.topLeft, // default is topRight
          shape: FLBadgeShape.spot,
        ),
        title: Text('cart'),
    )
  ],
)
```

::: tip 提示
如果不设置 *text*，则 *shape* 属性会变成 *FLBadgeShape.spot* 。
:::



