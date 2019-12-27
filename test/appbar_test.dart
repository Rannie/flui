import 'package:flui/src/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_common.dart';

void main() {
  testWidgets('App Bar Test', (WidgetTester tester) async {
    final String title = 'Navigation';
    final String subtitle = 'subtitle';
    await tester.pumpWidget(TestContainer(
      appbar: AppBar(
        title: FLAppBarTitle(
          title: title,
          subtitle: subtitle,
        ),
      ),
      child: Container(),
    ));

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);

    await tester.pumpWidget(TestContainer(
      appbar: AppBar(
        title: FLAppBarTitle(
          title: title,
          subtitle: subtitle,
          showLoading: true,
        ),
      ),
      child: Container(),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final IconData iconData = Icons.keyboard;
    await tester.pumpWidget(TestContainer(
      appbar: AppBar(
        title: FLAppBarTitle(
          title: title,
          subtitle: subtitle,
          customAccessoryWidget: Icon(iconData),
        ),
      ),
      child: Container(),
    ));

    expect(find.byIcon(iconData), findsOneWidget);
  });
}
