import 'package:flui/src/widgets/empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_common.dart';

void main() {
  testWidgets('Empty Test', (WidgetTester tester) async {
    await tester.pumpWidget(TestContainer(
      child: FLEmptyContainer(
        showLoading: true,
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final String hint = 'title';
    final String description = 'description';
    await tester.pumpWidget(TestContainer(
      child: FLEmptyContainer(
        title: hint,
        detailText: description,
      ),
    ));

    expect(find.text(hint), findsOneWidget);
    expect(find.text(description), findsOneWidget);
  });
}
