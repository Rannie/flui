import 'dart:async';

import 'package:example/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kDefaultHeight = 36;
const int _kTimerGap = 100;
const double _kDefaultDistance = 8.0;

class FLMarqueeLabel extends StatefulWidget {
  FLMarqueeLabel({
    Key key,
    @required this.text,
    this.style,
    this.space = 0.0,
    this.velocity = 0.4,
    this.blurEdge = false,
    this.infinity = true,
    this.height = _kDefaultHeight,
    this.backgroundColor = Colors.white
  }) : assert(text != null),
       super(key: key);

  final String text;
  final TextStyle style;
  final double space;
  final double velocity;
  final bool blurEdge;
  final bool infinity;
  final double height;
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

  @override
  void initState() {
    super.initState();
    _setup();
  }

  void _setup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scheduleScroll();
    });
  }

  void _scheduleScroll() {
    double widgetWidth = _listViewKey.currentContext.findRenderObject().paintBounds.size.width;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double moveOffset = _kDefaultDistance * widget.velocity;
    double textWidth = (maxScrollExtent + widgetWidth - widget.space) / 2;
    logger.d('extent $maxScrollExtent');
    logger.d('widget $widgetWidth');
    logger.d('text $textWidth');

    _timer = Timer.periodic(Duration(milliseconds: _kTimerGap), (_) {
      double pixels = _scrollController.position.pixels;
      if(pixels + moveOffset >= maxScrollExtent) {
        _pos = pixels - maxScrollExtent - widgetWidth + textWidth;
        _scrollController.jumpTo(_pos);
      }
      _pos += moveOffset;
      _scrollController.animateTo(_pos, duration: Duration(milliseconds: _kTimerGap), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      height: widget.height,
      child: ListView(
        key: _listViewKey,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(widget.text, style: widget.style),
          ),
          SizedBox(width: widget.space),
          Align(
            alignment: Alignment.center,
            child: Text(widget.text, style: widget.style),
          )
        ],
      ),
    );
  }
}