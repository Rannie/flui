# Avatar

## FLAvatar

**FLAvatar** supports displaying image or color + text.

::: tip Tips
When both the image and color are specified, the image will be displayed in preference to the color or text.
:::

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-12-avatars.jpeg" />
</p>
<br />

* image

```dart
FLAvatar(
    image: Image.asset('assets/avatar.jpg', scale: 2),
    width: 75,
    height: 75,
    radius: 10, // if not specify, will be width / 2
),
```

* text

```dart
FLAvatar(
    color: Color(0xFF0078D4),
    width: 50,
    height: 50,
    text: 'CE',
    textStyle: TextStyle(fontSize: 17, color: Colors.white),
),
```


