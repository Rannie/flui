# Button

按钮对已有的 FlatButton 以及 RaisedButton 做了一些扩展，也新增了支持渐变背景的 **FLGradientButton** 和支持加载动画的 **FLLoadingButton** 。

## FLFlatButton

**FLFlatButton** 基于 FlatButton，新增了 extend 属性和 icon 的工厂方法用于指定 icon 位于 Button 中的位置。

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

**FLRaisedButton** 基于 RaisedButton，同样新增了 extend 属性和 icon 的工厂方法用于指定 icon 位于 Button 中的位置，用法同 [FLFlatButton](https://www.flui.xin/widgets/button.html#flflatbutton)。

## FLGradientButton

**FLGradientButton** 支持渐变背景，有三种工厂方法来显示不同类型的渐变：*linear*, *sweep* 以及 *radial*。

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

**FLLoadingButton** 通过设置 *loading* 属性来控制是否展示 indicator, 同样也提供了对 indicator 进行样式配置的属性。

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


