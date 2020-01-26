import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/base_units.dart';

class FLDyContainerUnit extends FLDyRenderUnit {
  FLDyContainerUnit({FLDyContainerUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyContainerUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyContainerUnitModel conModel = unitModel as FLDyContainerUnitModel;
    final Widget child = resolveChild();
    final Widget self = Container(
      width: conModel.width,
      height: conModel.height,
      padding: conModel.padding?.toEdgeInsets(),
      margin: conModel.margin?.toEdgeInsets(),
      color: conModel.color != null ? Color(num.parse(conModel.color)) : null,
      decoration: conModel.decoration?.toBoxDecoration(),
      child: child,
    );
    return resolveSelf(self);
  }
}
