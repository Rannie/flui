import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/base_units.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/unit_constants.dart';
import 'package:flui/src/common/tools.dart';

/// SizedBox
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

/// Text
class FLDyTextUnit extends FLDyRenderUnit {
  FLDyTextUnit({FLDyTextUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyTextUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyTextUnitModel tum = unitModel as FLDyTextUnitModel;
    final Widget textWidget = Text(
      tum.text,
      style: tum.textStyle?.toTextStyle(context),
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

/// Image
class FLDyImageUnit extends FLDyRenderUnit {
  FLDyImageUnit({FLDyImageUnitModel unitModel})
    : assert(unitModel.runtimeType == FLDyImageUnitModel),
      super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyImageUnitModel ium = unitModel as FLDyImageUnitModel;
    final Widget image = Image(
      image: ium.imageProvider.type == FLDyImageType.network
          ? ium.imageProvider.toNetworkImage() : ium.imageProvider.toAssetImage(),
      semanticLabel: ium.semanticLabel,
      excludeFromSemantics: ium.excludeFromSemantics ?? false,
      width: ium.width,
      height: ium.height,
      color: FLColorTool.parseColor(ium.color, context),
      fit: ium.getBoxFit(),
      alignment: ium.getAlignment() ?? Alignment.center,
      repeat: ium.getImageRepeat() ?? ImageRepeat.noRepeat,
    );
    return resolveSelf(image);
  }
}

/// Icon
class FLDyIconUnit extends FLDyRenderUnit {
  FLDyIconUnit({FLDyIconUnitModel unitModel})
    : assert(unitModel.runtimeType == FLDyIconUnitModel),
      super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyIconUnitModel ium = unitModel as FLDyIconUnitModel;
    final Icon icon = Icon(
      ium.icon.toIconData(),
      size: ium.size,
      color: FLColorTool.parseColor(ium.color, context),
      semanticLabel: ium.semanticLabel,
      textDirection: ium.getTextDirection(),
    );
    return resolveSelf(icon);
  }
}

