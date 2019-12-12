import 'package:flutter/material.dart';

enum FLBadgeShape {
  circle,
  square,
  spot
}

enum FLBadgePosition {
  topRight,
  topLeft,
  bottomRight,
  bottomLeft
}

const double _kSquareRadius  = 1;
const double _kSpotRadius    = 6;
const double _kBadgeSize     = 18;
const double _kDefaultRadius = -1;

class FLBadge extends StatefulWidget {
  FLBadge({
    Key key,
    this.color = Colors.red,
    this.shape = FLBadgeShape.circle,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 10),
    this.position = FLBadgePosition.topRight,
    this.hidden = false,
    this.radius = _kDefaultRadius,
    this.text,
    @required this.child
  }) : assert(child != null),
       super(key: key);

  final Color color;
  final FLBadgeShape shape;
  final TextStyle textStyle;
  final FLBadgePosition position;
  final bool hidden;
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
    double size = shape == FLBadgeShape.spot ? 2 * _kSpotRadius : _kBadgeSize;
    Widget textChild = widget.text == null ? null : Center(
      child: Text(
        widget.text,
        style:widget.textStyle,
        textAlign: TextAlign.center,
      ),
    );

    var left, right, top, bottom;
    double offset = size / 3;
    Alignment alignment;
    if (widget.position == FLBadgePosition.topRight) {
      right = - offset;
      top = - offset;
      alignment = Alignment.topRight;
    } else if (widget.position == FLBadgePosition.topLeft) {
      left = - offset;
      top = - offset;
      alignment = Alignment.topLeft;
    } else if (widget.position == FLBadgePosition.bottomRight) {
      bottom = - offset;
      right = - offset;
      alignment = Alignment.bottomRight;
    } else {
      // bottom left
      left = - offset;
      bottom = - offset;
      alignment = Alignment.bottomLeft;
    }

    Widget badge = Positioned(
      left: left,
      top: top,
      bottom: bottom,
      right: right,
      width: size,
      height: size,
      child: Container(
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: _borderRadius(shape)
          ),
          child: textChild
      )
    );

    List<Widget> children = widget.hidden ? [widget.child] : [widget.child, badge];

    return Stack(
      alignment: alignment,
      overflow: Overflow.visible,
      children: children
    );
  }
}
