# Image

Extensions to the Image widget.

## FLImage

**FLImage** adds a click effect to a image, and can set the image displayed when highlighted.

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
