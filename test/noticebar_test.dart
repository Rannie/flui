import 'package:flui/flui.dart';
import 'package:flui/widgets/notice_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_common.dart';

void main() {
  testWidgets('Notice Bar Test', (WidgetTester tester) async {
    final String notice = 'This is a notice';
    await tester.pumpWidget(TestContainer(
      child: Container(
        child: FLNoticeBar(
          text: notice,
        ),
      ),
    ));

    expect(find.byType(FLMarqueeLabel), findsOneWidget);
    expect(find.text(notice), findsOneWidget);

    await tester.pumpWidget(TestContainer(
      child: Container(
        child: FLNoticeBar.notice(
          text: notice,
        ),
      ),
    ));

    expect(find.byIcon(Icons.notifications_active), findsOneWidget);

    await tester.pumpWidget(TestContainer(
      child: Container(
        child: FLNoticeBar.closable(
          text: notice,
          onPressed: (){},
        ),
      ),
    ));

    expect(find.byIcon(Icons.close), findsOneWidget);

    final GlobalKey preKey = GlobalKey();
    await tester.pumpWidget(TestContainer(
      child: Container(
        child: FLNoticeBar(
          text: notice,
          prefixBuilder: (BuildContext context) {
            return Container(
              key: preKey,
              width: 20,
              height: 20,
            );
          })
      ),
    ));

    expect(find.byKey(preKey), findsOneWidget);
  });
}