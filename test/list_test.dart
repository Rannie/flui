import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_common.dart';

void main() {
  testWidgets('List Test', (WidgetTester tester) async {
    final String headerTitle = '账号';
    final String itemTitle = '账号管理';
    final sections = [
      FLStaticSectionData(headerTitle: headerTitle, itemList: [
        FLStaticItemData(
            title: itemTitle,
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: () {}),
        FLStaticItemData(
          title: '护眼模式',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          onChanged: (val) {},
          switchValue: false,
        ),
        FLStaticItemData(
          title: '自动清理缓存',
          subtitle: '每 10 天清理一次',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          onTap: () {},
          selected: true,
        ),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '提交',
            buttonTitleColor: Colors.blue,
            onButtonPressed: () {
              print('button pressed');
            }),
      ]),
    ];

    await tester.pumpWidget(TestContainer(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: FLStaticListView(
          shrinkWrap: true,
          sections: sections,
        ),
      ),
    ));

    expect(find.text(headerTitle), findsOneWidget);
    expect(find.text(itemTitle), findsOneWidget);
    expect(find.byIcon(Icons.navigate_next), findsOneWidget);
    expect(find.byType(Switch), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
