# Guide

## Features

* A set of high-quality Flutter widgets out of the box
* Comprehensive usage examples and documentation
* Fine-grained non-stylized widgets for different types of applications

## Compatibility

**FLUI** has good compatibility on multiple clients, and the framework will be developed based on Flutter Stable Channel.

Currently supports *v1.7.8 + hotfix.1* and above.

::: tip Tips
Due to the rapid development of the Flutter framework, new widgets will be continuously introduced and some issues will be fixed. Therefore, **FLUI** will follow the official version to update as much as possible, and once there are destructive API updates, it will also be stated in the document .
:::

## Getting Started

#### Setup

```yaml
dependencies:
  flui: 0.7.0
```

Then run `flutter pub get` to download the dependencies.

#### Usage

After the dependency installation is complete, you can directly import the widget.

```dart
import 'package:flui/widgets/toast.dart';

// run in somewhere
var hide = FLToast.loading(text: 'Loading...');
hide();
```

For more usage, please refer to:

* [Widget Documentation](https://flui.xin/en/widgets/)
* [App Demo](https://flui.xin/en/demo.html)

## How to Contribute

**FLUI** also needs more widgets and functions, so everyone is welcome to submit code or issue referring to the following principles:

* Branches that submit new widgets should be named *'feature-'* + widget name. Fixing issues need to be prefixed with *'bugfix-'*
* The submitted widgets need to be general. If the widget is rare or you uncertain if it need to be added to **FLUI**, you can mention a [issue](https://github.com/Rannie/flui/issues) that starts with *\[feature\]* for discussion
* The API design of the new widget is as standard and readable as possible, following the naming and usage rules of Flutter's official widgets.
* Please comment above properties and methods how to use it so that I can add to the documentation and examples.

Before first Git commit, please run `npm install` in the root directory, so that it will check the message every time you commit. For message, please prefix it with `feat | fix | docs | style | refactor | perf | test | workflow | ci | chore | types:`.

