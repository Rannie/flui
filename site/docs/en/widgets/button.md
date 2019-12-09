# Buttons

Buttons include some widgets that based on existing FlatButton & RaisedButton, and also added **FLGradientButton** which supports gradient background and **FLLoadingButton** which supports loading animation.

## FLFlatButton

**FLFlatButton** is based on FlatButton, it has a new property 'extend' and a factory method 'icon' to specify where the icon is located in the button.

#### extend:
<br />
<p align="left">
    <img width="505" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Shot%202019-12-09%20at%2010.12.41%20PM.png" />
</p>

```dart
FLFlatButton(
    expanded: true,
    color: Color(0xFF0F4C81),
    textColor: Colors.white,
    child: Text('Extended Button', textAlign: TextAlign.center),
    onPressed: () => print('on click'),
),
```

#### icon:

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Shot%202019-12-09%20at%2010.17.24%20PM.png" />
</p>

```dart
FLFlatButton.icon(
    padding: const EdgeInsets.all(5),
    textColor: Color(0xFF0F4C81),
    onPressed: () => print('on click'),
    icon: Icon(Icons.account_box, color: mainColor),
    label: Text('Click to change icon position'),
    spacing: 5,
    iconPosition: FLPosition.right,
)
```


## FLRaisedButton

**FLRaisedButton** is based on RaisedButton, it also adds 'extend' and 'icon'. The usage is the same as [FLFlatButton](https://flui.xin/en/widgets/button.html#flflatbutton).

## FLGradientButton

**FLGradientButton** supports gradient backgrounds. There are three factory methods to display different types of gradients: *linear*, *sweep* and *radial*.

#### linear

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Shot%202019-12-09%20at%2010.36.23%20PM.png" />
</p>

```dart
FLGradientButton.linear(
    textColor: Colors.white,
    child: Text('Linear Gradient Button'),
    colors: [Colors.lightBlueAccent, Color(0xFF0F4C81)],
    onPressed: () => print('on click'),
)
```

#### sweep

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Shot%202019-12-09%20at%2010.41.28%20PM.png" />
</p>

```dart
FLGradientButton.sweep(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    center: FractionalOffset.center,
    startAngle: 0.0,
    endAngle: math.pi * 2,
    colors: const <Color>[
        Color(0xFF4285F4), // blue
        Color(0xFF34A853), // green
        Color(0xFFFBBC05), // yellow
        Color(0xFFEA4335), // red
        Color(0xFF4285F4), // blue again to seamlessly transition to the start
    ],
    stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
    textColor: Colors.white,
    child: Text('Sweep Gradient Button'),
    onPressed: () => print('on click'),
)
```

#### radial

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Shot%202019-12-09%20at%2010.43.50%20PM.png" />
</p>

```dart
FLGradientButton.radial(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    center: const Alignment(0.7, -0.6), // near the top right
    radius: 0.2,
    colors: [
        const Color(0xFFFFFF00), // yellow sun
        const Color(0xFF0099FF), // blue sky
    ],
    stops: [0.4, 1.0],
    textColor: Colors.white,
    child: Text('Radial Gradient Button'),
    onPressed: () => print('on click'),
)
```

## FLLoadingButton

**FLLoadingButton** controls whether to display the indicator by setting the *loading* property. It also provides properties to style the indicator.

#### text & indicator

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Recording%202019-12-09%20at%2011.20.20%20PM.gif" />
</p>

```dart
FLLoadingButton(
    child: Text('Login'),
    color: Color(0xFF0F4C81),
    disabledColor: Color(0xFF0F4C81),
    indicatorColor: Colors.white,
    disabledTextColor: Colors.grey.withAlpha(40),
    textColor: Colors.white,
    loading: _loading,
    minWidth: 200,
    onPressed: () {
        setState(() => _loading = true);
        Future.delayed(Duration(seconds: 3), () => setState(() => _loading = false));
    },
)
```

#### only indicator

<br />
<p align="left">
    <img width="330" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-09-Screen%20Recording%202019-12-09%20at%2011.29.01%20PM.gif" />
</p>

```dart
FLLoadingButton(
    child: Text('Login'),
    color: Color(0xFF0F4C81),
    disabledColor: Color(0xFF0F4C81),
    indicatorColor: Colors.white,
    textColor: Colors.white,
    loading: _loading,
    minWidth: 200,
    indicatorOnly: true,
    onPressed: () {
        setState(() => _loading = true);
        Future.delayed(Duration(seconds: 3), () => setState(() => _loading = false));
    }
)
```






