# Label

Label is a widget that extends the functionality of Text.

## FLCopyableLabel

**FLCopyableLabel** supports long press to pop up copy menu, and you can click it to copy text to clipboard.

<br />
<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-10-copyable_label.gif" />
</p>
<br />

::: tip Tips
In Flutter 1.9 and above version, you can use the official widget **SelectableText**, which can support selecting part of content to copy on Android.
:::

## FLMarqueeLabel

**FLMarqueeLabel** supports text scrolling effects, often used as notifications or other scenes to be displayed. **FLNoticeBar** is a widget used as a scrolling notification, you can set leading widget and it is also closable, you can see [FLNoticeBar](https://flui.xin/en/widgets/notice-bar.html).

#### usage

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

*space* is the distance between the scrolling texts, *velocity* controls the scrolling speed, and the interval range is 0 - 1.

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

::: warning
Text width + space must be greater than widget width.
:::

#### loop

*loop* default value is true, scrolling will loop indefinitely, and it can be set to false if only scrolls once.

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





