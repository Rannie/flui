## 3.0.3

* bug 修复

## 3.0.2

* bug 修复

## 3.0.1

* 步进器优化

## 3.0.0
* 升级到flutter3.0

# Change Log

## 2.0.0

- 升级到空安全

## 0.9.2

- Adjust material design semantics
- (**Breaking**) Adjust the usage of **FLToastProvider**, related issue [#29](https://github.com/Rannie/flui/issues/29), [#32](https://github.com/Rannie/flui/issues/32)

## 0.9.1

- Fix **FLCupertinoActionSheet** background color issue [#24](https://github.com/Rannie/flui/issues/24)
- Dynamic parameter check enhancement

## 0.9.0

- New module [Dynamic](https://www.flui.xin/en/dynamic.html) released
- Flutter version upgrade to `v1.12.13 + hotfix.8`
- [Widget Documentation](https://www.flui.xin/en/widgets/button.html) Added API list
- **FLToast** Added disappearing callback
- **FLStaticSectionData** Added header style text style setting
- Added **FLSliverPersistentHeaderWidget** -- a floating style list header
- Fix **FLCupertinoActionSheet** property setting issue [#22](https://github.com/Rannie/flui/issues/22)
- Fix **FLNoticeBar** background color setting issue [#19](https://github.com/Rannie/flui/issues/19)
- Fix **FLMarqueeLabel** calculation during update issue [#18](https://github.com/Rannie/flui/issues/18)

## 0.8.0

- Flutter version upgrade to v1.12.13 + hotfix.5
- Support Dark Mode 
- Support RTL text direction
- Widget test integration
- New widget [CountStepper](https://www.flui.xin/en/widgets/counter.html)
- **FLToast** add custom content view
- **FLMarqueeLabel** and **FLNoticeBar** Added delayed scrolling property *delay*

#### Breaking changes:
- *prefix* and *suffix* of **FLNoticeBar** have been changed to *prefixBuilder* and *suffixBuilder* so that you can get the BuildContext instance to build the widget.
- All dart files under 'lib' are migrated to 'lib/src' for [dartdevc](https://dart.dev/tools/dartdevc) 。

## 0.7.4

- fix some doc issue.

## 0.7.3

- **FLNoticeBar** fix null velocity issue.
 
## 0.7.2 

- **FLCupertinoOperationSheet** add custom header widget.

## 0.7.0

First version, include 15 categories:

- [Button](https://www.flui.xin/en/widgets/button.html)
- [Label](https://www.flui.xin/en/widgets/label.html)
- [Toast](https://www.flui.xin/en/widgets/toast.html)
- [Bubble](https://www.flui.xin/en/widgets/bubble.html)
- [Input](https://www.flui.xin/en/widgets/input.html)
- [Avatar](https://www.flui.xin/en/widgets/avatar.html)
- [Badge](https://www.flui.xin/en/widgets/badge.html)
- [Image](https://www.flui.xin/en/widgets/image.html)
- [AppBar](https://www.flui.xin/en/widgets/appbar.html)
- [NoticeBar](https://www.flui.xin/en/widgets/notice-bar.html)
- [Empty](https://www.flui.xin/en/widgets/empty.html)
- [Skeleton](https://www.flui.xin/en/widgets/skeleton.html)
- [BottomSheet](https://www.flui.xin/en/widgets/bottom-sheet.html)
- [List](https://www.flui.xin/en/widgets/list.html)
- [Theme](https://www.flui.xin/en/widgets/theme.html)
