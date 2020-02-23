import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/container_units.dart';
import 'package:flui/src/dynamic/units/micro_units.dart';
import 'package:flui/src/dynamic/units/unit_constants.dart';

class FLDyRenderParser {
  // mark up build
  static Widget markupContent(FLDyUnitModel unitModel) {
    Widget content = parseUnitModel(unitModel);
    return content;
  }

  static Widget parseUnitModel(FLDyUnitModel unitModel) {
    switch (unitModel.unitName) {
      case FLDyNativeUnitName.container:
        return FLDyContainerUnit(unitModel: unitModel);
      case FLDyNativeUnitName.safeArea:
        return FLDySafeAreaUnit(unitModel: unitModel);
      case FLDyNativeUnitName.stack:
        return FLDyStackUnit(unitModel: unitModel);
      case FLDyNativeUnitName.listView:
        return FLDyListViewUnit(unitModel: unitModel);
      case FLDyNativeUnitName.listTile:
        return FLDyListTileUnit(unitModel: unitModel);
      case FLDyNativeUnitName.text:
        return FLDyTextUnit(unitModel: unitModel);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnit(unitModel: unitModel);
      case FLDyNativeUnitName.image:
        return FLDyImageUnit(unitModel: unitModel);
    }
    return null;
  }
}
