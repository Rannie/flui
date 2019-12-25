import 'package:flui/flui.dart';
import 'package:flui/widgets/copyable_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'test_common.dart';

void main() {
  testWidgets('Copyable Label Test', (WidgetTester tester) async {
    final String copyData = 'copydata';
    final menuFinder = find.byType(FLBubbleMenuWidget);
    await tester.pumpWidget(TestContainer(
        child: Container(
      child: FLCopyableLabel(
        copyData: copyData,
        child: Text('label'),
        showMenu: false,
      ),
    )));

    expect(menuFinder, findsNothing);

    await tester.pumpWidget(TestContainer(
        child: Container(
      child: FLCopyableLabel(
        copyData: copyData,
        child: Text('label'),
        showMenu: true,
      ),
    )));

    expect(menuFinder, findsOneWidget);

    await tester.longPress(find.text('label'));
    await tester.pumpAndSettle();
    verify(navigatorObserver.didPush(any, any));
  });

  testWidgets('Marquee Label Test', (WidgetTester tester) async {
    await tester.pumpWidget(
        TestContainer(
          child: Container(
            child: FLMarqueeLabel(
              velocity: 0,
              text: 'this is a notice',
            ),
          ),
        ),
        Duration(milliseconds: 300));

    final textFinder = find.text('this is a notice');
    expect(textFinder, findsOneWidget);
  });
}
