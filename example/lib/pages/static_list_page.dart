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
      FLStaticSectionData(headerTitle: 'Account number', itemList: [
        FLStaticItemData(
            title: 'Account management',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
        FLStaticItemData(
            title: 'Account and Security',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            onTap: handleTap),
      ]),
      FLStaticSectionData(headerTitle: 'Set up', itemList: [
        FLStaticItemData(
            title: 'Push notification settings',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            accessoryString: 'Notify All',
            onTap: handleTap),
        FLStaticItemData(
          title: 'Eye protection mode',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          onChanged: onChanged,
          accItemValue: _switchValue,
        ),
        FLStaticItemData(
          title: 'Automatically clear cache',
          subtitle: 'Clean up every 10 days',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          onTap: handleTap,
          selected: true,
        )
      ]),
      FLStaticSectionData(itemList: [
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: 'Submit',
            buttonTitleColor: Colors.blue,
            onButtonPressed: () {
              print('button pressed');
            }),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: 'Delete and logout',
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
