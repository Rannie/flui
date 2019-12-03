import 'package:flutter/material.dart';

enum FLStaticListCellAccessoryType {
  accNone,
  accCheckmark,
  accDetail,
  accSwitch,
}

const Color kStaticBackgroundColor = Color.fromRGBO(246, 246, 246, 1);
const double kStaticHeaderHeight = 56;
const double kStaticHeaderHeightNormal = 40;
const double kStaticHeaderTitleIntent = 20;

class FLStaticSectionData {
  const FLStaticSectionData({
    this.headerTitle,
    this.headerHeight,
    this.headerTitleIntent = kStaticHeaderTitleIntent,
    this.itemList,
    this.headerBackgroundColor = kStaticBackgroundColor,
  }): assert(itemList != null && itemList.length > 0),
      super();

  final String headerTitle;
  final double headerHeight;
  final double headerTitleIntent;
  final Color headerBackgroundColor;
  final List<FLStaticItemData> itemList;
}

class FLStaticItemData {
  FLStaticItemData({
    this.leading,
    this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.accessoryType = FLStaticListCellAccessoryType.accNone,
    this.customTrailing,
    this.cellColor = Colors.white,
    this.onTap,
    this.switchValue = false,
    this.onChanged,
  }) : assert(leading != null || title != null || subtitle != null),
       assert(() {
         if (customTrailing != null && accessoryType != FLStaticListCellAccessoryType.accNone) {
           throw AssertionError(
               'Could not set trailing widget when accessory type != none'
           );
         }
         return true;
       }()),
       super();

  final Widget leading;
  final String title;
  final TextStyle titleStyle;
  final String subtitle;
  final TextStyle subtitleStyle;
  final FLStaticListCellAccessoryType accessoryType;
  final Widget customTrailing;
  final Color cellColor;
  final VoidCallback onTap;
  final bool switchValue;
  final ValueChanged<bool> onChanged;
}

class FLStaticListView extends StatelessWidget {
  const FLStaticListView({
    Key key,
    this.shrinkWrap,
    this.padding,
    this.separatorBuilder,
    this.sections,
  }) : assert(sections != null && sections.length > 0),
       super(key: key);

  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder separatorBuilder;
  final List<FLStaticSectionData> sections;

  int _preCalItemCount() {
    int count = sections.length;
    for (int i = 0; i < sections.length; i+= 1) {
      FLStaticSectionData sectionData = sections[i];
      int itemCount = sectionData.itemList.length;
      count += itemCount;
    }
    return count;
  }

  Widget _buildSectionHeader(FLStaticSectionData sectionData) {
    final Widget titleWidget = sectionData.headerTitle == null ? null : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
            sectionData.headerTitle,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 17
            )
        )
      ],
    );
    final EdgeInsetsGeometry padding = sectionData.headerTitleIntent != null
        ? EdgeInsets.only(left: sectionData.headerTitleIntent)
        : EdgeInsets.zero;
    final headerHeight = sectionData.headerHeight
        ?? (sectionData.headerTitle != null ? kStaticHeaderHeight : kStaticHeaderHeightNormal);
    return Container(
      color: sectionData.headerBackgroundColor,
      height: headerHeight,
      padding: padding,
      child: titleWidget,
    );
  }

  Widget _buildItemCell(FLStaticItemData itemData) {
    final Text titleText = itemData.title == null ? null
        : Text(itemData.title, style: itemData.titleStyle);
    final Text subtitleText = itemData.subtitle == null ? null
        : Text(itemData.subtitle, style: itemData.subtitleStyle);
    final Widget accesssoryWidget = _getAccessoryWidget(itemData);
    final Widget trailingWidget = accesssoryWidget ?? itemData.customTrailing;
    return Container(
      color: itemData.cellColor,
      child: ListTile(
        leading: itemData.leading,
        title: titleText,
        subtitle: subtitleText,
        trailing: trailingWidget,
        onTap: itemData.onTap,
      )
    );
  }

  Widget _getAccessoryWidget(FLStaticItemData itemData) {
    switch(itemData.accessoryType) {
      case FLStaticListCellAccessoryType.accCheckmark:
        return Icon(Icons.check);
      case FLStaticListCellAccessoryType.accDetail:
        return Icon(Icons.navigate_next);
      case FLStaticListCellAccessoryType.accSwitch:
        return Switch(
          value: itemData.switchValue,
          onChanged: itemData.onChanged,
        );
      case FLStaticListCellAccessoryType.accNone:
      default:
        return null;
      break;
    }
  }

  List<Widget> _buildCells() {
    final List<Widget> cellList = [];
    for (FLStaticSectionData sectionData in sections) {
      // add header
      Widget sectionHeader = _buildSectionHeader(sectionData);
      cellList.add(sectionHeader);
      // add section cells
      for (FLStaticItemData itemData in sectionData.itemList) {
        Widget itemCell = _buildItemCell(itemData);
        cellList.add(itemCell);
      }
    }
    return cellList;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Color sepColor = themeData.dividerColor;
    final IndexedWidgetBuilder sepBuilder = separatorBuilder ?? (BuildContext context, int index) {
      return Divider(color: sepColor, height: 1);
    };
    final List<Widget> cells = _buildCells();
    return Container(
      color: kStaticBackgroundColor,
      child: ListView.separated(
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemBuilder: (BuildContext context, int index) {
            return cells[index];
          },
          separatorBuilder: sepBuilder,
          itemCount: _preCalItemCount()
      ),
    );
  }
}