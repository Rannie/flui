# BottomSheet

A modal sheet pops up from the bottom to provide descriptions or actions related to the current scene.

## FLCupertinoActionSheet

**FLCupertinoActionSheet** uses iOS style and supports rendering custom widget in the content area.

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

To switch to the filled style, just set the *style* property to *FLCupertinoActionSheetStyle.filled*.

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-14-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-14%20at%2010.27.28.png" />
</p>

::: warning Note
**FLCupertinoActionSheet** was originally designed as a container for **FLCupertinoOperationSheet**. Customizing the content area excessively does not conform to UI / UX design principles, please use it with caution.
:::

## FLCupertinoOperationSheet

**FLCupertinoOperationSheet** supports horizontal list views, it is usually used to the scenario about selecting system app or other app.

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



