import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'unit_model.g.dart';

class FLDyNativeUnitNames {
  static const String container = 'Container';
  static const String sizedBox = 'SizedBox';
}

/// The unit model classes are responsible for storing view
/// rendering information, bound events and bound data.
@JsonSerializable()
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
