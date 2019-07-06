import 'package:flutter/material.dart';
import 'package:flui/widgets/common/defines.dart';

class FLFlatButton extends StatelessWidget {
  const FLFlatButton({
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
    this.expanded = false,
    @required this.child
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
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final MaterialTapTargetSize materialTapTargetSize;
  final bool expanded;
  final Widget child;

  factory FLFlatButton.icon({
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
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    MaterialTapTargetSize materialTapTargetSize,
    FLPosition iconPosition,
    double spacing,
    @required Widget icon,
    @required Widget label,
  }) = _FLFlatButtonWithIcon;

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

class _FLFlatButtonWithIcon extends FLFlatButton
    with MaterialButtonWithIconMixin {
  _FLFlatButtonWithIcon({
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
    this.padding,
    this.shape,
    this.clipBehavior,
    this.materialTapTargetSize,
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