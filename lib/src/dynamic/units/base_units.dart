import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/core/render_parser.dart';

abstract class FLDyBaseUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) => null;
}

abstract class FLDyRenderUnit extends FLDyBaseUnit {
  FLDyRenderUnit({@required this.unitModel})
      : assert(unitModel != null),
        super();

  final FLDyUnitModel unitModel;
  String get uniqueId => unitModel.uniqueId;

  // subclass override
  @override
  Widget build(BuildContext context) => null;

  // mark up single unit
  Widget markupUnit(FLDyUnitModel unitModel) =>
      FLDyRenderParser.parseUnitModel(unitModel);
  // mark up unit list
  List<Widget> markupUnits(List<FLDyUnitModel> unitModels) {
    List<Widget> children = [];
    unitModels.forEach((FLDyUnitModel unitModel) {
      children.add(markupUnit(unitModel));
    });
    return children;
  }

  Widget resolveChild(FLDyUnitAlign align) {
    Widget child;
    if (align != null && unitModel.child != null)
      child = resolveAlignChild(align, unitModel.child);
    else if (align != null && unitModel.children != null)
      child = resolveAlignChildren(align, unitModel.children);
    else if (unitModel.child != null) child = markupUnit(unitModel.child);
    return child;
  }

  // resolve child with align
  Widget resolveAlignChild(FLDyUnitAlign align, FLDyUnitModel childModel) {
    assert(align != null);
    assert(childModel != null);
    final Widget widget = markupUnit(childModel);
    return FLDyAlignUnit(
      align: align,
      child: widget,
    );
  }

  // resolve children with align
  Widget resolveAlignChildren(
      FLDyUnitAlign align, List<FLDyUnitModel> childModels) {
    assert(align != null);
    assert(childModels != null);
    final List<Widget> widgets = markupUnits(childModels);
    return FLDyAlignUnit(
      align: align,
      children: widgets,
    );
  }
}

class FLDyAlignUnit extends FLDyBaseUnit {
  FLDyAlignUnit({@required this.align, this.child, this.children})
      : assert(align != null);

  final FLDyUnitAlign align;
  final Widget child;
  final List<Widget> children;

  MainAxisSize resolveMainAxisSize(String size) {
    switch (size) {
      case "min":
        return MainAxisSize.min;
      case "max":
        return MainAxisSize.max;
      default:
        return null;
    }
  }

  MainAxisAlignment resolveMainAlignment(String alignment) {
    switch (alignment) {
      case "start":
        return MainAxisAlignment.start;
      case "end":
        return MainAxisAlignment.end;
      case "center":
        return MainAxisAlignment.center;
      case "spaceBetween":
        return MainAxisAlignment.spaceBetween;
      case "spaceAround":
        return MainAxisAlignment.spaceAround;
      case "spaceEvenly":
        return MainAxisAlignment.spaceEvenly;
      default:
        return null;
    }
  }

  CrossAxisAlignment resolveCrossAlignment(String alignment) {
    switch (alignment) {
      case "start":
        return CrossAxisAlignment.start;
      case "end":
        return CrossAxisAlignment.end;
      case "center":
        return CrossAxisAlignment.center;
      case "stretch":
        return CrossAxisAlignment.stretch;
      case "baseline":
        return CrossAxisAlignment.baseline;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (align.type == "Center") {
      return Center(child: child);
    }

    final MainAxisSize mainAxisSize = align.mainAxisSize != null
        ? resolveMainAxisSize(align.mainAxisSize)
        : MainAxisSize.max;
    final MainAxisAlignment mainAxisAlignment = align.mainAxisAlignment != null
        ? resolveMainAlignment(align.mainAxisAlignment)
        : MainAxisAlignment.start;
    final CrossAxisAlignment crossAxisAlignment =
        align.crossAxisAlignment != null
            ? resolveCrossAlignment(align.crossAxisAlignment)
            : CrossAxisAlignment.center;
    if (align.type == "Row") {
      return Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    } else if (align.type == "Column") {
      return Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    }

    return null;
  }
}
