import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../flui_nullsafety.dart';
import 'unit_constant.dart';

part 'unit_model.g.dart';

@JsonSerializable()

/// The unit model classes are responsible for storing view
/// rendering information, bound events and bound data.
class FLDyUnitModel {
  FLDyUnitModel(
      {this.uniqueId,
      this.unitName,
      this.flex,
      this.align,
      this.positioned,
      this.child,
      this.children});

  final String? uniqueId;
  final String? unitName;
  final String? flex;
  final FLDyUnitAlign? align;
  final FLDyUnitPositioned? positioned;
  final FLDyUnitModel? child;
  final List<FLDyUnitModel>? children;

  factory FLDyUnitModel.fromJson(Map<String, dynamic> json) {
    final String? unitName = json['unitName'];
    switch (unitName) {
      case FLDyNativeUnitName.container:
        return FLDyContainerUnitModel.fromJson(json);
      case FLDyNativeUnitName.safeArea:
        return FLDySafeAreaUnitModel.fromJson(json);
      case FLDyNativeUnitName.stack:
        return FLDyStackUnitModel.fromJson(json);
      case FLDyNativeUnitName.listView:
        return FLDyListViewUnitModel.fromJson(json);
      case FLDyNativeUnitName.listTile:
        return FLDyListTileUnitModel.fromJson(json);
      case FLDyNativeUnitName.inkWell:
        return FLDyListTileUnitModel.fromJson(json);
      case FLDyNativeUnitName.text:
        return FLDyTextUnitModel.fromJson(json);
      case FLDyNativeUnitName.richText:
        return FLDyRichTextUnitModel.fromJson(json);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnitModel.fromJson(json);
      case FLDyNativeUnitName.image:
        return FLDyImageUnitModel.fromJson(json);
      case FLDyNativeUnitName.icon:
        return FLDyIconUnitModel.fromJson(json);
      case FLDyNativeUnitName.raisedButton:
        return FLDyRaisedButtonUnitModel.fromJson(json);
      case FLDyNativeUnitName.flatButton:
        return FLDyFlatButtonUnitModel.fromJson(json);
    }
    return _$FLDyUnitModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$FLDyUnitModelToJson(this);
}

@JsonSerializable()

/// Container
class FLDyContainerUnitModel extends FLDyUnitModel {
  FLDyContainerUnitModel({
    String? uniqueId,
    String? unitName,
    FLDyUnitModel? child,
    List<FLDyUnitModel>? children,
    String? flex,
    this.width,
    this.height,
    this.color,
    FLDyUnitAlign? align,
    FLDyUnitPositioned? positioned,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
  }) : super(
            uniqueId: uniqueId,
            unitName: unitName,
            child: child,
            children: children,
            flex: flex,
            align: align,
            positioned: positioned);

  final double? width;
  final double? height;
  final String? color;
  final FLDyUnitEdgeInsets? padding;
  final FLDyUnitEdgeInsets? margin;

  /// only support box decoration
  final FLDyUnitBoxDecoration? decoration;
  final FLDyUnitBoxDecoration? foregroundDecoration;
  final FLDyUnitBoxConstraints? constraints;

  factory FLDyContainerUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyContainerUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyContainerUnitModelToJson(this);
}

@JsonSerializable()

/// SafeArea
class FLDySafeAreaUnitModel extends FLDyUnitModel {
  FLDySafeAreaUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitModel? child,
      List<FLDyUnitModel>? children,
      FLDyUnitAlign? align,
      this.left,
      this.top,
      this.right,
      this.bottom,
      this.minimum,
      this.maintainBottomViewPadding})
      : super(
            uniqueId: uniqueId,
            unitName: unitName,
            child: child,
            children: children,
            align: align);

  final bool? left;
  final bool? top;
  final bool? right;
  final bool? bottom;
  final FLDyUnitEdgeInsets? minimum;
  final bool? maintainBottomViewPadding;

  factory FLDySafeAreaUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDySafeAreaUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDySafeAreaUnitModelToJson(this);
}

@JsonSerializable()

/// StackView
class FLDyStackUnitModel extends FLDyUnitModel {
  FLDyStackUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitPositioned? positioned,
      List<FLDyUnitModel>? children,
      this.alignment,
      this.fit,
      this.textDirection,
      this.overflow})
      : super(
          uniqueId: uniqueId,
          unitName: unitName,
          positioned: positioned,
          children: children,
        );

  final String? alignment;
  final String? textDirection;
  final String? fit;
  final String? overflow;

  factory FLDyStackUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyStackUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyStackUnitModelToJson(this);

  AlignmentDirectional? getAlignment() =>
      flStringToAlignmentDirectional(alignment);
  TextDirection? getTextDirection() => flStringToTextDirection(textDirection);
  StackFit? getStackFit() => flStringToStackFit(fit);
  Clip? getOverflow() => flStringToOverflow(overflow);
}

@JsonSerializable()

/// ListView
class FLDyListViewUnitModel extends FLDyUnitModel {
  FLDyListViewUnitModel({
    String? uniqueId,
    String? unitName,
    List<FLDyUnitModel>? children,
    FLDyUnitPositioned? positioned,
    this.scrollDirection,
    this.reverse,
    this.primary,
    this.scrollPhysics,
    this.shrinkWrap,
    this.padding,
    this.itemExtent,
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.addSemanticIndexes,
    this.cacheExtent,
    this.semanticChildCount,
    this.separatedDivider,
  }) : super(
            uniqueId: uniqueId,
            unitName: unitName,
            children: children,
            positioned: positioned);

  final String? scrollDirection;
  final bool? reverse;
  final bool? primary;
  final FLDyUnitScrollPhysics? scrollPhysics;
  final bool? shrinkWrap;
  final FLDyUnitEdgeInsets? padding;
  final double? itemExtent;
  final bool? addAutomaticKeepAlives;
  final bool? addRepaintBoundaries;
  final bool? addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final FLDyUnitDivider? separatedDivider;

  factory FLDyListViewUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyListViewUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyListViewUnitModelToJson(this);

  Axis? getScrollDirection() => (scrollDirection != null)
      ? flStringToAxis(scrollDirection)
      : Axis.vertical;
}

@JsonSerializable()

/// ListTile
class FLDyListTileUnitModel extends FLDyUnitModel {
  FLDyListTileUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitPositioned? positioned,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing,
      this.isThreeLine,
      this.dense,
      this.contentPadding,
      this.enabled,
      this.selected})
      : super(
          uniqueId: uniqueId,
          unitName: unitName,
          positioned: positioned,
        );

  final FLDyUnitModel? leading;
  final FLDyUnitModel? title;
  final FLDyUnitModel? subtitle;
  final FLDyUnitModel? trailing;
  final bool? isThreeLine;
  final bool? dense;
  final FLDyUnitEdgeInsets? contentPadding;
  final bool? enabled;
  final bool? selected;

  factory FLDyListTileUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyListTileUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyListTileUnitModelToJson(this);
}

@JsonSerializable()

/// InkWell
class FLDyInkWellUnitModel extends FLDyUnitModel {
  FLDyInkWellUnitModel({
    String? uniqueId,
    String? unitName,
    FLDyUnitAlign? align,
    String? flex,
    FLDyUnitPositioned? positioned,
    FLDyUnitModel? child,
    List<FLDyUnitModel>? children,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
  }) : super(
          uniqueId: uniqueId,
          unitName: unitName,
          align: align,
          flex: flex,
          positioned: positioned,
          child: child,
          children: children,
        );

  final FLDyAction? onTap;
  final FLDyAction? onDoubleTap;
  final FLDyAction? onLongPress;
  final String? focusColor;
  final String? hoverColor;
  final String? highlightColor;
  final String? splashColor;

  factory FLDyInkWellUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyInkWellUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyInkWellUnitModelToJson(this);
}

@JsonSerializable()

/// SizedBox
class FLDySizedBoxUnitModel extends FLDyUnitModel {
  FLDySizedBoxUnitModel({
    String? unitName,
    this.width,
    this.height,
  }) : super(unitName: unitName);

  final double? width;
  final double? height;

  factory FLDySizedBoxUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDySizedBoxUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDySizedBoxUnitModelToJson(this);
}

@JsonSerializable()

/// Text
class FLDyTextUnitModel extends FLDyUnitModel {
  FLDyTextUnitModel(
    this.text, {
    String? uniqueId,
    String? unitName,
    FLDyUnitPositioned? positioned,
    this.textStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.textOverflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  }) : super(
          uniqueId: uniqueId,
          unitName: unitName,
          positioned: positioned,
        );

  final String? text;
  final FLDyUnitTextStyle? textStyle;
  final String? textAlign;
  final String? textDirection;
  final bool? softWrap;
  final String? textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final String? textWidthBasis;

  factory FLDyTextUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyTextUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyTextUnitModelToJson(this);

  TextAlign? getTextAlign() => flStringToTextAlign(textAlign);
  TextDirection? getTextDirection() => flStringToTextDirection(textDirection);
  TextOverflow? getTextOverflow() => flStringToTextOverflow(textOverflow);
  TextWidthBasis? getTextWidthBasis() =>
      flStringToTextWidthBasis(textWidthBasis);
}

@JsonSerializable()

/// RichText
class FLDyRichTextUnitModel extends FLDyUnitModel {
  FLDyRichTextUnitModel({
    String? uniqueId,
    String? unitName,
    FLDyUnitPositioned? positioned,
    this.text,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.textOverflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  }) : super(
          uniqueId: uniqueId,
          unitName: unitName,
          positioned: positioned,
        );

  final FLDyTextSpanUnitModel? text;
  final String? textAlign;
  final String? textDirection;
  final bool? softWrap;
  final String? textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final String? textWidthBasis;

  factory FLDyRichTextUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyRichTextUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyRichTextUnitModelToJson(this);

  TextAlign? getTextAlign() => flStringToTextAlign(textAlign);
  TextDirection? getTextDirection() => flStringToTextDirection(textDirection);
  TextOverflow? getTextOverflow() => flStringToTextOverflow(textOverflow);
  TextWidthBasis? getTextWidthBasis() =>
      flStringToTextWidthBasis(textWidthBasis);
}

@JsonSerializable()

/// TextSpan
class FLDyTextSpanUnitModel extends FLDyUnitModel {
  FLDyTextSpanUnitModel(
      {String? uniqueId,
      List<FLDyTextSpanUnitModel>? children,
      this.text,
      this.textStyle,
      this.gesture,
      this.semanticsLabel})
      : super(
          uniqueId: uniqueId,
          children: children,
        );

  final String? text;
  final FLDyUnitTextStyle? textStyle;
  final FLDyGestureRecognizer? gesture;
  final String? semanticsLabel;

  factory FLDyTextSpanUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyTextSpanUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyTextSpanUnitModelToJson(this);
}

@JsonSerializable()

/// Image
class FLDyImageUnitModel extends FLDyUnitModel {
  FLDyImageUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitPositioned? positioned,
      String? flex,
      required this.imageProvider,
      this.loading,
      this.width,
      this.height,
      this.color,
      this.fit,
      this.alignment,
      this.imageRepeat,
      this.semanticLabel,
      this.excludeFromSemantics})
      : super(
            uniqueId: uniqueId,
            unitName: unitName,
            positioned: positioned,
            flex: flex);

  final FLDyUnitImageProvider? imageProvider;
  final FLDyUnitModel? loading;
  final double? width;
  final double? height;
  final String? color;
  final String? fit;
  final String? alignment;
  final String? imageRepeat;
  final String? semanticLabel;
  final bool? excludeFromSemantics;

  factory FLDyImageUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyImageUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyImageUnitModelToJson(this);

  BoxFit? getBoxFit() => flStringToBoxFit(fit);
  Alignment? getAlignment() => flStringtoAlignment(alignment);
  ImageRepeat? getImageRepeat() => flStringToImageRepeat(imageRepeat);
}

@JsonSerializable()

/// Icon
class FLDyIconUnitModel extends FLDyUnitModel {
  FLDyIconUnitModel(
    this.icon, {
    String? uniqueId,
    String? unitName,
    FLDyUnitPositioned? positioned,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  }) : super(
          uniqueId: uniqueId,
          unitName: unitName,
          positioned: positioned,
        );

  final FLDyUnitIconData? icon;
  final double? size;
  final String? color;
  final String? semanticLabel;
  final String? textDirection;

  factory FLDyIconUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyIconUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyIconUnitModelToJson(this);

  TextDirection? getTextDirection() => flStringToTextDirection(textDirection);
}

@JsonSerializable()

/// RaisedButton
class FLDyRaisedButtonUnitModel extends FLDyUnitModel {
  FLDyRaisedButtonUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitPositioned? positioned,
      FLDyUnitAlign? align,
      String? flex,
      FLDyUnitModel? child,
      List<FLDyUnitModel>? children,
      required this.onPressed,
      this.onLongPress,
      this.textColor,
      this.color,
      this.padding})
      : super(
            uniqueId: uniqueId,
            unitName: unitName,
            positioned: positioned,
            align: align,
            flex: flex,
            child: child,
            children: children);

  final FLDyAction? onPressed;
  final FLDyAction? onLongPress;
  final String? textColor;
  final String? color;
  final FLDyUnitEdgeInsets? padding;

  factory FLDyRaisedButtonUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyRaisedButtonUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyRaisedButtonUnitModelToJson(this);
}

@JsonSerializable()

/// RaisedButton
class FLDyFlatButtonUnitModel extends FLDyUnitModel {
  FLDyFlatButtonUnitModel(
      {String? uniqueId,
      String? unitName,
      FLDyUnitPositioned? positioned,
      FLDyUnitAlign? align,
      String? flex,
      FLDyUnitModel? child,
      List<FLDyUnitModel>? children,
      required this.onPressed,
      this.onLongPress,
      this.textColor,
      this.color,
      this.padding})
      : super(
            uniqueId: uniqueId,
            unitName: unitName,
            positioned: positioned,
            align: align,
            flex: flex,
            child: child,
            children: children);

  final FLDyAction? onPressed;
  final FLDyAction? onLongPress;
  final String? textColor;
  final String? color;
  final FLDyUnitEdgeInsets? padding;

  factory FLDyFlatButtonUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyFlatButtonUnitModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FLDyFlatButtonUnitModelToJson(this);
}

@JsonSerializable()

/// IconData
class FLDyUnitIconData {
  FLDyUnitIconData(this.codePoint, this.fontFamily, this.fontPackage,
      this.matchTextDirection);

  final int? codePoint;
  final String? fontFamily;
  final String? fontPackage;
  final bool? matchTextDirection;

  factory FLDyUnitIconData.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitIconDataFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitIconDataToJson(this);

  IconData toIconData() {
    return IconData(codePoint!,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
        matchTextDirection: matchTextDirection ?? false);
  }
}

@JsonSerializable()

/// TextStyle
class FLDyUnitTextStyle {
  FLDyUnitTextStyle(
      this.themeStyle,
      this.inherit,
      this.color,
      this.backgroundColor,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.letterSpacing,
      this.wordSpacing,
      this.textBaseline,
      this.height,
      this.textDecorations,
      this.decorationColor,
      this.decorationStyle,
      this.decorationThickness);

  final String? themeStyle;
  final bool? inherit;
  final String? color;
  final String? backgroundColor;
  final String? fontFamily;
  final double? fontSize;
  final String? fontWeight;
  final String? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final String? textBaseline;
  final double? height;
  final List<String>? textDecorations;
  final String? decorationColor;
  final String? decorationStyle;
  final double? decorationThickness;

  factory FLDyUnitTextStyle.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitTextStyleFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitTextStyleToJson(this);

  TextStyle? toTextStyle(BuildContext context) {
    if (themeStyle != null) {
      return FLThemeTool.parseTextStyle(themeStyle!, context);
    }

    final TextDecoration? textDecoration = textDecorations != null
        ? TextDecoration.combine(textDecorations!.map(flStringToTextDecoration).toList() as List<TextDecoration>)
        : null;
    return TextStyle(
        inherit: inherit ?? true,
        color: FLThemeTool.parseColor(color, context),
        backgroundColor: FLThemeTool.parseColor(backgroundColor, context),
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: flStringToFontWeight(fontWeight),
        fontStyle: flStringToFontStyle(fontStyle),
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: flStringToTextBaseline(textBaseline),
        height: height,
        decoration: textDecoration,
        decorationColor: FLThemeTool.parseColor(decorationColor, context),
        decorationStyle: flStringToTextDecorationStyle(decorationStyle),
        decorationThickness: decorationThickness);
  }
}

@JsonSerializable()

/// Divider
class FLDyUnitDivider {
  FLDyUnitDivider(
      this.height, this.thickness, this.indent, this.endIndent, this.color);

  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final String? color;

  factory FLDyUnitDivider.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDividerFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDividerToJson(this);

  Divider toDivider(BuildContext context) => Divider(
        height: height,
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: FLThemeTool.parseColor(color, context),
      );
}

@JsonSerializable()

/// ScrollPhysics
class FLDyUnitScrollPhysics {
  FLDyUnitScrollPhysics(this.type);

  final String? type;

  factory FLDyUnitScrollPhysics.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitScrollPhysicsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitScrollPhysicsToJson(this);

  ScrollPhysics? toScrollPhysics() {
    switch (type) {
      case FLDyScrollPhysicsType.bouncing:
        return const BouncingScrollPhysics();
      case FLDyScrollPhysicsType.clamping:
        return const ClampingScrollPhysics();
      case FLDyScrollPhysicsType.alwaysScrollable:
        return const AlwaysScrollableScrollPhysics();
      case FLDyScrollPhysicsType.neverScrollable:
        return const NeverScrollableScrollPhysics();
      default:
        return null;
    }
  }
}

@JsonSerializable()

/// EdgeInsets
class FLDyUnitEdgeInsets {
  FLDyUnitEdgeInsets(this.left, this.top, this.right, this.bottom, this.all);

  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double? all;

  factory FLDyUnitEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitEdgeInsetsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitEdgeInsetsToJson(this);

  EdgeInsets toEdgeInsets() {
    if (all != null) {
      return EdgeInsets.all(all!);
    } else {
      return EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
    }
  }
}

@JsonSerializable()

/// ImageProvider
class FLDyUnitImageProvider {
  FLDyUnitImageProvider(this.type, this.url, this.assetName,
      {this.scale = 1.0});

  /// network, assets
  final String? type;

  /// network network use
  final String? url;

  /// asset image use
  final String? assetName;
  final double? scale;

  factory FLDyUnitImageProvider.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitImageProviderFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitImageProviderToJson(this);

  NetworkImage toNetworkImage() => NetworkImage(url!, scale: scale ?? 1.0);
  AssetImage toAssetImage() => AssetImage(assetName!);
}

@JsonSerializable()

/// DecorationImage
class FLDyUnitDecorationImage {
  FLDyUnitDecorationImage(
      this.imageProvider, this.fit, this.alignment, this.imageRepeat);

  final FLDyUnitImageProvider? imageProvider;
  final String? fit;
  final String? alignment;
  final String? imageRepeat;

  factory FLDyUnitDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDecorationImageFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDecorationImageToJson(this);

  DecorationImage toDecorationImage() => DecorationImage(
      image: (imageProvider!.type == FLDyImageType.network
          ? imageProvider!.toNetworkImage()
          : imageProvider!.toAssetImage()) as ImageProvider<Object>,
      fit: flStringToBoxFit(fit),
      alignment: flStringtoAlignment(alignment) ?? Alignment.center,
      repeat: flStringToImageRepeat(imageRepeat)!);
}

@JsonSerializable()
class FLDyUnitBoxConstraints {
  FLDyUnitBoxConstraints(
      this.minWidth, this.maxWidth, this.minHeight, this.maxHeight);

  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  factory FLDyUnitBoxConstraints.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxConstraintsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxConstraintsToJson(this);

  BoxConstraints toBoxConstraints() => BoxConstraints(
      minWidth: minWidth!,
      maxWidth: maxWidth!,
      minHeight: minHeight!,
      maxHeight: maxHeight!);
}

@JsonSerializable()

/// BoxDecoration
class FLDyUnitBoxDecoration {
  FLDyUnitBoxDecoration(this.color, this.image, this.border, this.borderRadius,
      this.boxShadow, this.shape);

  final String? color;
  final FLDyUnitDecorationImage? image;
  final FLDyUnitBorder? border;
  final FLDyUnitBorderRadius? borderRadius;
  final List<FLDyUnitBoxShadow>? boxShadow;
  final String? shape;

  factory FLDyUnitBoxDecoration.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxDecorationFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxDecorationToJson(this);

  BoxDecoration toBoxDecoration(BuildContext context) => BoxDecoration(
      color: FLThemeTool.parseColor(color, context),
      image: image?.toDecorationImage(),
      border: border?.toBorder(context),
      borderRadius: borderRadius?.toBorderRadius(),
      boxShadow: boxShadow != null
          ? boxShadow!
              .map((FLDyUnitBoxShadow shadow) => shadow.toBoxShadow(context))
              .toList()
          : null,
      shape: flStringToBoxShape(shape) ?? BoxShape.rectangle);
}

@JsonSerializable()

/// BoxShadow
class FLDyUnitBoxShadow {
  FLDyUnitBoxShadow(
      this.color, this.offset, this.blurRadius, this.spreadRadius);

  final String? color;
  final FLDyUnitOffset? offset;
  final double? blurRadius;
  final double? spreadRadius;

  factory FLDyUnitBoxShadow.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxShadowFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxShadowToJson(this);

  BoxShadow toBoxShadow(BuildContext context) {
    final shadowColor = FLThemeTool.parseColor(color, context);
    return BoxShadow(
      color: shadowColor ?? const Color(0xFF000000),
      offset: offset?.toOffset() ?? Offset.zero,
      blurRadius: blurRadius ?? 0.0,
      spreadRadius: spreadRadius ?? 0.0,
    );
  }
}

@JsonSerializable()

/// Offset
class FLDyUnitOffset {
  FLDyUnitOffset(this.dx, this.dy);

  final double? dx;
  final double? dy;

  factory FLDyUnitOffset.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitOffsetFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitOffsetToJson(this);

  Offset toOffset() => Offset(dx!, dy!);
}

@JsonSerializable()

/// BorderRadius
class FLDyUnitBorderRadius {
  FLDyUnitBorderRadius(this.radius);

  /// all radius value
  final double? radius;

  factory FLDyUnitBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBorderRadiusFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBorderRadiusToJson(this);

  BorderRadius toBorderRadius() => BorderRadius.circular(radius!);
}

@JsonSerializable()

/// Border
class FLDyUnitBorder {
  FLDyUnitBorder(this.color, this.width, this.style);

  final String? color;
  final double? width;
  final String? style;

  factory FLDyUnitBorder.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBorderFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBorderToJson(this);

  Border toBorder(BuildContext context) => Border.all(
      color: FLThemeTool.parseColor(color, context) ?? const Color(0xFF000000),
      width: width ?? 1,
      style: flStringToBorderStyle(style) ?? BorderStyle.solid);
}

@JsonSerializable()

/// Align
class FLDyUnitAlign {
  FLDyUnitAlign(
      this.type,
      this.mainAxisSize,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.alignment,
      this.widthFactor,
      this.heightFactor);

  final String? type;
  final String? mainAxisSize;
  final String? mainAxisAlignment;
  final String? crossAxisAlignment;
  final String? alignment;
  final double? widthFactor;
  final double? heightFactor;

  factory FLDyUnitAlign.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitAlignFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitAlignToJson(this);

  Alignment? getAlignment() => flStringtoAlignment(alignment);
}

@JsonSerializable()

/// Positioned
class FLDyUnitPositioned {
  FLDyUnitPositioned(
      this.left, this.top, this.right, this.bottom, this.width, this.height);

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;

  factory FLDyUnitPositioned.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitPositionedFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitPositionedToJson(this);
}
