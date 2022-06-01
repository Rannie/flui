import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../flui_nullsafety.dart';
import 'base_unit.dart';
import 'unit_constant.dart';

/// SizedBox
class FLDySizedBoxUnit extends FLDyRenderUnit {
  FLDySizedBoxUnit({required FLDySizedBoxUnitModel unitModel})
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
  FLDyTextUnit({required FLDyTextUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyTextUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyTextUnitModel tum = unitModel as FLDyTextUnitModel;
    final Widget textWidget = Text(
      tum.text!,
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
  FLDyRichTextUnit({required FLDyRichTextUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyRichTextUnitModel),
        super(unitModel: unitModel);

  TextSpan buildTextSpan(FLDyTextSpanUnitModel spanUM, BuildContext context) {
    GestureRecognizer? gestureRecognizer;
    if (spanUM.gesture != null) {
      if (spanUM.gesture!.onTap != null) {
        gestureRecognizer = TapGestureRecognizer()
          ..onTap = () {
            FLDyActionDispatch.dispatcher
                .dispatchAction(spanUM.uniqueId, spanUM.gesture!.onTap, context);
          };
      } else if (spanUM.gesture!.onLongPress != null) {
        gestureRecognizer = LongPressGestureRecognizer()
          ..onLongPress = () {
            FLDyActionDispatch.dispatcher.dispatchAction(
                spanUM.uniqueId, spanUM.gesture!.onLongPress, context);
          };
      }
    }
    return TextSpan(
        text: spanUM.text,
        style: spanUM.textStyle?.toTextStyle(context),
        recognizer: gestureRecognizer,
        semanticsLabel: spanUM.semanticsLabel,
        children: spanUM.children
            ?.map((spanUM) => buildTextSpan(spanUM as FLDyTextSpanUnitModel, context))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final FLDyRichTextUnitModel rtum = unitModel as FLDyRichTextUnitModel;
    final textSpan = buildTextSpan(rtum.text!, context);
    final Widget richText = RichText(
      text: textSpan,
    );
    return resolveSelf(richText);
  }
}

/// Image
class FLDyImageUnit extends FLDyRenderUnit {
  FLDyImageUnit({required FLDyImageUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyImageUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyImageUnitModel ium = unitModel as FLDyImageUnitModel;
    final Widget image = Image(
      image: (ium.imageProvider!.type == FLDyImageType.network
          ? ium.imageProvider!.toNetworkImage()
          : ium.imageProvider!.toAssetImage()) as ImageProvider<Object>,
      loadingBuilder: ium.loading != null
          ? (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
              return markupUnit(ium.loading!)!;
            }
          : null,
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
  FLDyIconUnit({required FLDyIconUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyIconUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyIconUnitModel ium = unitModel as FLDyIconUnitModel;
    final Icon icon = Icon(
      ium.icon!.toIconData(),
      size: ium.size,
      color: FLThemeTool.parseColor(ium.color, context),
      semanticLabel: ium.semanticLabel,
      textDirection: ium.getTextDirection(),
    );
    return resolveSelf(icon);
  }
}

/// RaisedButton
class FLDyRaisedButtonUnit extends FLDyRenderUnit {
  FLDyRaisedButtonUnit({required FLDyRaisedButtonUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyRaisedButtonUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyRaisedButtonUnitModel rbum =
        unitModel as FLDyRaisedButtonUnitModel;
    final Widget? child = resolveChild();
    final ElevatedButton button = ElevatedButton(
      onPressed: () => FLDyActionDispatch.dispatcher
          .dispatchAction(rbum.uniqueId, rbum.onPressed, context),
      onLongPress: () => FLDyActionDispatch.dispatcher
          .dispatchAction(rbum.uniqueId, rbum.onLongPress, context),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          color: FLThemeTool.parseColor(rbum.textColor, context),
        )),
        backgroundColor: MaterialStateProperty.all(FLThemeTool.parseColor(rbum.color, context)),
        padding: MaterialStateProperty.all(rbum.padding?.toEdgeInsets())
      ),
      child: child,
    );
    return resolveSelf(button);
  }
}

/// FlatButton
class FLDyFlatButtonUnit extends FLDyRenderUnit {
  FLDyFlatButtonUnit({required FLDyFlatButtonUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyFlatButtonUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyFlatButtonUnitModel fbum = unitModel as FLDyFlatButtonUnitModel;
    final Widget child = resolveChild()!;
    final TextButton button = TextButton(
      onPressed: () => FLDyActionDispatch.dispatcher
          .dispatchAction(fbum.uniqueId, fbum.onPressed, context),
      onLongPress: () => FLDyActionDispatch.dispatcher
          .dispatchAction(fbum.uniqueId, fbum.onLongPress, context),
      child: child,
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            color: FLThemeTool.parseColor(fbum.textColor, context),
          )),
          backgroundColor: MaterialStateProperty.all(FLThemeTool.parseColor(fbum.color, context)),
          padding: MaterialStateProperty.all(fbum.padding?.toEdgeInsets())
      ),
    );
    return resolveSelf(button);
  }
}
