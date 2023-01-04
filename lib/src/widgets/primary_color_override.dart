import 'package:flutter/material.dart';

class FLPrimaryColorOverride extends StatelessWidget {
  const FLPrimaryColorOverride({Key? key, this.color, required this.child})
      : super(key: key);

  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: color),
      child: child,
    );
  }
}
