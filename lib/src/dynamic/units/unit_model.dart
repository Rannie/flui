import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_constants.dart';

part 'unit_model.g.dart';

@JsonSerializable()
/// The unit model classes are responsible for storing view
/// rendering information, bound events and bound data.
class FLDyUnitModel {
  FLDyUnitModel(
      {this.uniqueId,
        @required this.unitName,
        this.flex,
        this.align,
        this.positioned,
        this.child,
        this.children})
      : assert(unitName != null);

  final String uniqueId;
  final String unitName;
  final String flex;
  final FLDyUnitAlign align;
  final FLDyUnitPositioned positioned;
  final FLDyUnitModel child;
  final List<FLDyUnitModel> children;

  factory FLDyUnitModel.fromJson(Map<String, dynamic> json) {
    final String unitName = json['unitName'];
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
      case FLDyNativeUnitName.text:
        return FLDyTextUnitModel.fromJson(json);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnitModel.fromJson(json);
      case FLDyNativeUnitName.image:
        return FLDyImageUnitModel.fromJson(json);
      case FLDyNativeUnitName.icon:
        return FLDyIconUnitModel.fromJson(json);
    }
    return _$FLDyUnitModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$FLDyUnitModelToJson(this);
}

@JsonSerializable()
/// Container
class FLDyContainerUnitModel extends FLDyUnitModel {
  FLDyContainerUnitModel({
    String uniqueId,
    String unitName,
    FLDyUnitModel child,
    List<FLDyUnitModel> children,
    String flex,
    this.width,
    this.height,
    this.color,
    FLDyUnitAlign align,
    FLDyUnitPositioned positioned,
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

  final double width;
  final double height;
  final String color;
  final FLDyUnitEdgeInsets padding;
  final FLDyUnitEdgeInsets margin;
  /// only support box decoration
  final FLDyUnitBoxDecoration decoration;
  final FLDyUnitBoxDecoration foregroundDecoration;
  final FLDyUnitBoxConstraints constraints;

  factory FLDyContainerUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyContainerUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyContainerUnitModelToJson(this);
}

@JsonSerializable()
/// SafeArea
class FLDySafeAreaUnitModel extends FLDyUnitModel {
  FLDySafeAreaUnitModel({
    String uniqueId,
    String unitName,
    FLDyUnitModel child,
    List<FLDyUnitModel> children,
    FLDyUnitAlign align,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.minimum,
    this.maintainBottomViewPadding
  }) : super(
      uniqueId: uniqueId,
      unitName: unitName,
      child: child,
      children: children,
      align: align);

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final FLDyUnitEdgeInsets minimum;
  final bool maintainBottomViewPadding;

  factory FLDySafeAreaUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDySafeAreaUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDySafeAreaUnitModelToJson(this);
}

@JsonSerializable()
/// StackView
class FLDyStackUnitModel extends FLDyUnitModel {
  FLDyStackUnitModel({
    String uniqueId,
    String unitName,
    FLDyUnitPositioned positioned,
    List<FLDyUnitModel> children,
    this.alignment,
    this.fit,
    this.textDirection,
    this.overflow
  }) : super(
    uniqueId: uniqueId,
    unitName: unitName,
    positioned: positioned,
    children: children,
  );

  final String alignment;
  final String textDirection;
  final String fit;
  final String overflow;

  factory FLDyStackUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyStackUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyStackUnitModelToJson(this);

  AlignmentDirectional getAlignment() => flStringToAlignmentDirectional(alignment);
  TextDirection getTextDirection() => flStringToTextDirection(textDirection);
  StackFit getStackFit() => flStringToStackFit(fit);
  Overflow getOverflow() => flStringToOverflow(overflow);
}

@JsonSerializable()
/// ListView
class FLDyListViewUnitModel extends FLDyUnitModel {
  FLDyListViewUnitModel({
    String uniqueId,
    String unitName,
    List<FLDyUnitModel> children,
    FLDyUnitPositioned positioned,
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

  final String scrollDirection;
  final bool reverse;
  final bool primary;
  final FLDyUnitScrollPhysics scrollPhysics;
  final bool shrinkWrap;
  final FLDyUnitEdgeInsets padding;
  final double itemExtent;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double cacheExtent;
  final int semanticChildCount;
  final FLDyUnitDivider separatedDivider;

  factory FLDyListViewUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyListViewUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyListViewUnitModelToJson(this);

  Axis getScrollDirection() => (scrollDirection != null)
      ? flStringToAxis(scrollDirection) : Axis.vertical;
}

@JsonSerializable()
/// ListTile
class FLDyListTileUnitModel extends FLDyUnitModel {
  FLDyListTileUnitModel({
    String uniqueId,
    String unitName,
    FLDyUnitPositioned positioned,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine,
    this.dense,
    this.contentPadding,
    this.enabled,
    this.selected
  }) : super(
    uniqueId: uniqueId,
    unitName: unitName,
    positioned: positioned,
  );

  final FLDyUnitModel leading;
  final FLDyUnitModel title;
  final FLDyUnitModel subtitle;
  final FLDyUnitModel trailing;
  final bool isThreeLine;
  final bool dense;
  final FLDyUnitEdgeInsets contentPadding;
  final bool enabled;
  final bool selected;

  factory FLDyListTileUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyListTileUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyListTileUnitModelToJson(this);
}

@JsonSerializable()
/// SizedBox
class FLDySizedBoxUnitModel extends FLDyUnitModel {
  FLDySizedBoxUnitModel({
    String unitName,
    this.width,
    this.height,
  }) : super(unitName: unitName);

  final double width;
  final double height;

  factory FLDySizedBoxUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDySizedBoxUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDySizedBoxUnitModelToJson(this);
}

@JsonSerializable()
/// Text
class FLDyTextUnitModel extends FLDyUnitModel {
  FLDyTextUnitModel(this.text, {
    String uniqueId,
    String unitName,
    FLDyUnitPositioned positioned,
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

  final String text;
  final FLDyUnitTextStyle textStyle;
  final String textAlign;
  final String textDirection;
  final bool softWrap;
  final String textOverflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final String textWidthBasis;

  factory FLDyTextUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyTextUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyTextUnitModelToJson(this);
  
  TextAlign getTextAlign() => flStringToTextAlign(textAlign);
  TextDirection getTextDirection() => flStringToTextDirection(textDirection);
  TextOverflow getTextOverflow() => flStringToTextOverflow(textOverflow);
  TextWidthBasis getTextWidthBasis() => flStringToTextWidthBasis(textWidthBasis);
}

@JsonSerializable()
/// Image
class FLDyImageUnitModel extends FLDyUnitModel {
  FLDyImageUnitModel({
    String uniqueId,
    String unitName,
    FLDyUnitPositioned positioned,
    String flex,
    @required this.imageProvider,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment,
    this.imageRepeat,
    this.semanticLabel,
    this.excludeFromSemantics
  }) : super(
    uniqueId: uniqueId,
    unitName: unitName,
    positioned: positioned,
    flex: flex
  );

  final FLDyUnitImageProvider imageProvider;
  //TODO: add loading builder
  final double width;
  final double height;
  final String color;
  final String fit;
  final String alignment;
  final String imageRepeat;
  final String semanticLabel;
  final bool excludeFromSemantics;

  factory FLDyImageUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyImageUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyImageUnitModelToJson(this);

  BoxFit getBoxFit() => flStringToBoxFit(fit);
  Alignment getAlignment() => flStringtoAlignment(alignment);
  ImageRepeat getImageRepeat() => flStringToImageRepeat(imageRepeat);
}

@JsonSerializable()
/// Icon
class FLDyIconUnitModel extends FLDyUnitModel {
  FLDyIconUnitModel(this.icon, {
    String uniqueId,
    String unitName,
    FLDyUnitPositioned positioned,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
  }) : super(
    uniqueId: uniqueId,
    unitName: unitName,
    positioned: positioned,
  );

  final FLDyUnitIconData icon;
  final double size;
  final String color;
  final String semanticLabel;
  final String textDirection;

  factory FLDyIconUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyIconUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyIconUnitModelToJson(this);

  TextDirection getTextDirection() => flStringToTextDirection(textDirection);
}

@JsonSerializable()
/// IconData
class FLDyUnitIconData {
  FLDyUnitIconData(this.codePoint, this.fontFamily, this.fontPackage, this.matchTextDirection);

  final int codePoint;
  final String fontFamily;
  final String fontPackage;
  final bool matchTextDirection;

  factory FLDyUnitIconData.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitIconDataFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitIconDataToJson(this);

  IconData toIconData() {
    return IconData(
        codePoint,
        fontFamily: fontFamily,
        fontPackage: fontPackage,
        matchTextDirection: matchTextDirection ?? false
    );
  }
}

@JsonSerializable()
/// TextStyle
class FLDyUnitTextStyle {
  FLDyUnitTextStyle(
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
      this.decorationThickness
  );

  final String color;
  final String backgroundColor;
  final String fontFamily;
  final double fontSize;
  final String fontWeight;
  final String fontStyle;
  final double letterSpacing;
  final double wordSpacing;
  final String textBaseline;
  final double height;
  final List<String> textDecorations;
  final String decorationColor;
  final String decorationStyle;
  final double decorationThickness;

  factory FLDyUnitTextStyle.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitTextStyleFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitTextStyleToJson(this);

  TextStyle toTextStyle() {
    final TextDecoration textDecoration = textDecorations != null
        ? TextDecoration.combine(textDecorations.map((decStr) {
          flStringToTextDecoration(decStr);
        }).toList()) : null;
    return TextStyle(
      color: color != null ? Color(num.parse(color)) : null,
      backgroundColor: backgroundColor != null
          ? Color(num.parse(backgroundColor)) : null,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: flStringToFontWeight(fontWeight),
      fontStyle: flStringToFontStyle(fontStyle),
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: flStringToTextBaseline(textBaseline),
      height: height,
      decoration: textDecoration,
      decorationColor: decorationColor != null
          ? Color(num.parse(decorationColor)) : null,
      decorationStyle: flStringToTextDecorationStyle(decorationStyle),
      decorationThickness: decorationThickness
    );
  }
}

@JsonSerializable()
/// Divider
class FLDyUnitDivider {
  FLDyUnitDivider(this.height, this.thickness, this.indent, this.endIndent, this.color);

  final double height;
  final double thickness;
  final double indent;
  final double endIndent;
  final String color;

  factory FLDyUnitDivider.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDividerFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDividerToJson(this);

  Divider toDivider() => Divider(
    height: height,
    thickness: thickness,
    indent: indent,
    endIndent: endIndent,
    color: color != null ? Color(num.parse(color)) : null,
  );
}

@JsonSerializable()
/// ScrollPhysics
class FLDyUnitScrollPhysics {
  FLDyUnitScrollPhysics(this.type);

  final String type;

  factory FLDyUnitScrollPhysics.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitScrollPhysicsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitScrollPhysicsToJson(this);

  ScrollPhysics toScrollPhysics() {
    switch (type) {
      case FLDyScrollPhysicsType.bouncing: return BouncingScrollPhysics();
      case FLDyScrollPhysicsType.clamping: return ClampingScrollPhysics();
      case FLDyScrollPhysicsType.alwaysScrollable:
        return AlwaysScrollableScrollPhysics();
      case FLDyScrollPhysicsType.neverScrollable:
        return NeverScrollableScrollPhysics();
      default: return null;
    }
  }
}

@JsonSerializable()
/// EdgeInsets
class FLDyUnitEdgeInsets {
  FLDyUnitEdgeInsets(this.left, this.top, this.right, this.bottom, this.all);

  final double top;
  final double left;
  final double bottom;
  final double right;
  final double all;

  factory FLDyUnitEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitEdgeInsetsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitEdgeInsetsToJson(this);

  EdgeInsets toEdgeInsets() {
    if (all != null) return EdgeInsets.all(all);
    else return EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
  }
}

@JsonSerializable()
/// ImageProvider
class FLDyUnitImageProvider {
  FLDyUnitImageProvider(this.type, this.url, this.assetName, { this.scale = 1.0 });
  /// network, assets
  final String type;
  /// network network use
  final String url;
  /// asset image use
  final String assetName;
  final double scale;

  factory FLDyUnitImageProvider.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitImageProviderFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitImageProviderToJson(this);

  NetworkImage toNetworkImage() => NetworkImage(url, scale: scale);
  AssetImage toAssetImage() => AssetImage(assetName);
}

@JsonSerializable()
/// DecorationImage
class FLDyUnitDecorationImage {
  FLDyUnitDecorationImage(this.imageProvider, this.fit, this.alignment, this.imageRepeat);

  final FLDyUnitImageProvider imageProvider;
  final String fit;
  final String alignment;
  final String imageRepeat;

  factory FLDyUnitDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDecorationImageFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDecorationImageToJson(this);

  DecorationImage toDecorationImage() => DecorationImage(
    image: (imageProvider.type == FLDyImageType.network
        ? imageProvider.toNetworkImage() : imageProvider.toAssetImage()),
    fit: flStringToBoxFit(fit),
    alignment: flStringtoAlignment(alignment) ?? Alignment.center,
    repeat: flStringToImageRepeat(imageRepeat)
  );
}

@JsonSerializable()
class FLDyUnitBoxConstraints {
  FLDyUnitBoxConstraints(this.minWidth, this.maxWidth, this.minHeight, this.maxHeight);

  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;

  factory FLDyUnitBoxConstraints.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxConstraintsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxConstraintsToJson(this);

  BoxConstraints toBoxConstraints() => BoxConstraints(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight
  );
}

@JsonSerializable()
/// BoxDecoration
class FLDyUnitBoxDecoration {
  FLDyUnitBoxDecoration(
      this.color,
      this.image,
      this.border,
      this.borderRadius,
      this.boxShadow,
      this.shape);

  final String color;
  final FLDyUnitDecorationImage image;
  final FLDyUnitBorder border;
  final FLDyUnitBorderRadius borderRadius;
  final List<FLDyUnitBoxShadow> boxShadow;
  final String shape;

  factory FLDyUnitBoxDecoration.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxDecorationFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxDecorationToJson(this);

  BoxDecoration toBoxDecoration() => BoxDecoration(
    color: (color != null ? Color(num.parse(color)) : null),
    image: image?.toDecorationImage(),
    border: border?.toBorder(),
    borderRadius: borderRadius?.toBorderRadius(),
    boxShadow: boxShadow!= null
        ? boxShadow.map((FLDyUnitBoxShadow shadow)
            => shadow.toBoxShadow()).toList() : null,
    shape: flStringToBoxShape(shape) ?? BoxShape.rectangle
  );
}

@JsonSerializable()
/// BoxShadow
class FLDyUnitBoxShadow {
  FLDyUnitBoxShadow(this.color, this.offset, this.blurRadius, this.spreadRadius);

  final String color;
  final FLDyUnitOffset offset;
  final double blurRadius;
  final double spreadRadius;

  factory FLDyUnitBoxShadow.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBoxShadowFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBoxShadowToJson(this);

  BoxShadow toBoxShadow() => BoxShadow(
    color: (color != null ? Color(num.parse(color)) : const Color(0xFF000000)),
    offset: offset?.toOffset(),
    blurRadius: blurRadius ?? 0.0,
    spreadRadius: spreadRadius ?? 0.0,
  );
}

@JsonSerializable()
/// Offset
class FLDyUnitOffset {
  FLDyUnitOffset(this.dx, this.dy);

  final double dx;
  final double dy;

  factory FLDyUnitOffset.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitOffsetFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitOffsetToJson(this);

  Offset toOffset() => Offset(dx, dy);
}

@JsonSerializable()
/// BorderRadius
class FLDyUnitBorderRadius {
  FLDyUnitBorderRadius(this.radius);
  /// all radius value
  final double radius;

  factory FLDyUnitBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBorderRadiusFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBorderRadiusToJson(this);

  BorderRadius toBorderRadius() => BorderRadius.circular(radius);
}

@JsonSerializable()
/// Border
class FLDyUnitBorder {
  FLDyUnitBorder(this.color, this.width, this.style);

  final String color;
  final double width;
  final String style;

  factory FLDyUnitBorder.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitBorderFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitBorderToJson(this);

  Border toBorder() => Border.all(
      color: (color != null ? Color(num.parse(color)) : Color(0xFF000000)),
      width: width ?? 1,
      style: flStringToBorderStyle(style) ?? BorderStyle.solid
  );
}

@JsonSerializable()
/// Align
class FLDyUnitAlign {
  FLDyUnitAlign(this.type, this.mainAxisSize, this.mainAxisAlignment,
      this.crossAxisAlignment);

  final String type;
  final String mainAxisSize;
  final String mainAxisAlignment;
  final String crossAxisAlignment;

  factory FLDyUnitAlign.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitAlignFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitAlignToJson(this);
}

@JsonSerializable()
/// Positioned
class FLDyUnitPositioned {
  FLDyUnitPositioned(this.left, this.top, this.right, this.bottom,
      this.width, this.height);

  final double left;
  final double top;
  final double right;
  final double bottom;
  final double width;
  final double height;

  factory FLDyUnitPositioned.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitPositionedFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitPositionedToJson(this);
}

