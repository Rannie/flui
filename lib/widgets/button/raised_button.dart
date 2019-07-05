import 'package:flutter/material.dart';
import 'button_defines.dart';

class FLRaisedIconButton extends StatelessWidget
    with MaterialButtonWithIconMixin {
  FLRaisedIconButton({
    Key key,
    this.iconPosition,
    this.spacing,
    @required this.onPressed,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.highlightElevation,
    this.disabledElevation,
    this.shape,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.animationDuration,
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
  final double elevation;
  final double highlightElevation;
  final double disabledElevation;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Duration animationDuration;
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

    return RaisedButton(
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
      elevation: elevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      shape: shape,
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      child: buttonChild,
    );
  }
}