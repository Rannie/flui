# 概览

![flui-arch](http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-16-flui_arch.png)

**FLUI** 的组件是在已经极为丰富的 Flutter 组件上进行的补充，目前已经有 15 个类别并且在不断增加中。

每个组件几乎都是独立的（少数有相互依赖，比如 *FLStaticListView* 中引入了 *FLListTile* 来获取点击效果的能力），引入时可以直接 `import 'package:flui.dart'` 也可以 `import 'package:flui/widgets/avatar.dart'`，打包时 tree-shaking 会接管依赖的优化流程。

未来 **FLUI** 也会加入一些比较重的类型的组件，比如图表，图片选择器等等，如果有更好的组件想提交进来或者有一些不错的想法可以参考 [指南-如何贡献](https://www.flui.xin/guide.html#如何贡献)。

关于组件的动态化配置和渲染， **FLUI** 也在探索中。

