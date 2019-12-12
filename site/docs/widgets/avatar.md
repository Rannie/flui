# Avatar

Avatar 为头像组件。

## FLAvatar

**FLAvatar** 支持显示图片或颜色加文字的模式。

::: tip 提示
同时指定图片和颜色时，会优先显示图片。
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


