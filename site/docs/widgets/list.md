# List

列表视图相关的组件与包装。

## FLListTile

**FLListTile** 为 ListTile 增加了点击的高亮颜色。

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

**FLStaticListView** 静态列表视图，可以绑定一些静态的配置数据，通常用于设置页面以及设置的子级菜单中。涉及到的模型有：

* **FLStaticSectionData** 为静态列表的区域对象模型，每个分区有一个默认的头部，可以设置高度和标题，也可以通过设置头部高度为 0 来隐藏。
* **FLItemData** 为静态列表中每个表格单元绑定的数据对象模型， 可以设置类型(标准，按钮，自定义)， 标题， 子标题，附属视图(右侧的箭头，对勾，Switch 组件等)，附属视图旁边的文字，或者直接自定义右侧视图。

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

