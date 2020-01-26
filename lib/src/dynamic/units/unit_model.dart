import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'unit_model.g.dart';

class FLDyNativeUnitName {
  static const String container = 'Container';
  static const String safeArea = 'SafeArea';
  static const String sizedBox = 'SizedBox';
}

class FLDyImageType {
  static const String network = 'network';
  static const String asset = 'asset';
}

class FLDyBoxFitType {
  static const String fill = 'fill';
  static const String contain = 'contain';
  static const String cover = 'cover';
  static const String fitWidth = 'fitWidth';
  static const String fitHeight = 'fitHeight';
  static const String none = 'none';
  static const String scaleDown = 'scaleDown';
}

class FLDyAlignmentType {
  static const String topLeft = 'topLeft';
  static const String topCenter = 'topCenter';
  static const String topRight = 'topRight';
  static const String centerLeft = 'centerLeft';
  static const String center = 'center';
  static const String centerRight = 'centerRight';
  static const String bottomLeft = 'bottomLeft';
  static const String bottomCenter = 'bottomCenter';
  static const String bottomRight = 'bottomRight';
}

class FLDyImageRepeatType {
  static const String repeat = 'repeat';
  static const String repeatX = 'repeatX';
  static const String repeatY = 'repeatY';
  static const String noRepeat = 'noRepeat';
}

class FLDyBorderStyleType {
  static const String none = 'none';
  static const String solid = 'solid';
}

class FLDyBoxShapeType {
  static const String rectangle = 'rectangle';
  static const String circle = 'circle';
}

class FLDyAxisType {
  static const String horizontal = 'horizontal';
  static const String vertical = 'vertical';
}

class FLDyScrollPhysicsType {
  static const String bouncing = 'Bouncing';
  static const String clamping = 'Clamping';
  static const String alwaysScrollable = 'AlwaysScrollable';
  static const String neverScrollable = 'NeverScrollable';
}

Axis _stringToAxis(String axis) {
  switch (axis) {
    case FLDyAxisType.horizontal: return Axis.horizontal;
    case FLDyAxisType.vertical: return Axis.vertical;
    default: return null;
  }
}

BoxShape _stringToBoxShape(String shape) {
  switch (shape) {
    case FLDyBoxShapeType.rectangle: return BoxShape.rectangle;
    case FLDyBoxShapeType.circle: return BoxShape.circle;
    default: return null;
  }
}

BoxFit _stringToBoxFit(String fit) {
  BoxFit boxFit;
  switch (fit) {
    case FLDyBoxFitType.fill: boxFit = BoxFit.fill; break;
    case FLDyBoxFitType.contain: boxFit = BoxFit.contain; break;
    case FLDyBoxFitType.cover: boxFit = BoxFit.cover; break;
    case FLDyBoxFitType.fitWidth: boxFit = BoxFit.fitWidth; break;
    case FLDyBoxFitType.fitHeight: boxFit = BoxFit.fitHeight; break;
    case FLDyBoxFitType.none: boxFit = BoxFit.none; break;
    case FLDyBoxFitType.scaleDown: boxFit = BoxFit.scaleDown; break;
  }
  return boxFit;
}

ImageRepeat _stringToImageRepeat(String imageRepeat) {
  ImageRepeat ir;
  switch (imageRepeat) {
    case FLDyImageRepeatType.noRepeat: ir = ImageRepeat.noRepeat; break;
    case FLDyImageRepeatType.repeat: ir = ImageRepeat.repeat; break;
    case FLDyImageRepeatType.repeatX: ir = ImageRepeat.repeatX; break;
    case FLDyImageRepeatType.repeatY: ir = ImageRepeat.repeatY; break;
  }
  return ir;
}

BorderStyle _stringToBorderStyle(String style) {
  switch (style) {
    case FLDyBorderStyleType.none: return BorderStyle.none;
    case FLDyBorderStyleType.solid: return BorderStyle.solid;
    default: return null;
  }
}

@JsonSerializable()
/// The unit model classes are responsible for storing view
/// rendering information, bound events and bound data.
class FLDyUnitModel {
  FLDyUnitModel(
      {this.uniqueId, @required this.unitName, this.flex, this.align, this.child, this.children})
      : assert(unitName != null);

  final String uniqueId;
  final String unitName;
  final String flex;
  final FLDyUnitAlign align;
  final FLDyUnitModel child;
  final List<FLDyUnitModel> children;

  factory FLDyUnitModel.fromJson(Map<String, dynamic> json) {
    final String unitName = json['unitName'];
    switch (unitName) {
      case FLDyNativeUnitName.container:
        return FLDyContainerUnitModel.fromJson(json);
      case FLDyNativeUnitName.safeArea:
        return FLDySafeAreaUnitModel.fromJson(json);
      case FLDyNativeUnitName.sizedBox:
        return FLDySizedBoxUnitModel.fromJson(json);
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
            align: align);

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
/// ListView
class FLDyListViewUnitModel extends FLDyUnitModel {
  FLDyListViewUnitModel({
    String uniqueId,
    String unitName,
    List<FLDyUnitModel> children,
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
    this.separetedDivider,
  }) : super(
    uniqueId: uniqueId,
    unitName: unitName,
    children: children);

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
  final FLDyUnitDivider separetedDivider;

  factory FLDyListViewUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyListViewUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyListViewUnitModelToJson(this);
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
  FLDyUnitEdgeInsets(this.left, this.top, this.right, this.bottom);

  final double top;
  final double left;
  final double bottom;
  final double right;

  factory FLDyUnitEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitEdgeInsetsFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitEdgeInsetsToJson(this);

  EdgeInsets toEdgeInsets() =>
      EdgeInsets.fromLTRB(left ?? 0, top ?? 0, right ?? 0, bottom ?? 0);
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
  final FLDyUnitAlignment alignment;
  final String imageRepeat;

  factory FLDyUnitDecorationImage.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDecorationImageFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDecorationImageToJson(this);

  DecorationImage toDecorationImage() => DecorationImage(
    image: (imageProvider.type == FLDyImageType.network
        ? imageProvider.toNetworkImage() : imageProvider.toAssetImage()),
    fit: _stringToBoxFit(fit),
    alignment: alignment?.toAlignment() ?? Alignment.center,
    repeat: _stringToImageRepeat(imageRepeat)
  );
}

@JsonSerializable()
/// Image
class FLDyUnitImage {
  FLDyUnitImage({
    @required this.imageProvider,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment,
    this.imageRepeat,
    this.semanticLabel,
    this.excludeFromSemantics
  });

  final FLDyUnitImageProvider imageProvider;
  //TODO: add loading builder
  final double width;
  final double height;
  final String color;
  final String fit;
  final FLDyUnitAlignment alignment;
  final String imageRepeat;
  final String semanticLabel;
  final bool excludeFromSemantics;

  factory FLDyUnitImage.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitImageFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitImageToJson(this);

  Image toImage() {
    return Image(
      image: imageProvider.type == FLDyImageType.network
          ? imageProvider.toNetworkImage() : imageProvider.toAssetImage(),
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics ?? false,
      width: width,
      height: height,
      color: Color(num.parse(color)),
      fit: _stringToBoxFit(fit),
      alignment: alignment?.toAlignment() ?? Alignment.center,
      repeat: _stringToImageRepeat(imageRepeat) ?? ImageRepeat.noRepeat,
    );
  }
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
    shape: _stringToBoxShape(shape) ?? BoxShape.rectangle
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
      style: _stringToBorderStyle(style) ?? BorderStyle.solid
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
class FLDyUnitAlignment {
  FLDyUnitAlignment(this.type);
  final String type;

  factory FLDyUnitAlignment.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitAlignmentFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitAlignmentToJson(this);

  Alignment toAlignment() {
    switch (type) {
      case FLDyAlignmentType.topLeft: return Alignment.topLeft;
      case FLDyAlignmentType.topCenter: return Alignment.topCenter;
      case FLDyAlignmentType.topRight: return Alignment.topRight;
      case FLDyAlignmentType.centerLeft: return Alignment.centerLeft;
      case FLDyAlignmentType.center: return Alignment.center;
      case FLDyAlignmentType.centerRight: return Alignment.centerRight;
      case FLDyAlignmentType.bottomLeft: return Alignment.bottomLeft;
      case FLDyAlignmentType.bottomCenter: return Alignment.bottomCenter;
      case FLDyAlignmentType.bottomRight: return Alignment.bottomRight;
      default: return null;
    }
  }
}
