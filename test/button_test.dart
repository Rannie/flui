import 'package:flui/widgets/loading_button.dart';
import 'package:flui/widgets/flat_button.dart';
import 'package:flui/widgets/raised_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'test_common.dart';

void main() {
  testWidgets('Flat Button Test', (WidgetTester tester) async {
    final GlobalKey _buttonKey = GlobalKey();
    final double width = 150;
    final normalFinder = find.text('flat button');

    await tester.pumpWidget(TestContainer(
        child: Container(
      width: width,
      child: FLFlatButton(
        key: _buttonKey,
        expanded: true,
        child: Text('flat button'),
        onPressed: () {},
      ),
    )));

    final double buttonW =
        _buttonKey.currentContext.findRenderObject().paintBounds.width;
    expect(normalFinder, findsOneWidget);
    expect(buttonW.compareTo(width), 0);

    final IconData iconData = Icons.access_alarm;
    final textFinder = find.text('alarm');
    final iconFinder = find.widgetWithIcon(FlatButton, iconData);

    await tester.pumpWidget(TestContainer(
      child: FLFlatButton.icon(
          onPressed: () {}, icon: Icon(iconData), label: Text('alarm')),
    ));

    expect(textFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Raised Button Test', (WidgetTester tester) async {
    final GlobalKey _raisedKey = GlobalKey();
    final double width = 150;
    final textFinder = find.text('raised button');

    await tester.pumpWidget(TestContainer(
      child: Container(
        width: width,
        child: FLRaisedButton(
          key: _raisedKey,
          expanded: true,
          child: Text('raised button'),
          onPressed: () {},
        ),
      ),
    ));

    final double buttonW =
        _raisedKey.currentContext.findRenderObject().paintBounds.width;
    expect(buttonW.compareTo(width), 0);
    expect(textFinder, findsOneWidget);

    final IconData iconData = Icons.access_alarm;
    final tFinder = find.text('alarm');
    final iconFinder = find.widgetWithIcon(RaisedButton, iconData);

    await tester.pumpWidget(TestContainer(
      child: FLRaisedButton.icon(
          onPressed: () {}, icon: Icon(iconData), label: Text('alarm')),
    ));

    expect(tFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('Loading Button Test', (WidgetTester tester) async {
    Widget createLoadingButton(bool loading, bool indicatorOnly) {
      return TestContainer(
        child: FLLoadingButton(
          child: Text('login'),
          loading: loading,
          indicatorOnly: indicatorOnly,
          onPressed: () {},
        ),
      );
    }

    final textFinder = find.text('login');
    final indiFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(createLoadingButton(false, false));
    expect(textFinder, findsOneWidget);
    expect(indiFinder, findsNothing);

    await tester.pumpWidget(createLoadingButton(true, false));
    expect(indiFinder, findsOneWidget);

    await tester.pumpWidget(createLoadingButton(true, true));
    expect(textFinder, findsNothing);
  });
}
