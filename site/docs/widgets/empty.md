# Empty

页面无数据时的占位图。

## FLEmpty

**FLEmpty** 支持图片，文字，按钮以及加载指示器的搭配使用。

#### loading

<p align="left">
    <img width="300" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-loading_empty.gif" />
</p>

```dart
@override
  Widget build(BuildContext context) {
    final Widget loadingEmpty = FLEmptyContainer(
      showLoading: true,
      title: 'Fetching...',
    );

    final Widget content = Container(
      child: Center(
        child: Text('This is content'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Container(
        child: _showContent ? content : loadingEmpty,
      ),
    );
  }
```

你也可以通过 *customLoadingWidget* 属性来使用自定义的 loading 组件。

#### hint

<p align="left">
    <img width="300" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-13%20at%2013.57.03-1.png" />
</p>

```dart
FLEmptyContainer(
    title: 'Contact is empty',
    detailText: 'Go to \'Settings\' - \'Privacy\' to view your contact permissions settings',
    space: 15,
)
```

#### hint & action button

<p align="left">
    <img width="300" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-13%20at%2014.02.17.png" />
</p>

```dart
FLEmptyContainer(
  title: 'Request Failed',
  detailText: 'Please check the network status and retry',
  space: 12,
  actionButton: Container(
    width: 150,
    height: 35,
    child: RaisedButton(
      textColor: Colors.white,
      child: Text('Retry'),
      onPressed: () => print('retry'),
    ),
  )
)
```

#### image & hint

<p align="left">
    <img width="300" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-13%20at%2014.11.40.png" />
</p>

```dart
FLEmptyContainer(
    image: Image.asset('assets/nodata.png'),
    title: 'No Data',
)
```






