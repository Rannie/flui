# NoticeBar

Widget to display a system message, event notice and so on.

## FLNoticeBar

**FLNoticeBar** is based on [FLMarqueeLabel](https://flui.xin/en/widgets/label.html#flmarqueelabel), adding default styles and factory methods.

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-bar_normal-1.gif" />
</p>

```dart
FLNoticeBar(
    text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
);
```

#### .notice

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-bar_notice.gif" />
</p>

```dart
FLNoticeBar.notice(
    text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
    velocity: 0.6,
);
```

#### .closable

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-bar_close.gif" />
</p>

```dart
FLNoticeBar.closable(
    text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
    velocity: 0.8,
    onPressed: () {
        FLToast.text(text: 'Close NoticeBar');
    },
)
```


#### custom prefix & suffix

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-13-bar_cust.gif" />
</p>

```dart
FLNoticeBar(
    text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
    prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text('prefix', style: TextStyle(color: Colors.grey)),
    ),
    suffix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text('suffix', style: TextStyle(color: Colors.grey)),
    )
)
```


