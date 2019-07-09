import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Duration _kMenuDuration = Duration(milliseconds: 300);
const double _kMenuCloseIntervalEnd = 2.0 / 3.0;

const double _kToolbarScreenPadding = 8.0;
const double _kToolbarHeight = 36.0;

const Color _kToolbarBackgroundColor = Color(0xFF2E2E2E);
const Color _kToolbarDividerColor = Color(0xFFB9B9B9);

const Size _kSelectionOffset = Size(20.0, 30.0);
const Size _kToolbarTriangleSize = Size(18.0, 9.0);
const EdgeInsets _kToolbarButtonPadding = EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0);
const BorderRadius _kToolbarBorderRadius = BorderRadius.all(Radius.circular(7.5));

const TextStyle _kToolbarButtonFontStyle = TextStyle(
  inherit: false,
  fontSize: 14.0,
  letterSpacing: -0.11,
  fontWeight: FontWeight.w300,
  color: CupertinoColors.white,
);

class FLBubbleMenu extends StatelessWidget {
  FLBubbleMenu({
    @required this.itemList
  });

  final List<FLBubbleMenuItem> itemList;

  @override
  Widget build(BuildContext context) {
    return null;
  }

  CupertinoButton _buildMenuButton(FLBubbleMenuItem menuItem) {
    return CupertinoButton(
      child: Text(menuItem.text, style: _kToolbarButtonFontStyle),
      color: _kToolbarBackgroundColor,
      minSize: _kToolbarHeight,
      padding: _kToolbarButtonPadding,
      borderRadius: null,
      pressedOpacity: 0.7,
      onPressed: menuItem.onPressed,
    );
  }
}

class FLBubbleMenuItem {
  FLBubbleMenuItem({
    @required this.text,
    @required this.onPressed
  });

  final String text;
  final VoidCallback onPressed;
}

class _FLBubblePopupRoute<T> extends PopupRoute<T> {
  _FLBubblePopupRoute({
    this.position,
    this.items,
    this.barrierLabel,
    this.semanticLabel,
  });

  final RelativeRect position;
  final List items;
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
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return null;
  }
}