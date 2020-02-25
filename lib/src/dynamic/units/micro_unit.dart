import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/base_unit.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/units/unit_constant.dart';
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

/// RichText
class FLDyRichTextUnit extends FLDyRenderUnit {
  FLDyRichTextUnit({FLDyRichTextUnitModel unitModel})
    : assert(unitModel.runtimeType == FLDyRichTextUnitModel),
      super(unitModel: unitModel);

  TextSpan buildTextSpan(FLDyTextSpanUnitModel spanUM, BuildContext context) {
    return TextSpan(
      text: spanUM.text,
      style: spanUM.textStyle?.toTextStyle(context),
      semanticsLabel: spanUM.semanticsLabel,
      children: spanUM.children?.map(
              (spanUM) => buildTextSpan(spanUM, context))?.toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    final FLDyRichTextUnitModel rtum = unitModel as FLDyRichTextUnitModel;
    final textSpan = buildTextSpan(rtum.text, context);
    final Widget richText = RichText(
      text: textSpan,
    );
    return resolveSelf(richText);
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
      color: FLThemeTool.parseColor(ium.color, context),
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
      color: FLThemeTool.parseColor(ium.color, context),
      semanticLabel: ium.semanticLabel,
      textDirection: ium.getTextDirection(),
    );
    return resolveSelf(icon);
  }
}

