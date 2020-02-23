import 'package:flutter/material.dart';

class FLDyNativeUnitName {
  static const String container = 'Container';
  static const String safeArea = 'SafeArea';
  static const String sizedBox = 'SizedBox';
  static const String listView = 'ListView';
  static const String stack = 'Stack';
  static const String listTile = 'ListTile';
  static const String text = 'Text';
  static const String image = 'Image';
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

class FLDyFontWeightType {
  static const String normal = 'normal';
  static const String bold = 'bold';
}

class FLDyFontStyleType {
  static const String nomral = 'normal';
  static const String italic = 'italic';
}

class FLDyTextBaselineType {
  static const String alphabetic = 'alphabetic';
  static const String ideographic = 'ideographic';
}

class FLDyTextDecorationType {
  static const String none = 'none';
  static const String underline = 'underline';
  static const String overline = 'overline';
  static const String lineThrough = 'lineThrough';
}

class FLDyTextDecorationStyleType {
  static const String solid = 'solid';
  static const String double = 'double';
  static const String dotted = 'dotted';
  static const String dashed = 'dashed';
  static const String wavy = 'wavy';
}

class FLDyTextAlignType {
  static const String left = 'left';
  static const String right = 'right';
  static const String center = 'center';
  static const String justify = 'justify';
  static const String start = 'start';
  static const String end = 'end';
}

class FLDyTextDirectionType {
  static const String ltr = 'ltr';
  static const String rtl = 'rtl';
}

class FLDyTextOverflowType {
  static const String clip = 'clip';
  static const String fade = 'fade';
  static const String ellipsis = 'ellipsis';
  static const String visible = 'visible';
}

class FLDyTextWidthBasisType {
  static const String parent = 'parent';
  static const String longestLine = 'longestLine';
}

class FLDyStackFitType {
  static const String loose = 'loose';
  static const String expand = 'expand';
  static const String passthrough = 'passthrough';
}

class FLDyOverflowType {
  static const String visible = 'visible';
  static const String clip = 'clip';
}

class FLDyAlignmentDirectionalType {
  static const String topStart = 'topStart';
  static const String topCenter = 'topCenter';
  static const String topEnd = 'topEnd';
  static const String centerStart = 'centerStart';
  static const String center = 'center';
  static const String centerEnd = 'centerEnd';
  static const String bottomStart = 'bottomStart';
  static const String bottomCenter = 'bottomCenter';
  static const String bottomEnd = 'bottomEnd';
}

AlignmentDirectional flStringToAlignmentDirectional(String alignmentDirectional) {
  switch (alignmentDirectional) {
    case FLDyAlignmentDirectionalType.topStart:
      return AlignmentDirectional.topStart;
    case FLDyAlignmentDirectionalType.topCenter:
      return AlignmentDirectional.topCenter;
    case FLDyAlignmentDirectionalType.topEnd:
      return AlignmentDirectional.topEnd;
    case FLDyAlignmentDirectionalType.centerStart:
      return AlignmentDirectional.centerStart;
    case FLDyAlignmentDirectionalType.center:
      return AlignmentDirectional.center;
    case FLDyAlignmentDirectionalType.centerEnd:
      return AlignmentDirectional.centerEnd;
    case FLDyAlignmentDirectionalType.bottomStart:
      return AlignmentDirectional.bottomStart;
    case FLDyAlignmentDirectionalType.bottomCenter:
      return AlignmentDirectional.bottomCenter;
    case FLDyAlignmentDirectionalType.bottomEnd:
      return AlignmentDirectional.bottomEnd;
    default: return null;
  }
}

Overflow flStringToOverflow(String overflow) {
  switch (overflow) {
    case FLDyOverflowType.visible: return Overflow.visible;
    case FLDyOverflowType.clip: return Overflow.clip;
    default: return null;
  }
}

StackFit flStringToStackFit(String stackFit) {
  switch (stackFit) {
    case FLDyStackFitType.loose: return StackFit.loose;
    case FLDyStackFitType.expand: return StackFit.expand;
    case FLDyStackFitType.passthrough: return StackFit.passthrough;
    default: return null;
  }
}

Alignment flStringtoAlignment(String alignment) {
  switch (alignment) {
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

TextWidthBasis flStringToTextWidthBasis(String textWidthBasis) {
  switch (textWidthBasis) {
    case FLDyTextWidthBasisType.parent: return TextWidthBasis.parent;
    case FLDyTextWidthBasisType.longestLine: return TextWidthBasis.longestLine;
    default: return null;
  }
}

TextOverflow flStringToTextOverflow(String textOverflow) {
  switch (textOverflow) {
    case FLDyTextOverflowType.clip: return TextOverflow.clip;
    case FLDyTextOverflowType.fade: return TextOverflow.fade;
    case FLDyTextOverflowType.ellipsis: return TextOverflow.ellipsis;
    case FLDyTextOverflowType.visible: return TextOverflow.visible;
    default: return null;
  }
}

TextDirection flStringToTextDirection(String textDirection) {
  switch (textDirection) {
    case FLDyTextDirectionType.rtl: return TextDirection.rtl;
    case FLDyTextDirectionType.ltr: return TextDirection.ltr;
    default: return null;
  }
}

TextAlign flStringToTextAlign(String textAlign) {
  switch (textAlign) {
    case FLDyTextAlignType.left: return TextAlign.left;
    case FLDyTextAlignType.right: return TextAlign.right;
    case FLDyTextAlignType.center: return TextAlign.center;
    case FLDyTextAlignType.justify: return TextAlign.justify;
    case FLDyTextAlignType.start: return TextAlign.start;
    case FLDyTextAlignType.end: return TextAlign.end;
    default: return null;
  }
}

TextDecorationStyle flStringToTextDecorationStyle(String decorationStyle) {
  switch (decorationStyle) {
    case FLDyTextDecorationStyleType.solid: return TextDecorationStyle.solid;
    case FLDyTextDecorationStyleType.double: return TextDecorationStyle.double;
    case FLDyTextDecorationStyleType.dotted: return TextDecorationStyle.dotted;
    case FLDyTextDecorationStyleType.dashed: return TextDecorationStyle.dashed;
    case FLDyTextDecorationStyleType.wavy: return TextDecorationStyle.wavy;
    default: return null;
  }
}

TextDecoration flStringToTextDecoration (String decoration) {
  switch (decoration) {
    case FLDyTextDecorationType.none: return TextDecoration.none;
    case FLDyTextDecorationType.underline: return TextDecoration.underline;
    case FLDyTextDecorationType.overline: return TextDecoration.overline;
    case FLDyTextDecorationType.lineThrough: return TextDecoration.lineThrough;
    default: return null;
  }
}

TextBaseline flStringToTextBaseline (String textBaseline) {
  switch (textBaseline) {
    case FLDyTextBaselineType.alphabetic: return TextBaseline.alphabetic;
    case FLDyTextBaselineType.ideographic: return TextBaseline.ideographic;
    default: return null;
  }
}

FontStyle flStringToFontStyle (String fontStyle) {
  switch (fontStyle) {
    case FLDyFontStyleType.nomral: return FontStyle.normal;
    case FLDyFontStyleType.italic: return FontStyle.italic;
    default: return null;
  }
}

FontWeight flStringToFontWeight (String fontWeight) {
  switch (fontWeight) {
    case FLDyFontWeightType.normal: return FontWeight.normal;
    case FLDyFontWeightType.bold: return FontWeight.bold;
    default: return null;
  }
}

Axis flStringToAxis(String axis) {
  switch (axis) {
    case FLDyAxisType.horizontal: return Axis.horizontal;
    case FLDyAxisType.vertical: return Axis.vertical;
    default: return null;
  }
}

BoxShape flStringToBoxShape(String shape) {
  switch (shape) {
    case FLDyBoxShapeType.rectangle: return BoxShape.rectangle;
    case FLDyBoxShapeType.circle: return BoxShape.circle;
    default: return null;
  }
}

BoxFit flStringToBoxFit(String fit) {
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

ImageRepeat flStringToImageRepeat(String imageRepeat) {
  ImageRepeat ir;
  switch (imageRepeat) {
    case FLDyImageRepeatType.noRepeat: ir = ImageRepeat.noRepeat; break;
    case FLDyImageRepeatType.repeat: ir = ImageRepeat.repeat; break;
    case FLDyImageRepeatType.repeatX: ir = ImageRepeat.repeatX; break;
    case FLDyImageRepeatType.repeatY: ir = ImageRepeat.repeatY; break;
  }
  return ir;
}

BorderStyle flStringToBorderStyle(String style) {
  switch (style) {
    case FLDyBorderStyleType.none: return BorderStyle.none;
    case FLDyBorderStyleType.solid: return BorderStyle.solid;
    default: return null;
  }
}