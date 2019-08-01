import 'package:flutter/material.dart';

enum FLBadgeShape {
  circle,
  square,
  spot
}

const double _kSquareRadius  = 1;
const double _kSpotRadius    = 3;
const double _kBadgeSize     = 15;
const double _kDefaultRadius = -1;

class FLBadge extends StatefulWidget {
  FLBadge({
    Key key,
    this.color = Colors.red,
    this.shape = FLBadgeShape.circle,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 10),
    this.position = Alignment.topRight,
    this.radius = _kDefaultRadius,
    this.text,
    this.child
  }) : super(key: key);

  final Color color;
  final FLBadgeShape shape;
  final TextStyle textStyle;
  final Alignment position;
  /// Each shape will have a default radius.
  /// If u set this value, the [shape] property will be meaningless.
  final double radius;
  final String text;
  final Widget child;

  @override
  State<FLBadge> createState() => FLBadgeState();
}

class FLBadgeState extends State<FLBadge> {
  BorderRadius _borderRadius(FLBadgeShape shape) {
    double radius = 0;
    if (widget.radius != _kDefaultRadius)
      radius = widget.radius;
    else if (widget.shape == FLBadgeShape.circle)
      radius = _kBadgeSize / 2;
    else if (widget.shape == FLBadgeShape.square)
      radius = _kSquareRadius;
    else if (widget.shape == FLBadgeShape.spot)
      radius = _kSpotRadius;

    return BorderRadius.circular(radius);
  }

  @override
  Widget build(BuildContext context) {
    FLBadgeShape shape = widget.text != null ? widget.shape : FLBadgeShape.spot;
    double size = widget.shape == FLBadgeShape.spot ? 2 * _kSpotRadius : _kBadgeSize;
    Widget textChild = widget.text == null ? null : Center(
      child: Text(
        widget.text,
        style:widget.textStyle,
        textAlign: TextAlign.center,
      ),
    );

    Widget badge = Positioned(
      right: - size / 2,
      top: - size / 2,
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: _borderRadius(shape)
          ),
          child: textChild
      )
    );

    return Stack(
      alignment: widget.position,
      overflow: Overflow.visible,
      children: <Widget>[
        widget.child,
        badge
      ],
    );
  }
}