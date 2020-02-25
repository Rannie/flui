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
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
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
      'positioned': instance.positioned,
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
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
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
      'positioned': instance.positioned,
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

FLDyStackUnitModel _$FLDyStackUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyStackUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    alignment: json['alignment'] as String,
    fit: json['fit'] as String,
    textDirection: json['textDirection'] as String,
    overflow: json['overflow'] as String,
  );
}

Map<String, dynamic> _$FLDyStackUnitModelToJson(FLDyStackUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
      'children': instance.children,
      'alignment': instance.alignment,
      'textDirection': instance.textDirection,
      'fit': instance.fit,
      'overflow': instance.overflow,
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
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
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
    separatedDivider: json['separatedDivider'] == null
        ? null
        : FLDyUnitDivider.fromJson(
            json['separatedDivider'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FLDyListViewUnitModelToJson(
        FLDyListViewUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
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
      'separatedDivider': instance.separatedDivider,
    };

FLDyListTileUnitModel _$FLDyListTileUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDyListTileUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    leading: json['leading'] == null
        ? null
        : FLDyUnitModel.fromJson(json['leading'] as Map<String, dynamic>),
    title: json['title'] == null
        ? null
        : FLDyUnitModel.fromJson(json['title'] as Map<String, dynamic>),
    subtitle: json['subtitle'] == null
        ? null
        : FLDyUnitModel.fromJson(json['subtitle'] as Map<String, dynamic>),
    trailing: json['trailing'] == null
        ? null
        : FLDyUnitModel.fromJson(json['trailing'] as Map<String, dynamic>),
    isThreeLine: json['isThreeLine'] as bool,
    dense: json['dense'] as bool,
    contentPadding: json['contentPadding'] == null
        ? null
        : FLDyUnitEdgeInsets.fromJson(
            json['contentPadding'] as Map<String, dynamic>),
    enabled: json['enabled'] as bool,
    selected: json['selected'] as bool,
  );
}

Map<String, dynamic> _$FLDyListTileUnitModelToJson(
        FLDyListTileUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
      'leading': instance.leading,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'trailing': instance.trailing,
      'isThreeLine': instance.isThreeLine,
      'dense': instance.dense,
      'contentPadding': instance.contentPadding,
      'enabled': instance.enabled,
      'selected': instance.selected,
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

FLDyTextUnitModel _$FLDyTextUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyTextUnitModel(
    json['text'] as String,
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    textStyle: json['textStyle'] == null
        ? null
        : FLDyUnitTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
    textAlign: json['textAlign'] as String,
    textDirection: json['textDirection'] as String,
    softWrap: json['softWrap'] as bool,
    textOverflow: json['textOverflow'] as String,
    textScaleFactor: (json['textScaleFactor'] as num)?.toDouble(),
    maxLines: json['maxLines'] as int,
    semanticsLabel: json['semanticsLabel'] as String,
    textWidthBasis: json['textWidthBasis'] as String,
  );
}

Map<String, dynamic> _$FLDyTextUnitModelToJson(FLDyTextUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
      'text': instance.text,
      'textStyle': instance.textStyle,
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'textOverflow': instance.textOverflow,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'semanticsLabel': instance.semanticsLabel,
      'textWidthBasis': instance.textWidthBasis,
    };

FLDyRichTextUnitModel _$FLDyRichTextUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDyRichTextUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    text: json['text'] == null
        ? null
        : FLDyTextSpanUnitModel.fromJson(json['text'] as Map<String, dynamic>),
    textAlign: json['textAlign'] as String,
    textDirection: json['textDirection'] as String,
    softWrap: json['softWrap'] as bool,
    textOverflow: json['textOverflow'] as String,
    textScaleFactor: (json['textScaleFactor'] as num)?.toDouble(),
    maxLines: json['maxLines'] as int,
    semanticsLabel: json['semanticsLabel'] as String,
    textWidthBasis: json['textWidthBasis'] as String,
  );
}

Map<String, dynamic> _$FLDyRichTextUnitModelToJson(
        FLDyRichTextUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
      'text': instance.text,
      'textAlign': instance.textAlign,
      'textDirection': instance.textDirection,
      'softWrap': instance.softWrap,
      'textOverflow': instance.textOverflow,
      'textScaleFactor': instance.textScaleFactor,
      'maxLines': instance.maxLines,
      'semanticsLabel': instance.semanticsLabel,
      'textWidthBasis': instance.textWidthBasis,
    };

FLDyTextSpanUnitModel _$FLDyTextSpanUnitModelFromJson(
    Map<String, dynamic> json) {
  return FLDyTextSpanUnitModel(
    uniqueId: json['uniqueId'] as String,
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : FLDyTextSpanUnitModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    text: json['text'] as String,
    textStyle: json['textStyle'] == null
        ? null
        : FLDyUnitTextStyle.fromJson(json['textStyle'] as Map<String, dynamic>),
    semanticsLabel: json['semanticsLabel'] as String,
  );
}

Map<String, dynamic> _$FLDyTextSpanUnitModelToJson(
        FLDyTextSpanUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'children': instance.children,
      'text': instance.text,
      'textStyle': instance.textStyle,
      'semanticsLabel': instance.semanticsLabel,
    };

FLDyImageUnitModel _$FLDyImageUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyImageUnitModel(
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    flex: json['flex'] as String,
    imageProvider: json['imageProvider'] == null
        ? null
        : FLDyUnitImageProvider.fromJson(
            json['imageProvider'] as Map<String, dynamic>),
    width: (json['width'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    color: json['color'] as String,
    fit: json['fit'] as String,
    alignment: json['alignment'] as String,
    imageRepeat: json['imageRepeat'] as String,
    semanticLabel: json['semanticLabel'] as String,
    excludeFromSemantics: json['excludeFromSemantics'] as bool,
  );
}

Map<String, dynamic> _$FLDyImageUnitModelToJson(FLDyImageUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'flex': instance.flex,
      'positioned': instance.positioned,
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

FLDyIconUnitModel _$FLDyIconUnitModelFromJson(Map<String, dynamic> json) {
  return FLDyIconUnitModel(
    json['icon'] == null
        ? null
        : FLDyUnitIconData.fromJson(json['icon'] as Map<String, dynamic>),
    uniqueId: json['uniqueId'] as String,
    unitName: json['unitName'] as String,
    positioned: json['positioned'] == null
        ? null
        : FLDyUnitPositioned.fromJson(
            json['positioned'] as Map<String, dynamic>),
    size: (json['size'] as num)?.toDouble(),
    color: json['color'] as String,
    semanticLabel: json['semanticLabel'] as String,
    textDirection: json['textDirection'] as String,
  );
}

Map<String, dynamic> _$FLDyIconUnitModelToJson(FLDyIconUnitModel instance) =>
    <String, dynamic>{
      'uniqueId': instance.uniqueId,
      'unitName': instance.unitName,
      'positioned': instance.positioned,
      'icon': instance.icon,
      'size': instance.size,
      'color': instance.color,
      'semanticLabel': instance.semanticLabel,
      'textDirection': instance.textDirection,
    };

FLDyUnitIconData _$FLDyUnitIconDataFromJson(Map<String, dynamic> json) {
  return FLDyUnitIconData(
    json['codePoint'] as int,
    json['fontFamily'] as String,
    json['fontPackage'] as String,
    json['matchTextDirection'] as bool,
  );
}

Map<String, dynamic> _$FLDyUnitIconDataToJson(FLDyUnitIconData instance) =>
    <String, dynamic>{
      'codePoint': instance.codePoint,
      'fontFamily': instance.fontFamily,
      'fontPackage': instance.fontPackage,
      'matchTextDirection': instance.matchTextDirection,
    };

FLDyUnitTextStyle _$FLDyUnitTextStyleFromJson(Map<String, dynamic> json) {
  return FLDyUnitTextStyle(
    json['themeStyle'] as String,
    json['inherit'] as bool,
    json['color'] as String,
    json['backgroundColor'] as String,
    json['fontFamily'] as String,
    (json['fontSize'] as num)?.toDouble(),
    json['fontWeight'] as String,
    json['fontStyle'] as String,
    (json['letterSpacing'] as num)?.toDouble(),
    (json['wordSpacing'] as num)?.toDouble(),
    json['textBaseline'] as String,
    (json['height'] as num)?.toDouble(),
    (json['textDecorations'] as List)?.map((e) => e as String)?.toList(),
    json['decorationColor'] as String,
    json['decorationStyle'] as String,
    (json['decorationThickness'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitTextStyleToJson(FLDyUnitTextStyle instance) =>
    <String, dynamic>{
      'themeStyle': instance.themeStyle,
      'inherit': instance.inherit,
      'color': instance.color,
      'backgroundColor': instance.backgroundColor,
      'fontFamily': instance.fontFamily,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
      'fontStyle': instance.fontStyle,
      'letterSpacing': instance.letterSpacing,
      'wordSpacing': instance.wordSpacing,
      'textBaseline': instance.textBaseline,
      'height': instance.height,
      'textDecorations': instance.textDecorations,
      'decorationColor': instance.decorationColor,
      'decorationStyle': instance.decorationStyle,
      'decorationThickness': instance.decorationThickness,
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
    (json['all'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitEdgeInsetsToJson(FLDyUnitEdgeInsets instance) =>
    <String, dynamic>{
      'top': instance.top,
      'left': instance.left,
      'bottom': instance.bottom,
      'right': instance.right,
      'all': instance.all,
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
    json['alignment'] as String,
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
    json['alignment'] as String,
    (json['widthFactor'] as num)?.toDouble(),
    (json['heightFactor'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitAlignToJson(FLDyUnitAlign instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mainAxisSize': instance.mainAxisSize,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'alignment': instance.alignment,
      'widthFactor': instance.widthFactor,
      'heightFactor': instance.heightFactor,
    };

FLDyUnitPositioned _$FLDyUnitPositionedFromJson(Map<String, dynamic> json) {
  return FLDyUnitPositioned(
    (json['left'] as num)?.toDouble(),
    (json['top'] as num)?.toDouble(),
    (json['right'] as num)?.toDouble(),
    (json['bottom'] as num)?.toDouble(),
    (json['width'] as num)?.toDouble(),
    (json['height'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FLDyUnitPositionedToJson(FLDyUnitPositioned instance) =>
    <String, dynamic>{
      'left': instance.left,
      'top': instance.top,
      'right': instance.right,
      'bottom': instance.bottom,
      'width': instance.width,
      'height': instance.height,
    };
