# Badge

Small numerical value or status descriptor for UI elements.

## FLBadge

**FLBadge** provides the ability to display and hide badges for sub-widget, and you can also configure the badge color, text, and position.

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

::: tip Tips
If *text* is not set, the *shape* property will become *FLBadgeShape.spot*.
:::



