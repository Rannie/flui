import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'unit_model.g.dart';

@JsonSerializable()
class FLDyUnitModel {
  FLDyUnitModel({
    this.uniqueId,
    @required this.unitName,
    this.width,
    this.height,
    this.color,
    this.align,
    this.padding,
    this.child,
    this.children
  }) : assert(unitName != null);

  final String uniqueId;
  final String unitName;
  final double width;
  final double height;
  final String color;
  final FLDyUnitAlign align;
  final FLDyUnitPadding padding;
  final FLDyUnitModel child;
  final List<FLDyUnitModel> children;

  factory FLDyUnitModel.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitModelFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitModelToJson(this);
}

@JsonSerializable()
class FLDyUnitPadding {
  FLDyUnitPadding(this.left, this.top, this.right, this.bottom);

  final double top;
  final double left;
  final double bottom;
  final double right;

  factory FLDyUnitPadding.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitPaddingFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitPaddingToJson(this);

  EdgeInsets toEdgeInsets() => EdgeInsets.fromLTRB(left, top, right, bottom);
}

@JsonSerializable()
class FLDyUnitAlign {
  FLDyUnitAlign(this.type, this.mainAxisSize, this.mainAxisAlignment, this.crossAxisAlignment);

  final String type;
  final String mainAxisSize;
  final String mainAxisAlignment;
  final String crossAxisAlignment;

  factory FLDyUnitAlign.fromJson(Map<String, dynamic> json) =>
      _$FLDyUnitAlignFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyUnitAlignToJson(this);
}