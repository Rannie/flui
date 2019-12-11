# Toast 

Toast is a light feedback widget.

## FLToastDefaults

**FLToastDefaults** supports configuration of toast view style, position, display duration, dark mode and other behaviors. The default configuration is as follows:

```dart
const FLToastDefaults({
    this.showDuration = const Duration(milliseconds: 1500),
    this.darkColor = Colors.white,
    this.darkBackgroundColor = Colors.black87,
    this.backgroundOpacity = 0.8,
    this.lightColor = const Color(0xFF2F2F2F),
    this.lightBackgroundColor = const Color(0xFFE0E0E0),
    this.position = FLToastPosition.center,
    this.style = FLToastStyle.dark,
    this.dismissOtherToast = true,
    this.hideWithTap = true,
    this.textDirection = TextDirection.ltr,
    this.topOffset = kToolbarHeight + 10,
    this.bottomOffset = 10,
});
```

## FLToastProvider

**FLToastProvider** provides the ability to display toasts in the sub-widget tree. It generally acts as the parent node of the MaterialApp.

```dart
class _MyAppState extends State<MyApp> {
  FLToastDefaults _toastDefaults = FLToastDefaults();
  
  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
      defaults: _toastDefaults,
      child: MaterialApp(
        title: 'FLUI',
        theme: $YOUR_THEME
        routes: $ROUTES
      )
   );
}
```

## FLToast

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-toast.gif" />
</p>
<br />

To show Toast, you need to use **FLToast**'s static methods.

* text

```dart
FLToast.text(text: 'Here is text');
/// or
FLToast.showText(text: 'Here is text', position: FLToastPosition.xxx, duration: Duration(seconds: xxx), style: FLToastStyle.xxx);
/// shortcut
FLToast.showText(text: 'Here is text');
```

* loading

```dart
var dismiss = FLToast.loading(text: 'Loading...');
/// do something...
Future.delayed(Duration(seconds: 2), () {
    /// hide toast
    dismiss();
});
```

* info, success & error

```dart
/// info
FLToast.info(text: 'Some info');
/// success
FLToast.success(text: 'Fetch success');
/// error
FLToast.error(text: 'Something was wrong');
```

#### dark mode

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-toast_dark.gif" />
</p>
<br />

```dart
FLToastProvider(
    defaults: FLToastDefaults(style: FLToastStyle.light),
    ...
)
/// or show just once
FLToast.showText(text: 'Here is text', style: FLToastStyle.light);
```

#### other position

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-11-toast_pos.gif" />
</p>
<br />

```dart
FLToastProvider(
    defaults: FLToastDefaults(position: FLToastPosition.top),
    ...
)
/// or show just once
FLToast.showText(text: 'Here is text', position: FLToastPosition.top);
```


