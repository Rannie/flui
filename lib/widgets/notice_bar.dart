import 'package:flutter/material.dart';
import 'package:flui/widgets/marquee_label.dart';

const Color FLNoticeBarTintColor = const Color(0xFFF76A24);

class FLNoticeBar extends StatelessWidget {
  FLNoticeBar({
    Key key,
    this.backgroundColor = const Color(0xFFFEFCEC),
    this.textStyle = const TextStyle(color: FLNoticeBarTintColor),
    this.loop = true,
    this.velocity,
    this.padding,
    this.textPadding,
    this.prefix,
    @required this.text,
    this.space,
    this.height = FLMarqueeDefaultHeight,
    this.suffix
  }) : assert(text != null),
       super(key: key);

  factory FLNoticeBar.notice({
    Key key,
    Color backgroundColor,
    TextStyle textStyle,
    bool loop,
    double velocity,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry textPadding,
    String text,
    double space,
    double height,
    Widget suffix
  }) {
    backgroundColor ??= const Color(0xFFFEFCEC);
    textStyle ??= const TextStyle(color: FLNoticeBarTintColor);
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    final double size = textStyle.fontSize ?? height / 2.0;
    final Widget preIcon = Icon(
      Icons.notifications_active,
      size: size,
      color: textStyle.color,
    );

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
      prefix: preIcon,
      suffix: suffix,
    );
  }

  factory FLNoticeBar.closable({
    Key key,
    Color backgroundColor,
    TextStyle textStyle,
    bool loop,
    double velocity,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry textPadding,
    String text,
    double space,
    double height,
    Widget prefix,
    VoidCallback onPressed
  }) {
    assert(onPressed != null);
    backgroundColor ??= const Color(0xFFFEFCEC);
    textStyle ??= const TextStyle(color: FLNoticeBarTintColor);
    velocity ??= 0.4;
    loop ??= true;
    height ??= FLMarqueeDefaultHeight;
    padding ??= EdgeInsets.symmetric(horizontal: 10);

    final double size = textStyle.fontSize ?? height / 2.0;
    final Widget sufWidget = GestureDetector(
      onTap: onPressed,
      child: Icon(
        Icons.close,
        size: size,
        color: textStyle.color,
      ),
    );

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
      prefix: prefix,
      suffix: sufWidget,
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
  final Widget prefix;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    if (prefix != null) {
      children.add(prefix);
      children.add(SizedBox(width: 5));
    }

    children.add(Expanded(
      child: FLMarqueeLabel(
        text: text,
        style: textStyle,
        padding: textPadding,
        space: space,
        velocity: velocity,
        loop: loop,
      ),
    ));

    if (suffix != null) {
      children.add(SizedBox(width: 5));
      children.add(suffix);
    }

    return Container(
      color: backgroundColor,
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