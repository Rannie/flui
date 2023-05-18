import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract class FLGradientButton extends StatelessWidget {
  const FLGradientButton(
      {Key? key,
      this.child,
      required this.onPressed,
      this.textTheme,
      this.textColor,
      this.disabledTextColor,
      this.splashColor,
      this.colorBrightness,
      this.elevation,
      this.highlightElevation,
      this.disabledElevation,
      this.padding,
      this.shape,
      this.clipBehavior = Clip.none,
      this.materialTapTargetSize,
      this.focusNode,
      this.animationDuration,
      required this.colors,
      this.stops})
      : super(key: key);

  final Widget? child;
  final VoidCallback onPressed;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Duration? animationDuration;
  final List<Color>? colors;
  final List<double>? stops;

  const factory FLGradientButton.linear(
      {Key key,
      required VoidCallback onPressed,
      ButtonTextTheme textTheme,
      Color textColor,
      Color disabledTextColor,
      Color splashColor,
      Brightness colorBrightness,
      double elevation,
      double highlightElevation,
      double disabledElevation,
      EdgeInsetsGeometry padding,
      ShapeBorder shape,
      Clip clipBehavior,
      FocusNode focusNode,
      MaterialTapTargetSize materialTapTargetSize,
      Duration animationDuration,
      Widget child,
      List<Color> colors,
      List<double> stops,
      AlignmentGeometry begin,
      AlignmentGeometry end,
      TileMode tileMode}) = _FLLinearGradientButton;

  /// shape of []
  const factory FLGradientButton.sweep(
      {Key key,
      required VoidCallback onPressed,
      ButtonTextTheme textTheme,
      Color textColor,
      Color disabledTextColor,
      Color splashColor,
      Brightness colorBrightness,
      double elevation,
      double highlightElevation,
      double disabledElevation,
      EdgeInsetsGeometry padding,
      ShapeBorder shape,
      Clip clipBehavior,
      FocusNode focusNode,
      MaterialTapTargetSize materialTapTargetSize,
      Duration animationDuration,
      Widget child,
      List<Color> colors,
      List<double> stops,
      AlignmentGeometry center,
      double startAngle,
      double endAngle,
      TileMode tileMode}) = _FLSweepGradientButton;

  const factory FLGradientButton.radial(
      {Key key,
      required VoidCallback onPressed,
      ButtonTextTheme textTheme,
      Color textColor,
      Color disabledTextColor,
      Color splashColor,
      Brightness colorBrightness,
      double elevation,
      double highlightElevation,
      double disabledElevation,
      EdgeInsetsGeometry padding,
      ShapeBorder shape,
      Clip clipBehavior,
      FocusNode focusNode,
      MaterialTapTargetSize materialTapTargetSize,
      Duration animationDuration,
      Widget child,
      List<Color> colors,
      List<double> stops,
      AlignmentGeometry center,
      double radius,
      TileMode tileMode,
      AlignmentGeometry focal,
      double focalRadius}) = _FLRadialGradientButton;
}

class _FLLinearGradientButton extends FLGradientButton {
  const _FLLinearGradientButton(
      {Key? key,
      required VoidCallback onPressed,
      ButtonTextTheme? textTheme,
      Color? textColor,
      Color? disabledTextColor,
      Color? splashColor,
      Brightness? colorBrightness,
      double? elevation,
      double? highlightElevation,
      double? disabledElevation,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      Clip? clipBehavior,
      FocusNode? focusNode,
      MaterialTapTargetSize? materialTapTargetSize,
      Duration? animationDuration,
      Widget? child,
      List<Color>? colors,
      List<double>? stops,
      this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight,
      this.tileMode = TileMode.clamp})
      : super(
            key: key,
            onPressed: onPressed,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            elevation: elevation,
            highlightElevation: highlightElevation,
            disabledElevation: disabledElevation,
            padding: padding,
            shape: shape,
            clipBehavior: clipBehavior,
            focusNode: focusNode,
            materialTapTargetSize: materialTapTargetSize,
            animationDuration: animationDuration,
            colors: colors,
            stops: stops,
            child: child);

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final TileMode tileMode;

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
        colors: colors!,
        begin: begin,
        end: end,
        stops: stops,
        tileMode: tileMode);

    return _FLRawGradientButton.buildGradientButton(gradient, this);
  }
}

class _FLSweepGradientButton extends FLGradientButton {
  const _FLSweepGradientButton(
      {Key? key,
      required VoidCallback onPressed,
      ButtonTextTheme? textTheme,
      Color? textColor,
      Color? disabledTextColor,
      Color? splashColor,
      Brightness? colorBrightness,
      double? elevation,
      double? highlightElevation,
      double? disabledElevation,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      Clip? clipBehavior,
      FocusNode? focusNode,
      MaterialTapTargetSize? materialTapTargetSize,
      Duration? animationDuration,
      Widget? child,
      List<Color>? colors,
      List<double>? stops,
      this.center = Alignment.center,
      this.startAngle = 0.0,
      this.endAngle = math.pi * 2,
      this.tileMode = TileMode.clamp})
      : super(
            key: key,
            onPressed: onPressed,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            elevation: elevation,
            highlightElevation: highlightElevation,
            disabledElevation: disabledElevation,
            padding: padding,
            shape: shape,
            clipBehavior: clipBehavior,
            focusNode: focusNode,
            materialTapTargetSize: materialTapTargetSize,
            animationDuration: animationDuration,
            colors: colors,
            stops: stops,
            child: child);

  final AlignmentGeometry center;
  final double startAngle;
  final double endAngle;
  final TileMode tileMode;

  @override
  Widget build(BuildContext context) {
    final SweepGradient gradient = SweepGradient(
        colors: colors!,
        stops: stops,
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        tileMode: tileMode);
    return _FLRawGradientButton.buildGradientButton(gradient, this);
  }
}

class _FLRadialGradientButton extends FLGradientButton {
  const _FLRadialGradientButton(
      {Key? key,
      required VoidCallback onPressed,
      ButtonTextTheme? textTheme,
      Color? textColor,
      Color? disabledTextColor,
      Color? splashColor,
      Brightness? colorBrightness,
      double? elevation,
      double? highlightElevation,
      double? disabledElevation,
      EdgeInsetsGeometry? padding,
      ShapeBorder? shape,
      Clip? clipBehavior,
      FocusNode? focusNode,
      MaterialTapTargetSize? materialTapTargetSize,
      Duration? animationDuration,
      Widget? child,
      List<Color>? colors,
      List<double>? stops,
      this.center = Alignment.center,
      this.radius = 0.5,
      this.tileMode = TileMode.clamp,
      this.focal,
      this.focalRadius = 0.0})
      : super(
            key: key,
            onPressed: onPressed,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            elevation: elevation,
            highlightElevation: highlightElevation,
            disabledElevation: disabledElevation,
            padding: padding,
            shape: shape,
            clipBehavior: clipBehavior,
            focusNode: focusNode,
            materialTapTargetSize: materialTapTargetSize,
            animationDuration: animationDuration,
            colors: colors,
            stops: stops,
            child: child);

  final AlignmentGeometry center;
  final double radius;
  final TileMode tileMode;
  final AlignmentGeometry? focal;
  final double focalRadius;

  @override
  Widget build(BuildContext context) {
    RadialGradient gradient = RadialGradient(
      colors: colors!,
      stops: stops,
      center: center,
      radius: radius,
      tileMode: tileMode,
      focal: focal,
      focalRadius: focalRadius,
    );
    return _FLRawGradientButton.buildGradientButton(gradient, this);
  }
}

class _FLRawGradientButton extends MaterialButton {
  const _FLRawGradientButton({
    Key? key,
    required VoidCallback onPressed,
    ButtonTextTheme? textTheme,
    Color? textColor,
    Color? disabledTextColor,
    Color? splashColor,
    Brightness? colorBrightness,
    double? elevation,
    double? highlightElevation,
    double? disabledElevation,
    EdgeInsetsGeometry? padding,
    ShapeBorder? shape,
    required Clip clipBehavior,
    FocusNode? focusNode,
    MaterialTapTargetSize? materialTapTargetSize,
    Duration? animationDuration,
    Widget? child,
    this.gradient,
  }) : super(
            key: key,
            onPressed: onPressed,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            elevation: elevation,
            highlightElevation: highlightElevation,
            disabledElevation: disabledElevation,
            padding: padding,
            shape: shape,
            clipBehavior: clipBehavior,
            focusNode: focusNode,
            materialTapTargetSize: materialTapTargetSize,
            animationDuration: animationDuration,
            child: child);

  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ButtonThemeData buttonTheme = ButtonTheme.of(context);
    final TextStyle textStyle =
        theme.textTheme.labelLarge!.copyWith(color: buttonTheme.getTextColor(this));
    final double currentElevation = (enabled ? elevation : disabledElevation) ??
        buttonTheme.getElevation(this);

    return Semantics(
      container: true,
      button: true,
      child: Focus(
          focusNode: focusNode,
          child: DecoratedBox(
              decoration: ShapeDecoration(
                gradient: gradient,
                shape: buttonTheme.getShape(this),
              ),
              child: ConstrainedBox(
                constraints: buttonTheme.getConstraints(this),
                child: Material(
                  elevation: currentElevation,
                  textStyle: textStyle,
                  shape: buttonTheme.getShape(this),
                  type: MaterialType.transparency,
                  animationDuration: buttonTheme.getAnimationDuration(this),
                  clipBehavior: clipBehavior,
                  child: InkWell(
                      splashColor: buttonTheme.getSplashColor(this),
                      onTap: onPressed,
                      customBorder: buttonTheme.getShape(this),
                      child: IconTheme.merge(
                          data: IconThemeData(color: textStyle.color),
                          child: Container(
                            padding: buttonTheme.getPadding(this),
                            child: Center(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: child,
                            ),
                          ))),
                ),
              ))),
    );
  }

  static Widget buildGradientButton(
      Gradient gradient, FLGradientButton button) {
    return _FLRawGradientButton(
      gradient: gradient,
      onPressed: button.onPressed,
      textTheme: button.textTheme,
      textColor: button.textColor,
      disabledTextColor: button.disabledTextColor,
      splashColor: button.splashColor,
      colorBrightness: button.colorBrightness,
      elevation: button.elevation,
      highlightElevation: button.highlightElevation,
      disabledElevation: button.disabledElevation,
      padding: button.padding,
      shape: button.shape,
      clipBehavior: button.clipBehavior ?? Clip.none,
      focusNode: button.focusNode,
      materialTapTargetSize: button.materialTapTargetSize,
      animationDuration: button.animationDuration,
      child: button.child,
    );
  }
}
