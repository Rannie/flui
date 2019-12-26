import 'package:flui/widgets/bubble.dart';
import 'package:flui/widgets/bubble_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'test_common.dart';

void main() {
  testWidgets('Bubble Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestContainer(
      child: FLBubble(
        child: Text('hello'),
      ),
    ));
    final textFinder = find.text('hello');
    expect(textFinder, findsOneWidget);
  });
  
  testWidgets('Bubble Menu Test', (WidgetTester tester) async {
    const String title = 'BubbleMenu';
    await tester.pumpWidget(TestContainer(
      child: FLBubbleMenuWidget(
        child: Container(
          width: 200,
          height: 40,
          child: Text(title),
        ),
        itemBuilder: (BuildContext context) {
          verify(navigatorObserver.didPush(any, any));
          return [
            FLBubbleMenuItem(
              text: 'item',
              value: 'item'
            )
          ];
        },
      ),
    ));

    await tester.longPress(find.text(title));
    await tester.pumpAndSettle();
;  });
}