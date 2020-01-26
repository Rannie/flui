// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FLDyUnitModel _$FLDyUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    flex: json['flex'] as String,
    align: json['align'] == null
        ? null
        : FLDyUnitAlign.fromJson(json['align'] as Map<String, dynamic>),
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
      'flex': instance.flex,
      'align': instance.align,
      'child': instance.child,
      'children': instance.children,
    };

FLDyContainerUnitModel _$FLDyContainerUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDyContainerUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    child: json['child'] == null
        ? null
        : FLDyUnitModel.fromJson(json['child'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    flex: json['flex'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    color: json['color'] as String,
    align: json['align'] == null
        ? null
        : FLDyUnitAlign.fromJson(json['align'] as Map<String, dynamic>),
    padding: json['padding'] == null
        ? null
        : FLDyUnitEdgeInsets.fromJson(json['padding'] as Map<String, dynamic>),
    margin: json['margin'] == null
        ? null
        : FLDyUnitEdgeInsets.fromJson(json['margin'] as Map<String, dynamic>),
    decoration: json['decoration'] == null
        ? null
        : FLDyUnitBoxDecoration.fromJson(
            json['decoration'] as Map<String, dynamic>),
    foregroundDecoration: json['foregroundDecoration'] == null
        ? null
        : FLDyUnitBoxDecoration.fromJson(
            json['foregroundDecoration'] as Map<String, dynamic>),
    constraints: json['constraints'] == null
        ? null
        : FLDyUnitBoxConstraints.fromJson(
            json['constraints'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FLDyContainerUnitModelToJson(
        FLDyContainerUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'flex': instance.flex,
      'align': instance.align,
      'child': instance.child,
      'children': instance.children,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'padding': instance.padding,
      'margin': instance.margin,
      'decoration': instance.decoration,
      'foregroundDecoration': instance.foregroundDecoration,
      'constraints': instance.constraints,
    };

FLDySafeAreaUnitModel _$FLDySafeAreaUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDySafeAreaUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    child: json['child'] == null
        ? null
        : FLDyUnitModel.fromJson(json['child'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    align: json['align'] == null
        ? null
        : FLDyUnitAlign.fromJson(json['align'] as Map<String, dynamic>),
    left: json['left'] as bool,
    top: json['top'] as bool,
    right: json['right'] as bool,
    bottom: json['bottom'] as bool,
    minimum: json['minimum'] == null
        ? null
        : FLDyUnitEdgeInsets.fromJson(json['minimum'] as Map<String, dynamic>),
    maintainBottomViewPadding: json['maintainBottomViewPadding'] as bool,
  );
}

Map<String, dynamic> _$FLDySafeAreaUnitModelToJson(
        FLDySafeAreaUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'align': instance.align,
      'child': instance.child,
      'children': instance.children,
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'minimum': instance.minimum,
      'maintainBottomViewPadding': instance.maintainBottomViewPadding,
    };

FLDyListViewUnitModel _$FLDyListViewUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDyListViewUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scrollDirection: json['scrollDirection'] as String,
    reverse: json['reverse'] as bool,
    primary: json['primary'] as bool,
    scrollPhysics: json['scrollPhysics'] == null
        ? null
        : FLDyUnitScrollPhysics.fromJson(
            json['scrollPhysics'] as Map<String, dynamic>),
    shrinkWrap: json['shrinkWrap'] as bool,
    padding: json['padding'] == null
        ? null
        : FLDyUnitEdgeInsets.fromJson(json['padding'] as Map<String, dynamic>),
    itemExtent: (json['itemExtent'] as num)?.toDouble(),
    addAutomaticKeepAlives: json['addAutomaticKeepAlives'] as bool,
    addRepaintBoundaries: json['addRepaintBoundaries'] as bool,
    addSemanticIndexes: json['addSemanticIndexes'] as bool,
    cacheExtent: (json['cacheExtent'] as num)?.toDouble(),
    semanticChildCount: json['semanticChildCount'] as int,
    separetedDivider: json['separetedDivider'] == null
        ? null
        : FLDyUnitDivider.fromJson(
            json['separetedDivider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FLDyListViewUnitModelToJson(
        FLDyListViewUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'children': instance.children,
      'scrollDirection': instance.scrollDirection,
      'reverse': instance.reverse,
      'primary': instance.primary,
      'scrollPhysics': instance.scrollPhysics,
      'shrinkWrap': instance.shrinkWrap,
      'padding': instance.padding,
      'itemExtent': instance.itemExtent,
      'addAutomaticKeepAlives': instance.addAutomaticKeepAlives,
      'addRepaintBoundaries': instance.addRepaintBoundaries,
      'addSemanticIndexes': instance.addSemanticIndexes,
      'cacheExtent': instance.cacheExtent,
      'semanticChildCount': instance.semanticChildCount,
      'separetedDivider': instance.separetedDivider,
    };

FLDySizedBoxUnitModel _$FLDySizedBoxUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDySizedBoxUnitModel(
    unitName: json['unitName'] as String,
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDySizedBoxUnitModelToJson(
        FLDySizedBoxUnitModel instance) =>
    <String, dynamic>{
      'unitName': instance.unitName,
      'width': instance.width,
      'height': instance.height,
    };

FLDyUnitDivider _$FLDyUnitDividerFromJson(Map<String, dynamic> json) {
  return FLDyUnitDivider(
    (json['height'] as num)?.toDouble(),
    (json['thickness'] as num)?.toDouble(),
    (json['indent'] as num)?.toDouble(),
    (json['endIndent'] as num)?.toDouble(),
    json['color'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitDividerToJson(FLDyUnitDivider instance) =>
    <String, dynamic>{
      'height': instance.height,
      'thickness': instance.thickness,
      'indent': instance.indent,
      'endIndent': instance.endIndent,
      'color': instance.color,
    };

FLDyUnitScrollPhysics _$FLDyUnitScrollPhysicsFromJson(
    Map<String, dynamic> json) {
  return FLDyUnitScrollPhysics(
    json['type'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitScrollPhysicsToJson(
        FLDyUnitScrollPhysics instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

FLDyUnitEdgeInsets _$FLDyUnitEdgeInsetsFromJson(Map<String, dynamic> json) {
  return FLDyUnitEdgeInsets(
    (json['left'] as num)?.toDouble(),
    (json['top'] as num)?.toDouble(),
    (json['right'] as num)?.toDouble(),
    (json['bottom'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitEdgeInsetsToJson(FLDyUnitEdgeInsets instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'bottom': instance.bottom,
      'right': instance.right,
    };

FLDyUnitImageProvider _$FLDyUnitImageProviderFromJson(
    Map<String, dynamic> json) {
  return FLDyUnitImageProvider(
    json['type'] as String,
    json['url'] as String,
    json['assetName'] as String,
    scale: (json['scale'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitImageProviderToJson(
        FLDyUnitImageProvider instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'assetName': instance.assetName,
      'scale': instance.scale,
    };

FLDyUnitDecorationImage _$FLDyUnitDecorationImageFromJson(
    Map<String, dynamic> json) {
  return FLDyUnitDecorationImage(
    json['imageProvider'] == null
        ? null
        : FLDyUnitImageProvider.fromJson(
            json['imageProvider'] as Map<String, dynamic>),
    json['fit'] as String,
    json['alignment'] == null
        ? null
        : FLDyUnitAlignment.fromJson(json['alignment'] as Map<String, dynamic>),
    json['imageRepeat'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitDecorationImageToJson(
        FLDyUnitDecorationImage instance) =>
    <String, dynamic>{
      'imageProvider': instance.imageProvider,
      'fit': instance.fit,
      'alignment': instance.alignment,
      'imageRepeat': instance.imageRepeat,
    };

FLDyUnitImage _$FLDyUnitImageFromJson(Map<String, dynamic> json) {
  return FLDyUnitImage(
    imageProvider: json['imageProvider'] == null
        ? null
        : FLDyUnitImageProvider.fromJson(
            json['imageProvider'] as Map<String, dynamic>),
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    color: json['color'] as String,
    fit: json['fit'] as String,
    alignment: json['alignment'] == null
        ? null
        : FLDyUnitAlignment.fromJson(json['alignment'] as Map<String, dynamic>),
    imageRepeat: json['imageRepeat'] as String,
    semanticLabel: json['semanticLabel'] as String,
    excludeFromSemantics: json['excludeFromSemantics'] as bool,
  );
}

Map<String, dynamic> _$FLDyUnitImageToJson(FLDyUnitImage instance) =>
    <String, dynamic>{
      'imageProvider': instance.imageProvider,
      'width': instance.width,
      'height': instance.height,
      'color': instance.color,
      'fit': instance.fit,
      'alignment': instance.alignment,
      'imageRepeat': instance.imageRepeat,
      'semanticLabel': instance.semanticLabel,
      'excludeFromSemantics': instance.excludeFromSemantics,
    };

FLDyUnitBoxConstraints _$FLDyUnitBoxConstraintsFromJson(
    Map<String, dynamic> json) {
  return FLDyUnitBoxConstraints(
    (json['minWidth'] as num)?.toDouble(),
    (json['maxWidth'] as num)?.toDouble(),
    (json['minHeight'] as num)?.toDouble(),
    (json['maxHeight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitBoxConstraintsToJson(
        FLDyUnitBoxConstraints instance) =>
    <String, dynamic>{
      'minWidth': instance.minWidth,
      'maxWidth': instance.maxWidth,
      'minHeight': instance.minHeight,
      'maxHeight': instance.maxHeight,
    };

FLDyUnitBoxDecoration _$FLDyUnitBoxDecorationFromJson(
    Map<String, dynamic> json) {
  return FLDyUnitBoxDecoration(
    json['color'] as String,
    json['image'] == null
        ? null
        : FLDyUnitDecorationImage.fromJson(
            json['image'] as Map<String, dynamic>),
    json['border'] == null
        ? null
        : FLDyUnitBorder.fromJson(json['border'] as Map<String, dynamic>),
    json['borderRadius'] == null
        ? null
        : FLDyUnitBorderRadius.fromJson(
            json['borderRadius'] as Map<String, dynamic>),
    (json['boxShadow'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitBoxShadow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['shape'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitBoxDecorationToJson(
        FLDyUnitBoxDecoration instance) =>
    <String, dynamic>{
      'color': instance.color,
      'image': instance.image,
      'border': instance.border,
      'borderRadius': instance.borderRadius,
      'boxShadow': instance.boxShadow,
      'shape': instance.shape,
    };

FLDyUnitBoxShadow _$FLDyUnitBoxShadowFromJson(Map<String, dynamic> json) {
  return FLDyUnitBoxShadow(
    json['color'] as String,
    json['offset'] == null
        ? null
        : FLDyUnitOffset.fromJson(json['offset'] as Map<String, dynamic>),
    (json['blurRadius'] as num)?.toDouble(),
    (json['spreadRadius'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitBoxShadowToJson(FLDyUnitBoxShadow instance) =>
    <String, dynamic>{
      'color': instance.color,
      'offset': instance.offset,
      'blurRadius': instance.blurRadius,
      'spreadRadius': instance.spreadRadius,
    };

FLDyUnitOffset _$FLDyUnitOffsetFromJson(Map<String, dynamic> json) {
  return FLDyUnitOffset(
    (json['dx'] as num)?.toDouble(),
    (json['dy'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitOffsetToJson(FLDyUnitOffset instance) =>
    <String, dynamic>{
      'dx': instance.dx,
      'dy': instance.dy,
    };

FLDyUnitBorderRadius _$FLDyUnitBorderRadiusFromJson(Map<String, dynamic> json) {
  return FLDyUnitBorderRadius(
    (json['radius'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitBorderRadiusToJson(
        FLDyUnitBorderRadius instance) =>
    <String, dynamic>{
      'radius': instance.radius,
    };

FLDyUnitBorder _$FLDyUnitBorderFromJson(Map<String, dynamic> json) {
  return FLDyUnitBorder(
    json['color'] as String,
    (json['width'] as num)?.toDouble(),
    json['style'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitBorderToJson(FLDyUnitBorder instance) =>
    <String, dynamic>{
      'color': instance.color,
      'width': instance.width,
      'style': instance.style,
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

FLDyUnitAlignment _$FLDyUnitAlignmentFromJson(Map<String, dynamic> json) {
  return FLDyUnitAlignment(
    json['type'] as String,
  );
}

Map<String, dynamic> _$FLDyUnitAlignmentToJson(FLDyUnitAlignment instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
