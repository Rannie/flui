# List

List view related widgets.

## FLListTile

**FLListTile** adds a click highlight color to ListTile.

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-15-list_tile.gif" />
</p>

```dart
FLListTile(
    title: Text('账号管理'),
    trailing: Icon(Icons.navigate_next),
    onTap: (){},
)
```

## FLStaticListView

**FLStaticListView** can bind some static configuration data models, it is usually used in setting pages. The models involved are:

* **FLStaticSectionData** is the area object model for static lists. Each section area has a default header. You can set the height and title, or you can hide it by setting the height of the header to 0.
* **FLItemData** is the data object model bound to each table cell in the static list. You can set the type (normal, button, custom), title, subtitle, accessory view (arrow, check mark, Switch widget etc.), the text next to the accessory view, or directly customize the accessory view.

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-15-Simulator%20Screen%20Shot%20-%20iPhone%2011%20Pro%20Max%20-%202019-12-15%20at%2010.07.41.png" />
</p>

```dart
const List<FLStaticSectionData> listData = [
     FLStaticSectionData(
       headerTitle: '账号',
       itemList: [
         FLStaticItemData(
           title: '账号管理',
           accessoryType: FLStaticListCellAccessoryType.accDetail,
           onTap: handleTap
         ),
         FLStaticItemData(
             title: '账号与安全',
             accessoryType: FLStaticListCellAccessoryType.accDetail,
             onTap: handleTap
         ),
       ]
     ),
     FLStaticSectionData(
       headerTitle: '设置',
       itemList: [
         FLStaticItemData(
             title: '推送通知设置',
             accessoryType: FLStaticListCellAccessoryType.accDetail,
             accessoryString: '全部通知',
             onTap: handleTap
         ),
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
       ]
     ),
     FLStaticSectionData(
       itemList: [
         FLStaticItemData(
             cellType: FLStaticListCellType.button,
             buttonTitle: 'Apply',
             buttonTitleColor: Colors.blue,
             onButtonPressed: () {
               print('button pressed');
             }
         ),
         FLStaticItemData(
             cellType: FLStaticListCellType.button,
             buttonTitle: 'Delete',
             buttonTitleColor: Colors.red,
             onButtonPressed: () {
               print('button pressed');
             }
         )
       ]
     )
];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Static List'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,//Color.fromRGBO(246, 246, 246, 1),
        child: FLStaticListView(
          shrinkWrap: true,
          sections: _buildList(),
        )
      )
    );
  }
```

