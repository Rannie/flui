English | [简体中文](https://github.com/Rannie/flui/blob/master/README-zh_CN.md)

<br />
<p align="center">
    <a href="https://flui.xin">
        <img width="200" src="https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-18-Artboard.png">
    </a>
</p>

<h1 align="center">FLUI</h1>

<div align="center">
<p>A widget kit for Google Flutter <a href="https://www.flui.xin/app/flui.apk">Demo apk</a></p>


[![pub package](https://img.shields.io/pub/v/flui.svg)](https://pub.dev/packages/flui) 
[![Documentation](http://img.shields.io/badge/read_the-docs-2196f3.svg)](https://www.flui.xin/en/widgets/button.html) 
[![GitHub stars](https://img.shields.io/github/stars/Rannie/flui)](https://github.com/Rannie/flui/stargazers) 
[![GitHub forks](https://img.shields.io/github/forks/Rannie/flui.svg)](https://github.com/Rannie/flui) 
[![GitHub license](https://img.shields.io/github/license/Rannie/flui.svg)](https://github.com/Rannie/flui/blob/master/LICENSE)


<img src="https://raw.githubusercontent.com/Rannie/Rannie.github.io/master/images/2019-12-18-overview-2.png" />

</div>

## Features

* A set of high-quality Flutter widgets out of the box
* Comprehensive usage examples and documentation
* Fine-grained non-stylized widgets for different types of applications
* Supports [Dark Mode](http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-dark_shots.png) and [RTL](http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-rtl_shots.png)

## Compatibility

**FLUI** has good compatibility on multiple clients, and the framework will be developed based on Flutter Stable Channel.

Currently supports *v1.12.13+hotfix.5* and above.

## Getting Started

#### Setup

```yaml
dependencies:
  flui: 0.8.0
```

Then run `flutter pub get` to download the dependencies.

#### Usage

After the dependency installation is completed, you can directly import the widget.

```dart
import 'package:flui/flui.dart';

// in somewhere
FLAppBarTitle(
    title: 'AppBar',
    subtitle: '(subtitle)',
    layout: FLAppBarTitleLayout.vertical,
    showLoading: true
)
```

## Widgets

- [Button](https://www.flui.xin/en/widgets/button.html)
- [Label](https://www.flui.xin/en/widgets/label.html)
- [Toast](https://www.flui.xin/en/widgets/toast.html)
- [Bubble](https://www.flui.xin/en/widgets/bubble.html)
- [Input](https://www.flui.xin/en/widgets/input.html)
- [Avatar](https://www.flui.xin/en/widgets/avatar.html)
- [Badge](https://www.flui.xin/en/widgets/badge.html)
- [Image](https://www.flui.xin/en/widgets/image.html)
- [CountStepper](https://www.flui.xin/en/widgets/counter.html)
- [AppBar](https://www.flui.xin/en/widgets/appbar.html)
- [NoticeBar](https://www.flui.xin/en/widgets/notice-bar.html)
- [Empty](https://www.flui.xin/en/widgets/empty.html)
- [Skeleton](https://www.flui.xin/en/widgets/skeleton.html)
- [BottomSheet](https://www.flui.xin/en/widgets/bottom-sheet.html)
- [List](https://www.flui.xin/en/widgets/list.html)
- [Theme](https://www.flui.xin/en/widgets/theme.html)

## Contributing

Principles:

* Branches that submit new widgets should be named *'feature-'* + widget name. Fixing issues need to be prefixed with *'bugfix-'*
* The submitted widgets need to be general. If the widget is rare or not sure whether it needs to be added to **FLUI**, you can raise a [issue](https://github.com/Rannie/flui/issues) which starts with *\[feature\]* for discussion
* The API design of the new widget is as standard and readable as possible, following the naming and usage rules of Flutter's official widgets.
* Please comment above properties and methods how to use it so that I can add to the documentation and examples.
* Commit messages: prefix with `feat | fix | docs | style | refactor | perf | test | workflow | ci | chore | types:`.


## License

MIT License


