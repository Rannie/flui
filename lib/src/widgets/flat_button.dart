import 'package:flutter/material.dart';
import '../common/defines.dart';

class FLFlatButton extends StatelessWidget {
  const FLFlatButton(
      {Key? key,
        required this.onPressed,
        this.onHighlightChanged,
        this.textTheme,
        this.textColor,
        this.disabledColor,
        this.focusColor,
        this.hoverColor,
        this.color,
        this.disabledTextColor,
        this.highlightColor,
        this.splashColor,
        this.colorBrightness,
        this.padding,
        this.shape,
        this.clipBehavior,
        this.materialTapTargetSize,
        this.focusNode,
        this.expanded = false,
        @required this.child})
      : super(key: key);

  final VoidCallback onPressed;
  final ValueChanged<bool>? onHighlightChanged;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool? expanded;
  final Widget? child;

  const factory FLFlatButton.icon({
    Key key,
    required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    MaterialTapTargetSize materialTapTargetSize,
    FLPosition iconPosition,
    double spacing,
    required Widget icon,
    required Widget label,
  }) = _FLFlatButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    final Widget? buttonChild = (expanded??false)
        ? Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: child ?? const SizedBox(),
        )
      ],
    )
        : child;

    return MaterialButton(
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        hoverColor: hoverColor,
        focusColor: focusColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        shape: shape,
        clipBehavior: clipBehavior ?? Clip.none,
        focusNode: focusNode,
        materialTapTargetSize: materialTapTargetSize,
        child: buttonChild);
  }
}

class _FLFlatButtonWithIcon extends FLFlatButton {
  const _FLFlatButtonWithIcon({
    Key? key,
    required VoidCallback onPressed,
    ValueChanged<bool>? onHighlightChanged,
    ButtonTextTheme? textTheme,
    Color? textColor,
    Color? disabledTextColor,
    Color? color,
    Color? disabledColor,
    Color? hoverColor,
    Color? focusColor,
    Color? highlightColor,
    Color? splashColor,
    Brightness? colorBrightness,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    Clip? clipBehavior,
    FocusNode? focusNode,
    MaterialTapTargetSize? materialTapTargetSize,
    this.iconPosition,
    this.spacing,
    required this.icon,
    required this.label,
  }) : super(
      key: key,
      onPressed: onPressed,
      onHighlightChanged: onHighlightChanged,
      textTheme: textTheme,
      textColor: textColor,
      disabledTextColor: disabledTextColor,
      color: color,
      disabledColor: disabledColor,
      hoverColor: hoverColor,
      focusColor: focusColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      padding: padding,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      materialTapTargetSize: materialTapTargetSize,
      child: null);

  final FLPosition? iconPosition;
  final double? spacing;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal =
    (iconPosition == FLPosition.left || iconPosition == FLPosition.right);
    final SizedBox spaceBox =
    isHorizontal ? SizedBox(width: spacing) : SizedBox(height: spacing);
    final List<Widget> children =
    (iconPosition == FLPosition.left || iconPosition == FLPosition.top)
        ? [icon, spaceBox, label]
        : [label, spaceBox, icon];

    final Widget buttonChild = isHorizontal
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    )
        : Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );

    return MaterialButton(
        onPressed: onPressed,
        onHighlightChanged: onHighlightChanged,
        textTheme: textTheme,
        textColor: textColor,
        disabledTextColor: disabledTextColor,
        color: color,
        disabledColor: disabledColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: splashColor,
        colorBrightness: colorBrightness,
        padding: padding,
        shape: shape,
        clipBehavior: clipBehavior ?? Clip.none,
        focusNode: focusNode,
        materialTapTargetSize: materialTapTargetSize,
        child: buttonChild);
  }
}