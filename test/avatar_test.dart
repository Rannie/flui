import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flui/widgets/avatar.dart';
import 'test_common.dart';

void main() {
  testWidgets('Avatar Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestContainer(
      child: Container(
        width: 200,
        height: 200,
        child: FLAvatar(
          color: Colors.blue,
          text: 'TE',
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    ));

    final textFinder = find.text('TE');
    expect(textFinder, findsOneWidget);
  });
}