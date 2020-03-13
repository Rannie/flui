[English](https://github.com/Rannie/flui/blob/master/README.md) | 简体中文

<br />
<p align="center">
    <a href="https://flui.xin">
        <img width="200" src="https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-18-Artboard.png">
    </a>
</p>

<h1 align="center">FLUI</h1>

<div align="center">

<p>一个 Google Flutter 的 UI 框架 <a href="https://www.flui.xin/app/flui.apk">示例 apk</a></p>

[![pub package](https://img.shields.io/pub/v/flui.svg)](https://pub.dev/packages/flui) 
[![CI Status](https://github.com/rannie/flui/workflows/test/badge.svg)](https://github.com/Rannie/flui/actions) 
[![Documentation](https://img.shields.io/badge/read_the-docs-2196f3.svg)](https://www.flui.xin/en/widgets/button.html) 
[![GitHub stars](https://img.shields.io/github/stars/Rannie/flui)](https://github.com/Rannie/flui/stargazers) 
[![GitHub forks](https://img.shields.io/github/forks/Rannie/flui.svg)](https://github.com/Rannie/flui) 
[![GitHub license](https://img.shields.io/github/license/Rannie/flui.svg)](https://github.com/Rannie/flui/blob/master/LICENSE)

<br/>
<img src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-18-overview-2.png" />

</div>

## 特性

* 开箱即用的高质量 Flutter UI 组件 
* 完善的使用示例和文档
* 细粒度非风格化的组件适用于不同类型的应用
* 支持 [Dark Mode](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-dark_shots.png) 以及 [RTL](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-27-rtl_shots.png)
* 动态化渲染支持模块 [Dynamic](https://www.flui.xin/dynamic.html)

## 兼容性

**FLUI** 在多端具有良好的兼容性，框架会一直基于 *Flutter Stable Channel* 开发。

目前支持 *v1.12.13+hotfix.8* 及以上版本。


## 快速上手

#### 安装

```yaml
dependencies:
  flui: 0.9.1
```

然后运行 `flutter pub get` 下载依赖。

#### 使用

依赖安装完成后直接引入组件。

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

- [Button](https://www.flui.xin/widgets/button.html)
- [Label](https://www.flui.xin/widgets/label.html)
- [Toast](https://www.flui.xin/widgets/toast.html)
- [Bubble](https://www.flui.xin/widgets/bubble.html)
- [Input](https://www.flui.xin/widgets/input.html)
- [Avatar](https://www.flui.xin/widgets/avatar.html)
- [Badge](https://www.flui.xin/widgets/badge.html)
- [Image](https://www.flui.xin/widgets/image.html)
- [CountStepper](https://www.flui.xin/widgets/counter.html)
- [AppBar](https://www.flui.xin/widgets/appbar.html)
- [NoticeBar](https://www.flui.xin/widgets/notice-bar.html)
- [Empty](https://www.flui.xin/widgets/empty.html)
- [Skeleton](https://www.flui.xin/widgets/skeleton.html)
- [BottomSheet](https://www.flui.xin/widgets/bottom-sheet.html)
- [List](https://www.flui.xin/widgets/list.html)
- [Theme](https://www.flui.xin/widgets/theme.html)

## Dynamic 模块

![dynamic-post](https://abtfun.oss-cn-beijing.aliyuncs.com/img/2020-03-11-dynamic-poster-1.png)

**FLUI-Dynamic** 为动态渲染模块，支持根据 json 字符串或者指定类型的对象来渲染视图，更多介绍及使用方法可以查看 [Dynamic](https://www.flui.xin/dynamic.html)

``` dart
Widget buildDynamicWidget() {
    return FLDyContainer(
       jsonObject: $JSON_STRING_OR_OBJECT,
       placeholder: CircularProgressIndicator(
         strokeWidth: 3.0,
         valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
       ),
    );
}
```

## Contributing

**FLUI** 还需要更多的组件以及功能，欢迎大家参照下面的原则提交代码或者 issue:

* 提交新组件的分支请以 *'feature-'* + 组件名称命名，修复问题的则需要以 *'bugfix-'* 为前缀
* 尽可能是通用的组件，如果组件很少见或者不确定需不需要可以在 [FLUI issue](https://github.com/Rannie/flui/issues) 中提一个以 *\[feature\]* 开头的 issue 进行讨论
* 新组件的 API 设计尽可能规范易读，贴合 Flutter 自带组件的命名，使用规则
* 请在属性和方法上注释表明如何使用，以便于更新到文档和示例中
* Git 提交文案请以 `feat|fix|docs|style|refactor|perf|test|workflow|ci|chore|types:` 为前缀。

## License

MIT License


