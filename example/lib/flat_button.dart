import 'package:flutter/material.dart';
import 'button_defines.dart';

class FLFlatIconButton extends StatelessWidget
    with MaterialButtonWithIconMixin {
  FLFlatIconButton({
    Key key,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledColor,
    this.color,
    this.disabledTextColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.padding,
    this.shape,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.iconPosition = FLPosition.left,
    this.spacing = 8,
    @required this.icon,
    @required this.label,
  });

  final FLPosition iconPosition;
  final double spacing;
  final VoidCallback onPressed;
  final ValueChanged<bool> onHighlightChanged;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color highlightColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    bool isHorizontal = (iconPosition == FLPosition.left
        || iconPosition == FLPosition.right);
    SizedBox spaceBox = isHorizontal ? SizedBox(width: spacing)
        : SizedBox(height: spacing);
    List<Widget> children = (iconPosition == FLPosition.left
        || iconPosition == FLPosition.top)
        ? [icon, spaceBox, label]
        : [label, spaceBox, icon];

    Widget buttonChild = isHorizontal ? Row (
      mainAxisSize: MainAxisSize.min,
      children: children,
    ) : Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );

    return FlatButton(
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        shape: shape,
        clipBehavior: clipBehavior,
        materialTapTargetSize: materialTapTargetSize,
        child: buttonChild
    );
  }
}