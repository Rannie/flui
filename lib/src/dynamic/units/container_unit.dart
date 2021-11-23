import 'package:flutter/material.dart';

import '../../../flui_nullsafety.dart';
import 'base_unit.dart';

/// Container unit widget
class FLDyContainerUnit extends FLDyRenderUnit {
  FLDyContainerUnit({required FLDyContainerUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyContainerUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyContainerUnitModel cum = unitModel as FLDyContainerUnitModel;
    final Widget? child = resolveChild();
    final Widget self = Container(
      width: cum.width,
      height: cum.height,
      padding: cum.padding?.toEdgeInsets(),
      margin: cum.margin?.toEdgeInsets(),
      color: FLThemeTool.parseColor(cum.color, context),
      decoration: cum.decoration?.toBoxDecoration(context),
      foregroundDecoration: cum.foregroundDecoration?.toBoxDecoration(context),
      constraints: cum.constraints?.toBoxConstraints(),
      child: child,
    );
    return resolveSelf(self);
  }
}

/// SafeArea unit widget
class FLDySafeAreaUnit extends FLDyRenderUnit {
  FLDySafeAreaUnit({required FLDySafeAreaUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDySafeAreaUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDySafeAreaUnitModel saum = unitModel as FLDySafeAreaUnitModel;
    final Widget child = resolveChild()!;
    return SafeArea(
      left: saum.left ?? true,
      top: saum.top ?? true,
      right: saum.right ?? true,
      bottom: saum.bottom ?? true,
      minimum: saum.minimum?.toEdgeInsets() ?? EdgeInsets.zero,
      maintainBottomViewPadding: saum.maintainBottomViewPadding ?? false,
      child: child,
    );
  }
}

/// Stack unit widget
class FLDyStackUnit extends FLDyRenderUnit {
  FLDyStackUnit({required FLDyStackUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyStackUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyStackUnitModel sum = unitModel as FLDyStackUnitModel;
    final List<Widget?> children = markupUnits(sum.children!);
    final Widget self = Stack(
      alignment: sum.getAlignment() ?? AlignmentDirectional.topStart,
      textDirection: sum.getTextDirection(),
      fit: sum.getStackFit() ?? StackFit.loose,
      clipBehavior: sum.getOverflow() ?? Clip.antiAlias,
      children: children as List<Widget>,
    );
    return resolveSelf(self);
  }
}

/// ListView unit widget
class FLDyListViewUnit extends FLDyRenderUnit {
  FLDyListViewUnit({required FLDyListViewUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyListViewUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyListViewUnitModel lvum = unitModel as FLDyListViewUnitModel;
    final List<Widget?> children = markupUnits(lvum.children!);
    ListView listView;
    if (lvum.separatedDivider != null) {
      listView = ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return children[index]!;
        },
        separatorBuilder: (BuildContext context, int index) {
          return lvum.separatedDivider!.toDivider(context);
        },
        itemCount: children.length,
        scrollDirection: lvum.getScrollDirection()!,
        reverse: lvum.reverse ?? false,
        primary: lvum.primary,
        physics: lvum.scrollPhysics?.toScrollPhysics(),
        shrinkWrap: lvum.shrinkWrap ?? false,
        padding: lvum.padding?.toEdgeInsets(),
        addAutomaticKeepAlives: lvum.addAutomaticKeepAlives ?? true,
        addRepaintBoundaries: lvum.addRepaintBoundaries ?? true,
        addSemanticIndexes: lvum.addSemanticIndexes ?? true,
        cacheExtent: lvum.cacheExtent,
      );
    } else {
      listView = ListView(
        scrollDirection: lvum.getScrollDirection()!,
        reverse: lvum.reverse ?? false,
        primary: lvum.primary,
        physics: lvum.scrollPhysics?.toScrollPhysics(),
        shrinkWrap: lvum.shrinkWrap ?? false,
        padding: lvum.padding?.toEdgeInsets(),
        itemExtent: lvum.itemExtent,
        addAutomaticKeepAlives: lvum.addAutomaticKeepAlives ?? true,
        addRepaintBoundaries: lvum.addRepaintBoundaries ?? true,
        addSemanticIndexes: lvum.addSemanticIndexes ?? true,
        cacheExtent: lvum.cacheExtent,
        semanticChildCount: lvum.semanticChildCount,
        children: children as List<Widget>,
      );
    }
    return resolveSelf(listView);
  }
}

/// ListTile unit widget
class FLDyListTileUnit extends FLDyRenderUnit {
  FLDyListTileUnit({required FLDyListTileUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyListTileUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyListTileUnitModel ltum = unitModel as FLDyListTileUnitModel;
    final widget = ListTile(
      leading: ltum.leading != null ? markupUnit(ltum.leading!) : null,
      title: ltum.title != null ? markupUnit(ltum.title!) : null,
      subtitle: ltum.subtitle != null ? markupUnit(ltum.subtitle!) : null,
      trailing: ltum.trailing != null ? markupUnit(ltum.trailing!) : null,
      isThreeLine: ltum.isThreeLine ?? false,
      dense: ltum.dense,
      contentPadding: ltum.contentPadding?.toEdgeInsets(),
      enabled: ltum.enabled ?? true,
      selected: ltum.selected ?? false,
    );
    return resolveSelf(widget);
  }
}

/// InkWell unit widget
class FLDyInkWellUnit extends FLDyRenderUnit {
  FLDyInkWellUnit({required FLDyInkWellUnitModel unitModel})
      : assert(unitModel.runtimeType == FLDyInkWellUnitModel),
        super(unitModel: unitModel);

  @override
  Widget build(BuildContext context) {
    final FLDyInkWellUnitModel iwum = unitModel as FLDyInkWellUnitModel;
    final child = resolveChild();
    final InkWell inkWell = InkWell(
        child: child,
        onTap: () {
          FLDyActionDispatch.dispatcher
              .dispatchAction(iwum.uniqueId, iwum.onTap, context);
        },
        onDoubleTap: () {
          FLDyActionDispatch.dispatcher
              .dispatchAction(iwum.uniqueId, iwum.onDoubleTap, context);
        },
        onLongPress: () {
          FLDyActionDispatch.dispatcher
              .dispatchAction(iwum.uniqueId, iwum.onLongPress, context);
        },
        focusColor: FLThemeTool.parseColor(iwum.focusColor, context),
        hoverColor: FLThemeTool.parseColor(iwum.hoverColor, context),
        highlightColor: FLThemeTool.parseColor(iwum.highlightColor, context),
        splashColor: FLThemeTool.parseColor(iwum.splashColor, context));
    return resolveSelf(inkWell);
  }
}
