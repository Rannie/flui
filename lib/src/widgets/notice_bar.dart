import 'package:flutter/material.dart';

import '../../flui_nullsafety.dart';

const Color FLNoticeBarTintColor = Color(0xFFF76A24);
const Color FLNoticeBarBackgroundColor = Color(0xFFFEFCEC);

typedef FLNoticeBarItemBuilder = Widget Function(BuildContext context);

class FLNoticeBar extends StatelessWidget {
  FLNoticeBar({
    Key? key,
    this.backgroundColor,
    this.textStyle,
    this.loop = true,
    this.velocity = 0.4,
    this.padding,
    this.textPadding,
    required this.text,
    this.space,
    this.height = FLMarqueeDefaultHeight,
    this.prefixBuilder,
    this.suffixBuilder,
    this.delay,
  })  : super(key: key);

  factory FLNoticeBar.notice(
      {Key? key,
      Color? backgroundColor,
      TextStyle? textStyle,
      bool? loop,
      double? velocity,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? textPadding,
      required String text,
      double? space,
      double? height,
      Duration? delay,
      FLNoticeBarItemBuilder? suffixBuilder}) {
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    Widget prefixBuilder(BuildContext context) {
      final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      final Color accent = Theme.of(context).colorScheme.secondary;
      final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
      final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);
      final double size = marqueeStyle.fontSize ?? height! / 2.0;
      return Icon(
        Icons.notifications_active,
        size: size,
        color: textColor,
      );
    };

    return FLNoticeBar(
      key: key,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      loop: loop,
      velocity: velocity,
      padding: padding,
      textPadding: textPadding,
      text: text,
      space: space,
      height: height,
      delay: delay,
      prefixBuilder: prefixBuilder,
      suffixBuilder: suffixBuilder,
    );
  }

  factory FLNoticeBar.closable(
      {Key? key,
      Color? backgroundColor,
      TextStyle? textStyle,
      bool? loop,
      double? velocity,
      EdgeInsetsGeometry? padding,
      EdgeInsetsGeometry? textPadding,
      required String text,
      double? space,
      double? height,
      FLNoticeBarItemBuilder? prefixBuilder,
      Duration? delay,
      required VoidCallback onPressed}) {
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    Widget suffixBuilder(BuildContext context) {
      final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
      final Color accent = Theme.of(context).colorScheme.secondary;
      final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
      final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);
      final double size = marqueeStyle.fontSize ?? height! / 2.0;
      return GestureDetector(
        onTap: onPressed,
        child: Icon(
          Icons.close,
          size: size,
          color: textColor,
        ),
      );
    };

    return FLNoticeBar(
      key: key,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
      loop: loop,
      velocity: velocity,
      padding: padding,
      textPadding: textPadding,
      text: text,
      space: space,
      height: height,
      delay: delay,
      prefixBuilder: prefixBuilder,
      suffixBuilder: suffixBuilder,
    );
  }

  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool loop;
  final double velocity;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? textPadding;
  final String text;
  final double? space;
  final double height;
  final Duration? delay;
  final FLNoticeBarItemBuilder? prefixBuilder;
  final FLNoticeBarItemBuilder? suffixBuilder;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color accent = Theme.of(context).colorScheme.secondary;
    final Color barBackgroundColor = backgroundColor ??
        (isDarkMode ? accent.withOpacity(0.2) : FLNoticeBarBackgroundColor);
    final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
    final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);

    final List<Widget> children = <Widget>[];

    if (prefixBuilder != null) {
      children.add(prefixBuilder!(context));
      children.add(SizedBox(width: 5));
    }

    children.add(Expanded(
      child: FLMarqueeLabel(
        text: text,
        style: marqueeStyle,
        padding: textPadding,
        space: space,
        velocity: velocity,
        loop: loop,
        delay: delay,
      ),
    ));

    if (suffixBuilder != null) {
      children.add(SizedBox(width: 5));
      children.add(suffixBuilder!(context));
    }

    return Container(
      color: barBackgroundColor,
      height: height,
      padding: padding,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}
