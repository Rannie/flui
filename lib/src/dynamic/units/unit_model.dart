import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'unit_model.g.dart';

class FLDyNativeUnitNames {
  static const String container = 'Container';
  static const String sizedBox = 'SizedBox';
}

class FLDyImageTypes {
  static const String network = 'network';
  static const String asset = 'asset';
}

class FLDyBoxFitTypes {
  static const String fill = 'fill';
  static const String contain = 'contain';
  static const String cover = 'cover';
  static const String fitWidth = 'fitWidth';
  static const String fitHeight = 'fitHeight';
  static const String none = 'none';
  static const String scaleDown = 'scaleDown';
}

class FLDyAlignmentTypes {
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

class FLDyImageRepeatTypes {
  static const String repeat = 'repeat';
  static const String repeatX = 'repeatX';
  static const String repeatY = 'repeatY';
  static const String noRepeat = 'noRepeat';
}

class FLDyBorderStyleTypes {
  static const String none = 'none';
  static const String solid = 'solid';
}

class FLDyBoxShapeTypes {
  static const String rectangle = 'rectangle';
  static const String circle = 'circle';
}

BoxShape _stringToBoxShape(String shape) {
  switch (shape) {
    case FLDyBoxShapeTypes.rectangle: return BoxShape.rectangle;
    case FLDyBoxShapeTypes.circle: return BoxShape.circle;
    default: return null;
  }
}

BoxFit _stringToBoxFit(String fit) {
  BoxFit boxFit;
  switch (fit) {
    case FLDyBoxFitTypes.fill: boxFit = BoxFit.fill; break;
    case FLDyBoxFitTypes.contain: boxFit = BoxFit.contain; break;
    case FLDyBoxFitTypes.cover: boxFit = BoxFit.cover; break;
    case FLDyBoxFitTypes.fitWidth: boxFit = BoxFit.fitWidth; break;
    case FLDyBoxFitTypes.fitHeight: boxFit = BoxFit.fitHeight; break;
    case FLDyBoxFitTypes.none: boxFit = BoxFit.none; break;
    case FLDyBoxFitTypes.scaleDown: boxFit = BoxFit.scaleDown; break;
  }
  return boxFit;
}

ImageRepeat _stringToImageRepeat(String imageRepeat) {
  ImageRepeat ir;
  switch (imageRepeat) {
    case FLDyImageRepeatTypes.noRepeat: ir = ImageRepeat.noRepeat; break;
    case FLDyImageRepeatTypes.repeat: ir = ImageRepeat.repeat; break;
    case FLDyImageRepeatTypes.repeatX: ir = ImageRepeat.repeatX; break;
    case FLDyImageRepeatTypes.repeatY: ir = ImageRepeat.repeatY; break;
  }
  return ir;
}

BorderStyle _stringToBorderStyle(String style) {
  switch (style) {
    case FLDyBorderStyleTypes.none: return BorderStyle.none;
    case FLDyBorderStyleTypes.solid: return BorderStyle.solid;
    default: return null;
  }
}

@JsonSerializable()
/// The unit model classes are responsible for storing view
/// rendering information, bound events and bound data.
class FLDyUnitModel {
  FLDyUnitModel(
      {this.uniqueId, @required this.unitName, this.child, this.children})
      : assert(unitName != null);

  final String uniqueId;
  final String unitName;
  final FLDyUnitModel child;
  final List<FLDyUnitModel> children;

  factory FLDyUnitModel.fromJson(Map<String, dynamic> json) {
    final String unitName = json['unitName'];
    switch (unitName) {
      case FLDyNativeUnitNames.container:
        return FLDyContainerUnitModel.fromJson(json);
      case FLDyNativeUnitNames.sizedBox:
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
    this.width,
    this.height,
    this.color,
    this.align,
    this.padding,
    this.margin,
  }) : super(
            uniqueId: uniqueId,
            unitName: unitName,
            child: child,
            children: children);

  final double width;
  final double height;
  final String color;
  final FLDyUnitAlign align;
  final FLDyUnitEdgeInsets padding;
  final FLDyUnitEdgeInsets margin;

  factory FLDyContainerUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyContainerUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyContainerUnitModelToJson(this);
}

@JsonSerializable()
/// SizedBox
class FLDySizedBoxUnitModel extends FLDyUnitModel {
  FLDySizedBoxUnitModel({
    String uniqueId,
    String unitName,
    this.width,
    this.height,
  }) : super(
          uniqueId: uniqueId,
          unitName: unitName,
        );

  final double width;
  final double height;

  factory FLDySizedBoxUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDySizedBoxUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDySizedBoxUnitModelToJson(this);
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
  /// assset image use
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
class FLDyUnitDecorationIamge {
  FLDyUnitDecorationIamge(this.imageProvider, this.fit, this.alignment, this.imageRepeat);

  final FLDyUnitImageProvider imageProvider;
  final String fit;
  final FLDyUnitAlignment alignment;
  final String imageRepeat;

  factory FLDyUnitDecorationIamge.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitDecorationIamgeFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitDecorationIamgeToJson(this);

  DecorationImage toDecorationImage() => DecorationImage(
    image: (imageProvider.type == FLDyImageTypes.network
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
      image: imageProvider.type == FLDyImageTypes.network
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
  final FLDyUnitDecorationIamge image;
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
    boxShadow: boxShadow?.map((FLDyUnitBoxShadow shadow) => shadow.toBoxShadow()),
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
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
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
      color: (color != null ? Color(num.parse(color)) : null),
      width: width,
      style: _stringToBorderStyle(style)
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
      case FLDyAlignmentTypes.topLeft: return Alignment.topLeft;
      case FLDyAlignmentTypes.topCenter: return Alignment.topCenter;
      case FLDyAlignmentTypes.topRight: return Alignment.topRight;
      case FLDyAlignmentTypes.centerLeft: return Alignment.centerLeft;
      case FLDyAlignmentTypes.center: return Alignment.center;
      case FLDyAlignmentTypes.centerRight: return Alignment.centerRight;
      case FLDyAlignmentTypes.bottomLeft: return Alignment.bottomLeft;
      case FLDyAlignmentTypes.bottomCenter: return Alignment.bottomCenter;
      case FLDyAlignmentTypes.bottomRight: return Alignment.bottomRight;
      default: return null;
    }
  }
}
