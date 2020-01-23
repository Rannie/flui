// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FLDyUnitModel _$FLDyUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    color: json['color'] as String,
    align: json['align'] == null
        ? null
        : FLDyUnitAlign.fromJson(json['align'] as Map<String, dynamic>),
    padding: json['padding'] == null
        ? null
        : FLDyUnitPadding.fromJson(json['padding'] as Map<String, dynamic>),
    child: json['child'] == null
        ? null
        : FLDyUnitModel.fromJson(json['child'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FLDyUnitModelToJson(FLDyUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'align': instance.align,
      'padding': instance.padding,
      'child': instance.child,
      'children': instance.children,
    };

FLDyUnitPadding _$FLDyUnitPaddingFromJson(Map<String, dynamic> json) {
  return FLDyUnitPadding(
    (json['left'] as num)?.toDouble(),
    (json['top'] as num)?.toDouble(),
    (json['right'] as num)?.toDouble(),
    (json['bottom'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitPaddingToJson(FLDyUnitPadding instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'bottom': instance.bottom,
      'right': instance.right,
    };

FLDyUnitAlign _$FLDyUnitAlignFromJson(Map<String, dynamic> json) {
  return FLDyUnitAlign(
    json['type'] as String,
    json['mainAxisSize'] as String,
    json['mainAxisAlignment'] as String,
    json['crossAxisAlignment'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitAlignToJson(FLDyUnitAlign instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mainAxisSize': instance.mainAxisSize,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'crossAxisAlignment': instance.crossAxisAlignment,
    };
