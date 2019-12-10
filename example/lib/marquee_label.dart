import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

const double FLMarqueeDefaultHeight = 36;
const double _kDefaultDistance = 8.0;
const int _kTimerGap = 100;

class FLMarqueeLabel extends StatefulWidget {
  FLMarqueeLabel({
    Key key,
    @required this.text,
    this.style,
    this.space,
    this.velocity = 0.4,
    this.loop = true,
    this.height = FLMarqueeDefaultHeight,
    this.padding,
    this.backgroundColor = Colors.transparent
  }) : assert(text != null),
        super(key: key);

  final String text;
  final TextStyle style;
  /// The space between text & 'the next same text'
  /// If not set, it will be the screen width.
  final double space;
  /// The scroll velocity, if it is zero, will not scroll.
  /// The value range is [0-1]
  final double velocity;
  final bool loop;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  @override
  State<FLMarqueeLabel> createState() => _FLMarqueeLabelState();
}

class _FLMarqueeLabelState extends State<FLMarqueeLabel>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _listViewKey = GlobalKey();
  Timer _timer;
  double _pos = 0.0;
  double _velocity;
  double _space;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _velocity = min(1, max(0, widget.velocity));
    _space = widget.space ?? MediaQuery.of(context).size.width;
  }

  @override
  void didUpdateWidget(FLMarqueeLabel oldWidget) {
    super.didUpdateWidget(oldWidget);
    _velocity = min(1, max(0, widget.velocity));
    _space = widget.space ?? MediaQuery.of(context).size.width;
    _restart();
  }

  @override
  void dispose() {
    _stop();
    super.dispose();
  }

  void _setup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduleScroll();
    });
  }

  void _stop() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  void _restart() {
    _stop();
    _setup();
  }

  void _scheduleScroll() {
    if (_velocity == 0)
      return;

    double widgetWidth = _listViewKey.currentContext.findRenderObject().paintBounds.size.width;
    double moveOffset = _kDefaultDistance * _velocity;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double textWidth = (maxScrollExtent + widgetWidth - _space) / 2;

    double targetDistance = 0;
    double totalDistance = 0;
    if (widget.loop == false) {
      targetDistance = textWidth + _space;
    }

    _timer = Timer.periodic(Duration(milliseconds: _kTimerGap), (_) {
      double pixels = _scrollController.position.pixels;
      if (pixels + moveOffset >= maxScrollExtent) {
        _pos = pixels - maxScrollExtent - widgetWidth + textWidth;
        _scrollController.jumpTo(_pos);
      }

      if (widget.loop == false) {
        if (totalDistance + moveOffset >= targetDistance) {
          _stop();
          moveOffset = totalDistance + moveOffset - targetDistance;
        } else {
          totalDistance += moveOffset;
        }
      }

      _pos += moveOffset;
      _scrollController.animateTo(_pos, duration: Duration(milliseconds: _kTimerGap), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry padding = widget.padding ?? EdgeInsets.zero;
    final Widget textChild = Align(
      alignment: Alignment.center,
      child: Text(widget.text, style: widget.style)
    );

    final List<Widget> children = <Widget>[];
    children.add(textChild);
    if (_velocity > 0) {
      children.add(SizedBox(width: _space));
      children.add(textChild);
    }

    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      padding: padding,
      child: ListView(
        key: _listViewKey,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: children,
      ),
    );
  }
}