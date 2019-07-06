import 'package:flutter/material.dart';
import 'package:flui/widgets/common/defines.dart';

class FLRaisedButton extends StatelessWidget {
  FLRaisedButton({
    Key key,
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
    this.padding,
    this.clipBehavior,
    this.materialTapTargetSize,
    this.animationDuration,
    this.expanded = false,
    @required this.child,
  });

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
  final EdgeInsetsGeometry padding;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final Duration animationDuration;
  final bool expanded;
  final Widget child;

  factory FLRaisedButton.icon({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    double elevation,
    double highlightElevation,
    double disabledElevation,
    ShapeBorder shape,
    EdgeInsetsGeometry padding,
    Clip clipBehavior,
    MaterialTapTargetSize materialTapTargetSize,
    Duration animationDuration,
    FLPosition iconPosition,
    double spacing,
    @required Widget icon,
    @required Widget label,
  }) = _FLRaisedButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = expanded ? Flex (
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: child,
        )
      ],
    ) : child;

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
      padding: padding,
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      animationDuration: animationDuration,
      child: buttonChild,
    );
  }
}

class _FLRaisedButtonWithIcon extends FLRaisedButton
    with MaterialButtonWithIconMixin {
  _FLRaisedButtonWithIcon({
    Key key,
    @required this.onPressed,
    this.iconPosition = FLPosition.left,
    this.spacing = 8,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledColor,
    this.color,
    this.disabledTextColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.highlightElevation,
    this.disabledElevation,
    this.shape,
    this.padding,
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
  final EdgeInsetsGeometry padding;
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
      padding: padding,
      clipBehavior: clipBehavior,
      materialTapTargetSize: materialTapTargetSize,
      animationDuration: animationDuration,
      child: buttonChild,
    );
  }
}