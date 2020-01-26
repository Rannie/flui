import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/base_units.dart';

class FLDyContainerUnit extends FLDyRenderUnit {
  FLDyContainerUnit({FLDyContainerUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyContainerUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyContainerUnitModel cum = unitModel as FLDyContainerUnitModel;
    final Widget child = resolveChild();
    final Widget self = Container(
      width: cum.width,
      height: cum.height,
      padding: cum.padding?.toEdgeInsets(),
      margin: cum.margin?.toEdgeInsets(),
      color: cum.color != null ? Color(num.parse(cum.color)) : null,
      decoration: cum.decoration?.toBoxDecoration(),
      foregroundDecoration: cum.foregroundDecoration?.toBoxDecoration(),
      constraints: cum.constraints?.toBoxConstraints(),
      child: child,
    );
    return resolveSelf(self);
  }
}

class FLDySafeAreaUnit extends FLDyRenderUnit {
  FLDySafeAreaUnit({FLDySafeAreaUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDySafeAreaUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDySafeAreaUnitModel saum = unitModel as FLDySafeAreaUnitModel;
    final Widget child = resolveChild();
    return SafeArea(
      left: saum.left ?? true,
      top: saum.top ?? true,
      right: saum.right ?? true,
      bottom: saum.bottom ?? true,
      minimum: saum.minimum?.toEdgeInsets() ?? EdgeInsets.zero,
      maintainBottomViewPadding: saum.maintainBottomViewPadding ?? false,
      child: child,
    );
  }
}
