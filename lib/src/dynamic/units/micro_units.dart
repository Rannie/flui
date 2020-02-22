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
  FLDyTextUnit({FLDyTextUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyTextUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyTextUnitModel tum = unitModel as FLDyTextUnitModel;
    final Widget textWidget = Text(
      tum.text,
      style: tum.textStyle?.toTextStyle(),
      textAlign: tum.getTextAlign(),
      textDirection: tum.getTextDirection(),
      softWrap: tum.softWrap,
      overflow: tum.getTextOverflow(),
      textScaleFactor: tum.textScaleFactor,
      maxLines: tum.maxLines,
      semanticsLabel: tum.semanticsLabel,
      textWidthBasis: tum.getTextWidthBasis(),
    );
    return resolveSelf(textWidget);
  }
}
