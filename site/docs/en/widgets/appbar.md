# AppBar

AppBar is the navigation bar at the top of the App.

## FLAppBarTitle

**FLAppBarTitle** supports the display of subtitle, supports loading animation and custom accessory widget.

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
The title layout can also be arranged vertically.

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

**FLAppBarTitle** can display a custom component via the *customAccessoryWidget* property.

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

Property *accessoryPosition* can be used to switch the position of the accessory widget.

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

The loading indicator can also be switched to the left by the *loadingPosition* property.


