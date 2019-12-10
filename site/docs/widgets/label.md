# Labels

Label 为扩展 Text 功能的组件。

## FLCopyableLabel

**FLCopyableLabel** 支持长按弹出复制框，并可以点击复制到剪贴板。

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-10-copyable_label.gif" />
</p>
<br />

::: tip 提示
在 Flutter 1.9 及以上版本，你可以使用官方的 **SelectableText** 组件，该组件在安卓上可以支持选中局部内容复制。
:::

## FLMarqueeLabel

**FLMarqueeLabel** 支持文字的滚动效果，经常用来作为通知或其他需要展示的场景。**FLNoticeBar** 则是用于作为滚动通知的组件，支持前置组件以及可关闭等其他功能，具体使用可见 [FLNoticeBar](https://flui.xin/widgets/notice-bar.html)。

#### 使用

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-10-export-1.gif" />
</p>

```dart
FLMarqueeLabel(
    text: 'Notice: For Flutter 1.9 or above, you can use SelectableText to support copy function',
)
```

#### space & velocity

*space* 为滚动文字间隔的距离， *velocity* 控制滚动速度，区间为 0 - 1 。

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-10-velocity.gif" />
</p>

```dart
FLMarqueeLabel(
    text: 'Notice: FLUI is a widget kit for Google Flutter',
    style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 16
    ),
    velocity: 1,
    space: 150,
)
```

::: warning 注意
不要把 *space* 的值设置的过小，需要满足文字宽度 + space 的宽度大于该组件的展示宽度。
:::

#### loop

*loop* 默认为 true， 滚动会无限循环，如果想只滚动一次则可以设置为 false 。

```dart
FLMarqueeLabel(
    text: 'Notice: This is a notification',
    style: TextStyle(
        color: Colors.lightGreen,
        fontSize: 16
    ),
    loop: false,
    velocity: 0.7,
),
```



