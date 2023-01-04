import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bubble.dart';

const Duration _kMenuDuration = Duration(milliseconds: 300);
const Color _kMenuBackgroundColor = Color(0xFF2E2E2E);
const Color _kMenuBackgroundLightColor = Color(0xD1F8F8F8);
const EdgeInsets _kMenuButtonPadding =
    EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0);
const double _kMenuScreenPadding = 8.0;
const double _kMenuMaxWidth = 5.0 * _kMenuWidthStep;
const double _kMenuMinWidth = 2.0 * _kMenuWidthStep;
const double _kMenuWidthStep = 56.0;
const double _kMenuCloseIntervalEnd = 2.0 / 3.0;
const double _kMenuHeight = 36.0;
const double _kMenuButtonMinHeight = 22;

const TextStyle _kToolbarButtonFontStyle = TextStyle(
  inherit: false,
  fontSize: 14.0,
  letterSpacing: -0.11,
  fontWeight: FontWeight.w300,
  color: CupertinoColors.white,
);

typedef FLBubbleMenuItemBuilder<T> = List<FLBubbleMenuItem<T>> Function(
    BuildContext context);
typedef FLBubbleMenuCancelled = void Function();
typedef FLBubbleMenuItemSelected<T> = void Function(T value);

enum FLBubbleMenuInteraction { tap, longPress }

class FLBubbleMenuWidget<T> extends StatefulWidget {
  const FLBubbleMenuWidget(
      {Key? key,
      required this.itemBuilder,
      this.onSelected,
      this.onCancelled,
      this.interaction = FLBubbleMenuInteraction.longPress,
      required this.child,
      this.offset = Offset.zero})
      : super(key: key);

  final FLBubbleMenuInteraction interaction;
  final FLBubbleMenuItemBuilder itemBuilder;
  final FLBubbleMenuItemSelected<T>? onSelected;
  final FLBubbleMenuCancelled? onCancelled;
  final Widget child;
  final Offset offset;

  @override
  FLBubbleMenuWidgetState<T> createState() => FLBubbleMenuWidgetState();
}

class FLBubbleMenuWidgetState<T> extends State<FLBubbleMenuWidget<T>> {
  void showButtonMenu() {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
        Rect.fromPoints(
          button.localToGlobal(widget.offset, ancestor: overlay),
          button.localToGlobal(button.size.bottomRight(Offset.zero),
              ancestor: overlay),
        ),
        Offset.zero & overlay.size);

    showBubbleMenu<T>(
            context: context,
            position: position,
            items: widget.itemBuilder(context) as List<FLBubbleMenuItem<T>>)
        .then<void>((T? value) {
      if (!mounted) return null;
      if (value == null) {
        if (widget.onCancelled != null) widget.onCancelled!();
        return null;
      }
      if (widget.onSelected != null) widget.onSelected!(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (widget.interaction == FLBubbleMenuInteraction.tap)
            ? showButtonMenu
            : null,
        onLongPress: (widget.interaction == FLBubbleMenuInteraction.longPress)
            ? showButtonMenu
            : null,
        child: widget.child);
  }
}

Future<T?> showBubbleMenu<T>({
  required BuildContext context,
  required RelativeRect position,
  required List<FLBubbleMenuItem<T>> items,
  String? semanticLabel,
}) {
  assert(debugCheckHasMaterialLocalizations(context));
  String? label = semanticLabel;
  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
      label = semanticLabel;
      break;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      label = semanticLabel ?? MaterialLocalizations.of(context).popupMenuLabel;
  }

  return Navigator.push(
      context,
      _FLBubblePopupRoute<T>(
          position: position,
          items: items,
          semanticLabel: label,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel));
}

class FLBubbleMenuItem<T> {
  FLBubbleMenuItem({required this.text, required this.value});

  final String text;
  final T value;
}

class _FLBubbleMenu<T> extends StatelessWidget {
  const _FLBubbleMenu(
      {Key? key,
      this.route,
      this.semanticLabel,
      this.from = FLBubbleFrom.bottom,
      required this.items})
      : super(key: key);

  final _FLBubblePopupRoute? route;
  final String? semanticLabel;
  final FLBubbleFrom from;
  final List<FLBubbleMenuItem>? items;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < route!.items!.length; i += 1) {
      final CurvedAnimation opacity = CurvedAnimation(
          parent: route!.animation!, curve: const Interval(0.0, 1.0 / 3.0));
      FLBubbleMenuItem item = route!.items![i];
      Widget itemWidget = _buildMenuButton(context, item, isDarkMode);
      children.add(_transitionWrapper(itemWidget, opacity));
      if (i != route!.items!.length - 1) {
        children.add(_transitionWrapper(_divider(isDarkMode), opacity));
      }
    }

    final CurveTween opacity =
        CurveTween(curve: const Interval(0.0, 1.0 / 3.0));
    final Color backgroundColor =
        isDarkMode ? _kMenuBackgroundLightColor : _kMenuBackgroundColor;
    final Widget child = ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: _kMenuMinWidth,
        maxWidth: _kMenuMaxWidth,
      ),
      child: IntrinsicWidth(
        stepWidth: _kMenuWidthStep,
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          label: semanticLabel,
          child: FLBubble(
              from: from,
              padding: EdgeInsets.zero,
              backgroundColor: backgroundColor,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: children,
              )),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: route!.animation!,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: opacity.evaluate(route!.animation!),
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  CupertinoButton _buildMenuButton(
      BuildContext context, FLBubbleMenuItem menuItem, bool isDarkMode) {
    TextStyle textStyle = isDarkMode
        ? _kToolbarButtonFontStyle.copyWith(color: Colors.black)
        : _kToolbarButtonFontStyle;
    return CupertinoButton(
      minSize: _kMenuButtonMinHeight,
      padding: _kMenuButtonPadding,
      borderRadius: null,
      pressedOpacity: 0.7,
      onPressed: () {
        Navigator.pop(context, menuItem.value);
      },
      child: Text(menuItem.text, style: textStyle),
    );
  }

  Widget _divider(bool isDarkMode) {
    Color dividerColor = isDarkMode ? Colors.blueGrey : Colors.white;
    return Container(width: 1 / 2.0, height: _kMenuHeight, color: dividerColor);
  }

  Widget _transitionWrapper(Widget child, CurvedAnimation opacity) {
    return FadeTransition(opacity: opacity, child: child);
  }
}

// Positioning of the menu
class _FLBubbleMenuRouteLayoutDelegate extends SingleChildLayoutDelegate {
  _FLBubbleMenuRouteLayoutDelegate({this.position, this.from});

  final RelativeRect? position;
  final FLBubbleFrom? from; // only support top/bottom

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest -
        const Offset(_kMenuScreenPadding * 2.0, _kMenuScreenPadding * 2.0) as Size);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // vertical position
    double y = (from == FLBubbleFrom.bottom)
        ? position!.top - childSize.height
        : size.height - position!.bottom;
    // horizontal position
    double pW = size.width - position!.right - position!.left;
    double x = position!.left + (pW - childSize.width) / 2;
    // check horizontal edge
    if (x < _kMenuScreenPadding) {
      x = _kMenuScreenPadding;
    } else if (x + childSize.width > size.width - _kMenuScreenPadding) {
      x = size.width - childSize.width - _kMenuScreenPadding;
    }
    // vertical
    if (y < _kMenuScreenPadding) {
      y = _kMenuScreenPadding;
    } else if (y + childSize.height > size.height - _kMenuScreenPadding) {
      y = size.height - childSize.height - _kMenuScreenPadding;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_FLBubbleMenuRouteLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _FLBubblePopupRoute<T> extends PopupRoute<T> {
  _FLBubblePopupRoute({
    this.position,
    this.items,
    this.barrierLabel,
    this.semanticLabel,
  });

  final RelativeRect? position;
  final List<FLBubbleMenuItem<T>>? items;
  final String? semanticLabel;

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
        parent: super.createAnimation(),
        curve: Curves.linear,
        reverseCurve: const Interval(0.0, _kMenuCloseIntervalEnd));
  }

  @override
  Duration get transitionDuration => _kMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String? barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // triangle direction
    FLBubbleFrom from = _determineBubbleFrom(position!);
    // retrieve menu
    Widget menu = _FLBubbleMenu<T>(
      route: this,
      semanticLabel: semanticLabel,
      from: from,
      items: items,
    );

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeLeft: true,
        removeBottom: true,
        removeRight: true,
        child: Builder(
          builder: (BuildContext context) {
            return CustomSingleChildLayout(
              delegate: _FLBubbleMenuRouteLayoutDelegate(
                  position: position, from: from),
              child: menu,
            );
          },
        ));
  }

  FLBubbleFrom _determineBubbleFrom(RelativeRect position) {
    return (position.top >
            (35 // estimated value
                +
                kToolbarHeight +
                _kMenuHeight +
                _kMenuScreenPadding))
        ? FLBubbleFrom.bottom
        : FLBubbleFrom.top;
  }
}
