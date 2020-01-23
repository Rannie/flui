import 'package:flui/dynamic.dart';
import 'package:flutter/material.dart';
import 'render_unit.dart';

class FLDyNativeUnitNames {
  static const String container = 'Container';
}

class FLDyRenderParser {
  // mark up build
  static Widget markupContent(FLDyUnitModel unitModel) {
    Widget content = parseUnitModel(unitModel);
    return content;
  }

  static Widget parseUnitModel(FLDyUnitModel unitModel) {
    switch (unitModel.unitName) {
      case FLDyNativeUnitNames.container: {
        return FLDyContainerUnit(
          unitModel: unitModel,
        );
      }
    }
    return null;
  }
}
