import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/container_units.dart';
import 'package:flui/src/dynamic/units/micro_units.dart';

class FLDyRenderParser {
  // mark up build
  static Widget markupContent(FLDyUnitModel unitModel) {
    Widget content = parseUnitModel(unitModel);
    return content;
  }

  static Widget parseUnitModel(FLDyUnitModel unitModel) {
    switch (unitModel.unitName) {
      case FLDyNativeUnitNames.container:
        return FLDyContainerUnit(unitModel: unitModel);
      case FLDyNativeUnitNames.sizedBox:
        return FLDySizedBoxUnit(unitModel: unitModel);
    }
    return null;
  }
}
