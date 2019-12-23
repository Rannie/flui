import 'package:flutter/material.dart';
import 'package:flui/widgets/marquee_label.dart';

const Color FLNoticeBarTintColor = const Color(0xFFF76A24);
const Color FLNoticeBarBackgroundColor = const Color(0xFFFEFCEC);

typedef FLNoticeBarItemBuilder = Widget Function(BuildContext context);

class FLNoticeBar extends StatelessWidget {
  FLNoticeBar({
    Key key,
    this.backgroundColor,
    this.textStyle,
    this.loop = true,
    this.velocity = 0.4,
    this.padding,
    this.textPadding,
    @required this.text,
    this.space,
    this.height = FLMarqueeDefaultHeight,
    this.prefixBuilder,
    this.suffixBuilder,
  })  : assert(text != null),
        super(key: key);

  factory FLNoticeBar.notice(
      {Key key,
      Color backgroundColor,
      TextStyle textStyle,
      bool loop,
      double velocity,
      EdgeInsetsGeometry padding,
      EdgeInsetsGeometry textPadding,
      String text,
      double space,
      double height,
      FLNoticeBarItemBuilder suffixBuilder}) {
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    FLNoticeBarItemBuilder prefixBuilder = (BuildContext context) {
      final bool isDarkMode =
          MediaQuery.of(context).platformBrightness == Brightness.dark;
      final Color accent = Theme.of(context).accentColor;
      final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
      final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);
      final double size = marqueeStyle.fontSize ?? height / 2.0;
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
      prefixBuilder: prefixBuilder,
      suffixBuilder: suffixBuilder,
    );
  }

  factory FLNoticeBar.closable(
      {Key key,
      Color backgroundColor,
      TextStyle textStyle,
      bool loop,
      double velocity,
      EdgeInsetsGeometry padding,
      EdgeInsetsGeometry textPadding,
      String text,
      double space,
      double height,
      FLNoticeBarItemBuilder prefixBuilder,
      VoidCallback onPressed}) {
    assert(onPressed != null);
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    FLNoticeBarItemBuilder suffixBuilder = (BuildContext context) {
      final bool isDarkMode =
          MediaQuery.of(context).platformBrightness == Brightness.dark;
      final Color accent = Theme.of(context).accentColor;
      final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
      final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);
      final double size = marqueeStyle.fontSize ?? height / 2.0;
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
      prefixBuilder: prefixBuilder,
      suffixBuilder: suffixBuilder,
    );
  }

  final Color backgroundColor;
  final TextStyle textStyle;
  final bool loop;
  final double velocity;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry textPadding;
  final String text;
  final double space;
  final double height;
  final FLNoticeBarItemBuilder prefixBuilder;
  final FLNoticeBarItemBuilder suffixBuilder;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final Color accent = Theme.of(context).accentColor;
    final Color barBackgroundColor = backgroundColor ?? isDarkMode
        ? accent.withOpacity(0.2)
        : FLNoticeBarBackgroundColor;
    final Color textColor = isDarkMode ? accent : FLNoticeBarTintColor;
    final TextStyle marqueeStyle = textStyle ?? TextStyle(color: textColor);

    final List<Widget> children = <Widget>[];

    if (prefixBuilder != null) {
      children.add(prefixBuilder(context));
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
      ),
    ));

    if (suffixBuilder != null) {
      children.add(SizedBox(width: 5));
      children.add(suffixBuilder(context));
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
