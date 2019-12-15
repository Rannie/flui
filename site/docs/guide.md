# 指南

## 特性

* 开箱即用的高质量 Flutter UI 组件 
* 完善的使用示例和文档
* 细粒度非风格化的组件适用于不同类型的应用

## 兼容性

**FLUI** 在多端具有良好的兼容性，框架会一直基于 *Flutter Stable Channel* 开发。

目前支持 *v1.7.8+hotfix.1* 及以上版本。

::: tip 提示
由于 Flutter 框架发展很快，也会不断推出新的组件或者修复一些之前的问题， 所以 **FLUI** 会尽可能跟随官方版本来进行更新，一旦有破坏性的 API 更新也会在文档中声明。 
:::

## 快速上手

#### 安装

```yaml
dependencies:
  flui: 0.7.0
```

然后运行 `flutter pub get` 下载依赖。

#### 使用

依赖安装完成后就可以直接引入组件了。

```dart
import 'package:flui/widgets/toast.dart';

// run in somewhere
var hide = FLToast.loading(text: 'Loading...');
hide();
```

更多使用方式可以参照：

* [组件文档](https://flui.xin/widgets/)
* [App 示例](https://flui.xin/demo.html)

## 如何贡献

**FLUI** 还需要更多的组件以及功能，所以欢迎大家来一起来参照下面的原则提交代码或者 issue:

* 提交新组件的分支请以 'feature-' + 组件名称命名，修复问题的则需要以 'bugfix-' 为前缀
* 尽可能是通用的组件，如果组件很少见或者不确定需不需要可以在 [FLUI issue](https://github.com/Rannie/flui/issues) 中提一个以 \[feature\] 开头的 issue 进行讨论
* 新组件的 API 设计尽可能规范易读，贴合 Flutter 自带组件的命名，使用规则。
* 请在属性和方法上注释表明如何使用，以便于我可以补充到文档和示例中。

Git 开发提交前，请在根目录下运行 `npm install`，这样在每次提交时会 hook 检查提交文案。文案请以 `feat|fix|docs|style|refactor|perf|test|workflow|ci|chore|types:` 为前缀。

