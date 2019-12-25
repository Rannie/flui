import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

class TestContainer extends StatelessWidget {
  TestContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [navigatorObserver],
      home: Scaffold(
        body: Container(
          child: child,
        ),
      ),
    );
  }
}
