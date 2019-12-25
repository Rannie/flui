import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  TestContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: child,
        ),
      ),
    );
  }
}