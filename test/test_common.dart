import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

class TestContainer extends StatelessWidget {
  TestContainer({
    Key key,
    @required this.child,
    this.bottomWidget,
  }) : super(key: key);

  final Widget child;
  final Widget bottomWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [navigatorObserver],
      home: Scaffold(
        body: Container(
          child: child,
        ),
        bottomNavigationBar: bottomWidget,
      ),
    );
  }
}

Future delayed({milliseconds : 600}) async {
  return await Future.delayed(Duration(milliseconds: milliseconds));
}
