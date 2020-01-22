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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color bgColor = Theme.of(context).backgroundColor;
    return [
      FLStaticSectionData(headerTitle: 'Account', itemList: [
        FLStaticItemData(
            title: 'Account Management',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onTap: handleTap),
        FLStaticItemData(
            title: 'Security',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onTap: handleTap),
      ]),
      FLStaticSectionData(headerTitle: 'Settings', itemList: [
        FLStaticItemData(
            title: 'Push Notification Settings',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            accessoryString: 'Notify All',
            onTap: handleTap),
        FLStaticItemData(
          title: 'Eye Protection Mode',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          cellColor: isDarkMode ? bgColor : Colors.white,
          onChanged: onChanged,
          accItemValue: _switchValue,
        ),
        FLStaticItemData(
          title: 'Automatically Clear Cache',
          subtitle: 'Clean up every 10 days',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          cellColor: isDarkMode ? bgColor : Colors.white,
          onTap: handleTap,
          selected: true,
        )
      ]),
      FLStaticSectionData(itemList: [
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: 'Submit',
            buttonTitleColor: Colors.blue,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onButtonPressed: () {
              print('button pressed');
            }),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: 'Delete and Logout',
            buttonTitleColor: Colors.red,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onButtonPressed: () {
              print('button pressed');
            })
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color bgColor = Theme.of(context).backgroundColor;
    return Scaffold(
        appBar: AppBar(
          title: Text('Static List'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: isDarkMode ? bgColor : Color(0xFFFCFCFC),
            child: FLStaticListView(
              shrinkWrap: true,
              sections: _buildList(),
            )));
  }
}
