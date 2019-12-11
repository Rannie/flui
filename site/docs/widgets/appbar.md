# AppBar

AppBar 为 App 顶部的导航栏。

## FLAppBarTitle

**FLAppBarTitle** 支持副标题的展示，支持加载动画以及功能扩展组件。

#### subtitle

<br />
<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-023836.png" />
</p>

```dart
AppBar(
    title: FLAppBarTitle(
      title: 'AppBar',
      subtitle: '(subtitle)',
    ),
    centerTitle: true,
),
```

<br />
标题布局也可以垂直方向排列。

<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202019-12-11%20%E4%B8%8A%E5%8D%8810.46.20.png" />
</p>

```dart
AppBar(
    title: FLAppBarTitle(
      title: 'AppBar',
      subtitle: '(subtitle)',
      layout: FLAppBarTitleLayout.vertical // default is horizontal
    ),
    centerTitle: true,
),
```

#### accessory

**FLAppBarTitle** 可以通过 *customAccessoryWidget* 属性展示一个自定义的组件。

<br />
<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-025133.png" />
</p>

```dart
AppBar(
    title: FLAppBarTitle(
      title: 'AppBar',
      customAccessoryWidget: Icon(Icons.keyboard_arrow_down, color: Colors.white)
    ),
    centerTitle: true,
),
```

<br />
可以通过 *accessoryPosition* 来切换显示 accessory widget 的位置。

<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-025715.png" />
</p>

```dart
AppBar(
    title: FLAppBarTitle(
      title: 'AppBar',
      customAccessoryWidget: Icon(Icons.keyboard_arrow_down, color: Colors.white),
      accessoryPosition: FLAppBarPosition.left
    ),
    centerTitle: true,
),
```

#### loading

<br />
<p align="left">
    <img width="410" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-export.gif" />
</p>

```dart
AppBar(
    title: FLAppBarTitle(
      title: 'AppBar',
      subtitle: '(subtitle)',
      layout: FLAppBarTitleLayout.vertical,
      showLoading: true
    ),
    centerTitle: true,
),
```

loading 指示器也可以通过 *loadingPosition* 属性切换到左侧显示。





