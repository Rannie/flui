import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'bubble.dart';

const Duration _kMenuDuration = Duration(milliseconds: 300);
const Color _kMenuBackgroundColor = Color(0xFF2E2E2E);
const EdgeInsets _kMenuButtonPadding = EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
const double _kMenuScreenPadding = 8.0;
const double _kMenuMaxWidth = 5.0 * _kMenuWidthStep;
const double _kMenuMinWidth = 2.0 * _kMenuWidthStep;
const double _kMenuWidthStep = 56.0;
const double _kMenuCloseIntervalEnd = 2.0 / 3.0;
const double _kMenuHeight = 36.0;

const TextStyle _kToolbarButtonFontStyle = TextStyle(
  inherit: false,
  fontSize: 14.0,
  letterSpacing: -0.11,
  fontWeight: FontWeight.w300,
  color: CupertinoColors.white,
);

typedef FLBubbleMenuItemBuilder = List<FLBubbleMenuItem> Function(BuildContext context);

Future showBubbleMenu({
  @required BuildContext context,
  @required RelativeRect position,
  @required List items,
  String semanticLabel,
}) {
  assert(context != null);
  assert(position != null);
  assert(items != null && items.isNotEmpty);
  assert(debugCheckHasMaterialLocalizations(context));
  String label = semanticLabel;
  switch(defaultTargetPlatform) {
    case TargetPlatform.iOS:
      label = semanticLabel;
      break;
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      label = semanticLabel ?? MaterialLocalizations.of(context).popupMenuLabel;
  }

  return Navigator.push(context, _FLBubblePopupRoute(
    position: position,
    items: items,
    semanticLabel: label,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel
  ));
}

class FLBubbleMenuItem {
  FLBubbleMenuItem({
    @required this.text,
    @required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;
}

class _FLBubbleMenu extends StatelessWidget {
  _FLBubbleMenu({
    Key key,
    this.route,
    this.semanticLabel,
    this.from = FLBubbleFrom.bottom,
    @required this.items
  }) : super(key: key);

  final _FLBubblePopupRoute route;
  final String semanticLabel;
  final FLBubbleFrom from;
  final List<FLBubbleMenuItem> items;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < route.items.length; i += 1) {
      final CurvedAnimation opacity = CurvedAnimation(
        parent: route.animation,
        curve: Interval(0.0, 1.0 / 3.0)
      );
      FLBubbleMenuItem item = route.items[i];
      Widget itemWidget = _buildMenuButton(context, item);
      children.add(_transitionWrapper(itemWidget, opacity));
      if (i != route.items.length - 1) {
        children.add(_transitionWrapper(_divider(), opacity));
      }
    }

    final CurveTween opacity = CurveTween(curve: const Interval(0.0, 1.0 / 3.0));
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
          child: FLBubbleWidget(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            )
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: route.animation,
      builder: (BuildContext context, Widget child) {
        return Opacity(
          opacity: opacity.evaluate(route.animation),
          child: Material(
            type: MaterialType.card,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  CupertinoButton _buildMenuButton(BuildContext context,
      FLBubbleMenuItem menuItem) {
    return CupertinoButton(
      child: Text(menuItem.text, style: _kToolbarButtonFontStyle),
      color: _kMenuBackgroundColor,
      minSize: _kMenuHeight,
      padding: _kMenuButtonPadding,
      borderRadius: null,
      pressedOpacity: 0.7,
      onPressed: () {
        menuItem.onPressed?.call();
        Navigator.pop(context);
      },
    );
  }

  Divider _divider() {
    return Divider(height: _kMenuHeight, color: Colors.white);
  }

  Widget _transitionWrapper(Widget child, CurvedAnimation opacity) {
    return FadeTransition(
      opacity: opacity,
      child: child
    );
  }
}

// Positioning of the menu
class _FLBubbleMenuRouteLayoutDelegate extends SingleChildLayoutDelegate {
  _FLBubbleMenuRouteLayoutDelegate({
    this.position,
    this.from
  });

  final RelativeRect position;
  final FLBubbleFrom from; // only support top/bottom

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest
        - const Offset(_kMenuScreenPadding * 2.0, _kMenuScreenPadding * 2.0));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // vertical position
    double y = position.top;
    // horizontal position
    double x;
    if (position.left > position.right) {
      x = size.width - position.right - childSize.width;
    } else {
      x = position.left;
    }
    // check horizontal edge
    if (x < _kMenuScreenPadding)
      x = _kMenuScreenPadding;
    else if (x + childSize.width > size.width - _kMenuScreenPadding)
      x = size.width - childSize.width - _kMenuScreenPadding;
    // vertical
    if (y < _kMenuScreenPadding)
      y = _kMenuScreenPadding;
    else if (y + childSize.height > size.height - _kMenuScreenPadding)
      y = size.height - childSize.height - _kMenuScreenPadding;

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_FLBubbleMenuRouteLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _FLBubblePopupRoute extends PopupRoute {
  _FLBubblePopupRoute({
    this.position,
    this.items,
    this.barrierLabel,
    this.semanticLabel,
  });

  final RelativeRect position;
  final List<FLBubbleMenuItem> items;
  final String semanticLabel;

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation (
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, _kMenuCloseIntervalEnd)
    );
  }

  @override
  Duration get transitionDuration => _kMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => null;

  @override
  final String barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // triangle direction
    FLBubbleFrom from = _determineBubbleFrom(position);
    // retrieve menu
    Widget menu = _FLBubbleMenu(
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
                position: position,
                from: from
              ),
              child: menu,
            );
          },
        )
    );
  }

  FLBubbleFrom _determineBubbleFrom(RelativeRect position) {
    return (position.top > 60) ? FLBubbleFrom.bottom : FLBubbleFrom.top;
  }
}