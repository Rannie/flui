# BottomSheet

从底部弹出的模态框, 提供当前场景相关的提示或操作。

## FLCupertinoActionSheet

**FLCupertinoActionSheet** 使用 iOS 样式，支持在内容区域渲染自定义组件。

* Rounded Card

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-14-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-14%20at%2010.18.00.png" />
</p>

```dart
showFLBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return FLCupertinoActionSheet(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/poster.png'),
              SizedBox(height: 25),
              Text(
                'Flutter Interact is here! Check out the livestream.\nFlutter 1.12 is live! Check out the latest announcement and see what\'s new on the site.\nTime is ticking: Enter the Flutter Clock Challenge!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      );
    }).then((value) {
  print(value);
});
```

* Filled

切换成 filled 样式只需要把 *style* 属性设置成 *FLCupertinoActionSheetStyle.filled*。

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-14-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-14%20at%2010.27.28.png" />
</p>

::: warning 注意
**FLCupertinoActionSheet** 最初被设计来作为 **FLCupertinoOperationSheet** 的容器，过分自定义内容区域不符合 UI / UX 设计原则，请酌情使用。
:::

## FLCupertinoOperationSheet

**FLCupertinoOperationSheet** 支持定制化的横向列表视图，通常用于弹出选择系统或者其他 App 的场景。

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-14-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-14%20at%2010.30.55.png" />
</p>

```dart
showFLBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return FLCupertinoOperationSheet(
        backgroundColor: Color(0xFFFAFAFA),
        sheetStyle: FLCupertinoActionSheetStyle.filled,
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
        header: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text('Share', style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
        ),
        itemList: [
          [
            FLCupertinoOperationSheetItem(
              imagePath: 'assets/google.png',
              title: 'Google',
              onPressed: () {
                Navigator.pop(context, 'Google');
              },
            ),
            FLCupertinoOperationSheetItem(
              imagePath: 'assets/share_friend.png',
              title: 'Wechat',
              onPressed: () {
                Navigator.pop(context, 'Wechat');
              },
            ),
            // ...
          ],
          [
            FLCupertinoOperationSheetItem(
              imagePath: 'assets/messages.png',
              title: 'Messages',
              onPressed: () {
                Navigator.pop(context, 'Messages');
              },
            ),
            // ...
          ]
        ],
);
```



