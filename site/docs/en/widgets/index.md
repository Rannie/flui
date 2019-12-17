# Overview

![flui-arch](http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-16-flui_arch.png)

**FLUI** has a relatively fine granularity of widgets, which is a supplement to the kinds of Flutter widgets. There are currently 15 categories and they are still constantly increasing.

Each widget is almost independent (a few have dependencies, such as *FLListTile* to be imported in *FLStaticListView* to get the ability of showing click effect), you can either use `import 'package:flui.dart'` or `import 'package:flui/widgets/avatar.dart'`, tree-shaking will take over the optimization process of dependencies when packaging.

In the future, **FLUI** will also add some heavier widgets such as charts, photo browser, etc. If you have better widgets to submit or some good ideas, please refer to xx [Guide - How To Contribute](https://www.flui.xin/en/guide.html#how-to-contribute).

Regarding dynamic configuration and rendering of widgets, it is still under exploring.


