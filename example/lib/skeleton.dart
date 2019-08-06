import 'package:flutter/material.dart';

const int _kDefaultMilliSeconds = 1400;

class FLSkeleton extends StatefulWidget {
  FLSkeleton({
    Key key,
    this.shape,
    this.padding,
    this.color,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.borderRadius,
    this.duration,
  }) : super (key: key);

  final BoxShape shape;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double width;
  final double height;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry margin;
  final BorderRadiusGeometry borderRadius;
  final Duration duration;

  @override
  State<FLSkeleton> createState() => _FLSkeletonState();
}

class _FLSkeletonState extends State<FLSkeleton> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final Duration duration = widget.duration
        ?? const Duration(milliseconds: _kDefaultMilliSeconds);
    _controller = AnimationController(
      vsync: this,
      duration: duration
    );

    _animation = Tween<double>(begin: -1.0, end: 2.0)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BoxShape shape = widget.shape ??  BoxShape.rectangle;
    final Color color = widget.color ?? const Color(0xFFE8E8E8);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
              shape: shape,
              borderRadius: widget.borderRadius,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    color,
                    color.withAlpha(80),
                    color
                  ],
                  stops: [
                    _animation.value - 0.4,
                    _animation.value,
                    _animation.value + 0.4
                  ]
              )
          ),
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          constraints: widget.constraints,
          margin: widget.margin,
        );
      }
    );
  }
}