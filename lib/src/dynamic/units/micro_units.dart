import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/base_units.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';

class FLDySizedBoxUnit extends FLDyRenderUnit {
  FLDySizedBoxUnit({FLDySizedBoxUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDySizedBoxUnitModel),
        super(unitModel: unitModel);

  Widget build(BuildContext context) {
    FLDySizedBoxUnitModel sbum = unitModel as FLDySizedBoxUnitModel;
    return SizedBox(
      width: sbum.width,
      height: sbum.height,
    );
  }
}


class FLDyTextUnit extends FLDyRenderUnit {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return super.build(context);
  }
}
