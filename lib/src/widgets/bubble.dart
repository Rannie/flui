import 'package:flutter/cupertino.dart';

// normally, bubble view width is longer than its height,
// so make the triangle smaller
const Size _kBubbleTriangleSizeH = Size(9.0, 16.0);
const Size _kBubbleTriangleSizeV = Size(18.0, 9.0);
const BorderRadius _kBubbleBorderRadius =
    BorderRadius.all(Radius.circular(7.5));

/// triangle position
enum FLBubbleFrom { bottom, top, left, right }

class FLBubble extends StatelessWidget {
  FLBubble(
      {Key? key,
      this.backgroundColor = CupertinoColors.white,
      this.from = FLBubbleFrom.bottom,
      this.padding = const EdgeInsets.all(8),
      required this.child})
      : super(key: key);

  final Color backgroundColor;
  final FLBubbleFrom from;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    FLBubbleFrom _from = from;
    final TextDirection textDirection = Directionality.of(context);
    final bool isRtl = textDirection == TextDirection.rtl;
    final bool isHorizontal =
        (_from == FLBubbleFrom.left || _from == FLBubbleFrom.right);
    if (isRtl && isHorizontal) {
      _from =
          _from == FLBubbleFrom.left ? FLBubbleFrom.right : FLBubbleFrom.left;
    }
    // triangle
    final Size triangleSize =
        isHorizontal ? _kBubbleTriangleSizeH : _kBubbleTriangleSizeV;
    final Widget triangle = SizedBox.fromSize(
      size: triangleSize,
      child: CustomPaint(
        painter:
            _FLBubbleNotchPainter(pos: _from, backgroundColor: backgroundColor),
      ),
    );
    // main rect
    final Widget rect = ClipRRect(
      borderRadius: _kBubbleBorderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: _kBubbleBorderRadius,
          border: Border.all(color: backgroundColor, width: 0),
        ),
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );

    // layout use original from, Row will auto change direction.
    if (from == FLBubbleFrom.bottom) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          rect,
          triangle,
          const Padding(padding: EdgeInsets.only(bottom: 8.0))
        ],
      );
    } else if (from == FLBubbleFrom.top) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 8.0)),
          triangle,
          rect
        ],
      );
    } else if (from == FLBubbleFrom.left) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(left: 8.0)),
          triangle,
          rect
        ],
      );
    } else {
      // FLBubbleFrom.right
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          rect,
          triangle,
          const Padding(padding: EdgeInsets.only(right: 8.0))
        ],
      );
    }
  }
}

class _FLBubbleNotchPainter extends CustomPainter {
  _FLBubbleNotchPainter({this.pos, this.backgroundColor});

  final FLBubbleFrom? pos;
  final Color? backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    // paint
    final Paint paint = Paint()
      ..color = backgroundColor!
      ..style = PaintingStyle.fill;
    // triangle
    Path triangle;
    if (pos == FLBubbleFrom.bottom) {
      triangle = Path()
        ..lineTo(size.width / 2, 0.0)
        ..lineTo(0.0, size.height)
        ..lineTo(-(size.width / 2), 0.0)
        ..close();
    } else if (pos == FLBubbleFrom.left) {
      triangle = Path()
        ..lineTo(size.width, size.height / 2)
        ..lineTo(size.width, -(size.height / 2))
        ..close();
    } else if (pos == FLBubbleFrom.top) {
      triangle = Path()
        ..lineTo(size.width / 2, size.height)
        ..lineTo(-(size.width / 2), size.height)
        ..close();
    } else {
      // FLBubbleFrom.right
      triangle = Path()
        ..lineTo(0.0, size.height / 2)
        ..lineTo(size.width, 0.0)
        ..lineTo(0.0, -(size.height / 2))
        ..close();
    }
    // draw
    canvas.drawPath(triangle, paint);
  }

  @override
  bool shouldRepaint(_FLBubbleNotchPainter oldPainter) => false;
}
