import 'package:flui/src/widgets/badge.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'test_common.dart';

void main() {
  testWidgets('Badge Test', (WidgetTester tester) async {
    final IconData iconData = Icons.home;
    await tester.pumpWidget(TestContainer(
        child: Container(),
        bottomWidget: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: FLBadge(
                child: Icon(iconData),
                hidden: false,
                shape: FLBadgeShape.circle,
                text: '2',
              ),
              title: Text('home')),
          BottomNavigationBarItem(
              icon: FLBadge(
                child: Icon(iconData),
                hidden: false,
                shape: FLBadgeShape.circle,
                text: '2',
              ),
              title: Text('home')),
        ])));

    expect(find.byIcon(iconData), findsNWidgets(2));
    expect(find.text('2'), findsNWidgets(2));
  });
}
