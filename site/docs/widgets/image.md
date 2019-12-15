# Image

对 Image 组件的扩展。

## FLImage

**FLImage** 为图片增加点击效果，并可以设置高亮时显示的图片。

* inkwell

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-15-image_ink.gif" />
</p>

```dart
FLImage(
    borderRadius: BorderRadius.circular(10),
    image: AssetImage('assets/messages.png'),
    width: _kItemImageSize,
    height: _kItemImageSize,
    fit: BoxFit.fill,
    onPressed: (){},
)
```

* highlight image

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-15-image_high.gif" />
</p>

```dart
FLImage(
    borderRadius: BorderRadius.circular(10),
    image: AssetImage('assets/google.png'),
    highlightImage: AssetImage('assets/google+.png'),
    width: _kItemImageSize,
    height: _kItemImageSize,
    fit: BoxFit.fill,
    onPressed: (){},
)
```
