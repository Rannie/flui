import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class StaticListViewPage extends StatefulWidget {
  static const String routeName = '/static-list-view';
  @override
  State<StatefulWidget> createState() => _StaticListViewState();
}

class _StaticListViewState extends State<StaticListViewPage> {
  bool _switchValue = false;

  handleTap() {
    print('tap cell');
  }

  onChanged(bool value) => setState(() => _switchValue = value);

  List<FLStaticSectionData> _buildList() {
    return [
      FLStaticSectionData(headerTitle: '账号', itemList: [
        FLStaticItemData(
            title: '账号管理',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
        FLStaticItemData(
            title: '账号与安全',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
      ]),
      FLStaticSectionData(headerTitle: '设置', itemList: [
        FLStaticItemData(
            title: '推送通知设置',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            accessoryString: '全部通知',
            onTap: handleTap),
        FLStaticItemData(
          title: '护眼模式',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          onChanged: onChanged,
          switchValue: _switchValue,
        ),
        FLStaticItemData(
          title: '自动清理缓存',
          subtitle: '每 10 天清理一次',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          onTap: handleTap,
          selected: true,
        )
      ]),
      FLStaticSectionData(itemList: [
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '提交',
            buttonTitleColor: Colors.blue,
            onButtonPressed: () {
              print('button pressed');
            }),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '删除并退出登录',
            buttonTitleColor: Colors.red,
            onButtonPressed: () {
              print('button pressed');
            })
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Static List'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: FLStaticListView(
              shrinkWrap: true,
              sections: _buildList(),
            )));
  }
}
