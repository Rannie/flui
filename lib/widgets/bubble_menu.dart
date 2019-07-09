import 'package:flutter/cupertino.dart';

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