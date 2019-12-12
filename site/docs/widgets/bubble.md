# Bubble

Bubble 为气泡视图，经常用来作为聊天气泡或者弹出菜单。

## FLBubbleWidget

**FLBubbleWidget** 可以为子组件提供气泡背景。

<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-12-%E6%88%AA%E5%B1%8F2019-12-12%E4%B8%8B%E5%8D%882.45.11.png" />
</p>

```dart
FLBubbleWidget(
    from: FLBubbleFrom.left, // can change to top/bottom/right
    backgroundColor: Colors.white,
    child: Container(
      width: tWidth,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Text('Hi, I\'m Tomas Shelby, from England.', style: TextStyle(fontSize: 15), softWrap: true),
    )
)
```

## FLBubbleMenuWidget

**FLBubbleMenuWidget** 可以为子组件展示气泡菜单，支持长按和点击展示，菜单里的选项需要指定 *text* 和 *value*, 其中 *value* 为 dynamic，可以是任意类型。

<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-12-bubble_menu.gif" />
</p>

```dart
FLBubbleMenuWidget<String>(
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFF0F4C81)
      ),
      width: 240,
      height: 40,
      child: Center(
        child: Text('Long press to show menu', style: TextStyle(fontSize: 17, color: Colors.white)),
      ),
    ),
    itemBuilder: (BuildContext context) {
      return [
        FLBubbleMenuItem(
          text: 'item 1',
          value: 'item 1',
        ),
        FLBubbleMenuItem(
          text: 'item 2',
          value: 'item 2',
        ),
      ];
    },
    onSelected: (value) => FLToast.showText(text: 'Select - $value', position: FLToastPosition.bottom),
    onCanceled: () => FLToast.showText(text: 'Canceled', position: FLToastPosition.bottom),
)
```



