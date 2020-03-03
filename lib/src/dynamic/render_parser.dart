import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/container_unit.dart';
import 'package:flui/src/dynamic/units/micro_unit.dart';
import 'package:flui/src/dynamic/units/unit_constant.dart';

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
      case FLDyNativeUnitName.inkWell:
        return FLDyInkWellUnit(unitModel: unitModel);
      case FLDyNativeUnitName.text:
        return FLDyTextUnit(unitModel: unitModel);
      case FLDyNativeUnitName.richText:
        return FLDyRichTextUnit(unitModel: unitModel);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnit(unitModel: unitModel);
      case FLDyNativeUnitName.image:
        return FLDyImageUnit(unitModel: unitModel);
      case FLDyNativeUnitName.icon:
        return FLDyIconUnit(unitModel: unitModel);
      case FLDyNativeUnitName.raisedButton:
        return FLDyRaisedButtonUnit(unitModel: unitModel);
      case FLDyNativeUnitName.flatButton:
        return FLDyFlatButtonUnit(unitModel: unitModel);
    }
    return null;
  }
}
