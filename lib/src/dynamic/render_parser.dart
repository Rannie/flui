import 'package:flutter/material.dart';

import '../../flui_nullsafety.dart';
import 'units/container_unit.dart';
import 'units/micro_unit.dart';
import 'units/unit_constant.dart';

class FLDyRenderParser {
  // mark up build
  static Widget? markupContent(FLDyUnitModel unitModel) {
    Widget? content = parseUnitModel(unitModel);
    return content;
  }

  static Widget? parseUnitModel(FLDyUnitModel unitModel) {
    switch (unitModel.unitName) {
      case FLDyNativeUnitName.container:
        return FLDyContainerUnit(unitModel: unitModel as FLDyContainerUnitModel);
      case FLDyNativeUnitName.safeArea:
        return FLDySafeAreaUnit(unitModel: unitModel as FLDySafeAreaUnitModel);
      case FLDyNativeUnitName.stack:
        return FLDyStackUnit(unitModel: unitModel as FLDyStackUnitModel);
      case FLDyNativeUnitName.listView:
        return FLDyListViewUnit(unitModel: unitModel as FLDyListViewUnitModel);
      case FLDyNativeUnitName.listTile:
        return FLDyListTileUnit(unitModel: unitModel as FLDyListTileUnitModel);
      case FLDyNativeUnitName.inkWell:
        return FLDyInkWellUnit(unitModel: unitModel as FLDyInkWellUnitModel);
      case FLDyNativeUnitName.text:
        return FLDyTextUnit(unitModel: unitModel as FLDyTextUnitModel);
      case FLDyNativeUnitName.richText:
        return FLDyRichTextUnit(unitModel: unitModel as FLDyRichTextUnitModel);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnit(unitModel: unitModel as FLDySizedBoxUnitModel);
      case FLDyNativeUnitName.image:
        return FLDyImageUnit(unitModel: unitModel as FLDyImageUnitModel);
      case FLDyNativeUnitName.icon:
        return FLDyIconUnit(unitModel: unitModel as FLDyIconUnitModel);
      case FLDyNativeUnitName.raisedButton:
        return FLDyRaisedButtonUnit(unitModel: unitModel as FLDyRaisedButtonUnitModel);
      case FLDyNativeUnitName.flatButton:
        return FLDyFlatButtonUnit(unitModel: unitModel as FLDyFlatButtonUnitModel);
    }
    return null;
  }
}
