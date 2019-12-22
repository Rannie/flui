import 'package:flutter/material.dart';
import 'package:flui/widgets/flat_button.dart';
import 'package:flui/widgets/list_tile.dart';

enum FLStaticListCellType { normal, button, customization }

enum FLStaticListCellAccessoryType {
  accNone,
  accCheckmark,
  accDetail,
  accSwitch,
}

const Color kStaticBackgroundColor = Colors.transparent;
const double kStaticHeaderHeight = 56;
const double kStaticHeaderHeightNormal = 40;
const double kStaticHeaderTitleIntent = 20;
const double kStaticButtonHeight = 44;

class FLStaticSectionData {
  const FLStaticSectionData({
    this.headerTitle,
    this.headerHeight,
    this.headerTitleIntent = kStaticHeaderTitleIntent,
    this.itemList,
    this.headerBackgroundColor = kStaticBackgroundColor,
  })  : assert(itemList != null && itemList.length > 0),
        super();

  final String headerTitle;
  final double headerHeight;
  final double headerTitleIntent;
  final Color headerBackgroundColor;
  final List<FLStaticItemData> itemList;
}

class FLStaticItemData {
  FLStaticItemData({
    this.cellType = FLStaticListCellType.normal,
    this.leading,
    this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.accessoryType = FLStaticListCellAccessoryType.accNone,
    this.accessoryString,
    this.customTrailing,
    this.cellColor,
    this.onTap,
    this.switchValue = false,
    this.selected = false,
    this.onChanged,
    this.buttonTitle,
    this.buttonTitleColor,
    this.buttonColor,
    this.onButtonPressed,
    this.customizeContent,
  })  : assert(() {
          if (cellType == FLStaticListCellType.normal &&
              (leading == null && title == null && subtitle == null)) {
            throw AssertionError(
              'List cell must have a leading or title or subtitle',
            );
          }

          if (cellType == FLStaticListCellType.customization &&
              customizeContent == null) {
            throw AssertionError(
              'Must specify the content when cell\s type is customization',
            );
          }

          if (customTrailing != null &&
              accessoryType != FLStaticListCellAccessoryType.accNone) {
            throw AssertionError(
                'Could not set trailing widget when accessory type != none');
          }
          if (accessoryString != null &&
              accessoryType != FLStaticListCellAccessoryType.accDetail) {
            throw AssertionError(
                'Accessory string only can be shown when cell\'s accessory type is accDetail');
          }
          return true;
        }()),
        super();

  final FLStaticListCellType cellType;

  final Widget leading;
  final String title;
  final TextStyle titleStyle;
  final String subtitle;
  final TextStyle subtitleStyle;
  final FLStaticListCellAccessoryType accessoryType;
  final String accessoryString;
  final Widget customTrailing;
  final Color cellColor;
  final VoidCallback onTap;
  final bool selected;
  final bool switchValue;
  final ValueChanged<bool> onChanged;

  final String buttonTitle;
  final Color buttonColor;
  final Color buttonTitleColor;
  final VoidCallback onButtonPressed;

  final Widget customizeContent;
}

class FLStaticListView extends StatelessWidget {
  const FLStaticListView({
    Key key,
    this.shrinkWrap,
    this.padding,
    this.separatorBuilder,
    @required this.sections,
  })  : assert(sections != null && sections.length > 0),
        super(key: key);

  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final IndexedWidgetBuilder separatorBuilder;
  final List<FLStaticSectionData> sections;

  int _preCalItemCount() {
    int count = sections.length;
    for (int i = 0; i < sections.length; i += 1) {
      FLStaticSectionData sectionData = sections[i];
      int itemCount = sectionData.itemList.length;
      count += itemCount;
    }
    return count;
  }

  Widget _buildSectionHeader(
      FLStaticSectionData sectionData, ThemeData themeData) {
    final Widget titleWidget = sectionData.headerTitle == null
        ? null
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(sectionData.headerTitle,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: themeData.textTheme.subhead.fontSize))
            ],
          );
    final EdgeInsetsGeometry padding = sectionData.headerTitleIntent != null
        ? EdgeInsets.only(left: sectionData.headerTitleIntent)
        : EdgeInsets.zero;
    final headerHeight = sectionData.headerHeight ??
        (sectionData.headerTitle != null
            ? kStaticHeaderHeight
            : kStaticHeaderHeightNormal);
    return Container(
      color: sectionData.headerBackgroundColor,
      height: headerHeight,
      padding: padding,
      child: titleWidget,
    );
  }

  Widget _buildItemCell(FLStaticItemData itemData, ThemeData themeData) {
    final Text titleText = itemData.title == null
        ? null
        : Text(itemData.title, style: itemData.titleStyle);
    final Text subtitleText = itemData.subtitle == null
        ? null
        : Text(itemData.subtitle, style: itemData.subtitleStyle);
    final Widget accesssoryWidget = _getAccessoryWidget(itemData, themeData);
    final Widget trailingWidget = accesssoryWidget ?? itemData.customTrailing;
    return FLListTile(
          leading: itemData.leading,
          title: titleText,
          subtitle: subtitleText,
          trailing: trailingWidget,
          onTap: itemData.onTap,
          selected: itemData.selected,
        );
  }

  Widget _buildButtonCell(FLStaticItemData itemData, ThemeData themeData) {
    return Container(
      color: itemData.cellColor,
      height: kStaticButtonHeight,
      child: FLFlatButton(
        color: itemData.buttonColor,
        textColor: itemData.buttonTitleColor,
        child: Text(itemData.buttonTitle, textAlign: TextAlign.center),
        onPressed: itemData.onButtonPressed,
        expanded: true,
      ),
    );
  }

  Widget _getAccessoryWidget(FLStaticItemData itemData, ThemeData themeData) {
    switch (itemData.accessoryType) {
      case FLStaticListCellAccessoryType.accCheckmark:
        return Icon(Icons.check);
      case FLStaticListCellAccessoryType.accDetail:
        {
          final icon = Container(
            padding:
                EdgeInsets.only(top: 4), // fix not align with accessory text
            child: Icon(Icons.navigate_next),
          );
          if (itemData.accessoryString != null &&
              itemData.accessoryString.length > 0) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(itemData.accessoryString,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: themeData.textTheme.subhead.fontSize)),
                icon
              ],
            );
          }
          return icon;
        }
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

  Widget _appendCellSeparator(Widget cell, ThemeData themeData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        cell,
        Divider(color: themeData.dividerColor, height: 1),
      ],
    );
  }

  List<Widget> _buildCells(ThemeData themeData) {
    final List<Widget> cellList = [];
    for (FLStaticSectionData sectionData in sections) {
      // add header
      Widget sectionHeader = _buildSectionHeader(sectionData, themeData);
      cellList.add(sectionHeader);
      // add section cells
      for (FLStaticItemData itemData in sectionData.itemList) {
        Widget itemCell;
        if (itemData.cellType == FLStaticListCellType.normal) {
          itemCell = _buildItemCell(itemData, themeData);
        } else if (itemData.cellType == FLStaticListCellType.button) {
          itemCell = _buildButtonCell(itemData, themeData);
        } else {
          // customization
          itemCell = itemData.customizeContent;
        }
        // add last cell's bottom divider
        if (sectionData == sections.last &&
            itemData == sectionData.itemList.last) {
          itemCell = _appendCellSeparator(itemCell, themeData);
        }

        cellList.add(itemCell);
      }
    }
    return cellList;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Color sepColor = themeData.dividerColor;
    final IndexedWidgetBuilder sepBuilder = separatorBuilder ??
        (BuildContext context, int index) {
          return Divider(color: sepColor, height: 1);
        };
    final List<Widget> cells = _buildCells(themeData);
    return Container(
      color: kStaticBackgroundColor,
      child: ListView.separated(
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemBuilder: (BuildContext context, int index) {
            return cells[index];
          },
          separatorBuilder: sepBuilder,
          itemCount: _preCalItemCount()),
    );
  }
}
