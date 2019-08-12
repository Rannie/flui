import 'package:example/action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kSectionHeight = 120;
const double _kSectionInsetVertical = 10;
const double _kItemSpacing = 0;
const double _kItemImageSize = 56;

const Color _kTextColor = Color.fromARGB(255, 93, 93, 93);

/// The operation sheet is based on [FLCupertinoActionSheet].
class FLCupertinoOperationSheet extends StatelessWidget {
  FLCupertinoOperationSheet({
    Key key,
    this.borderRadius,
    this.sheetStyle,
    this.backgroundColor,
    this.cancelButton,
    @required this.itemList,
  }) : super(key: key);

  /// {@macro FLCupertinoOperationSheet.borderRadius}
  final BorderRadius borderRadius;
  /// {@macro FLCupertinoOperationSheet.sheetStyle}
  final FLCupertinoActionSheetStyle sheetStyle;
  /// {@macro FLCupertinoOperationSheet.backgroundColor}
  final Color backgroundColor;
  /// {@macro FLCupertinoOperationSheet.cancelButton}
  final CupertinoActionSheetAction cancelButton;

  final List<List<FLCupertinoOperationSheetItem>> itemList;

  List<Widget> _buildAllSections() {
    List<Widget> children = [];
    int sectionCount = itemList.length;
    for (int i = 0; i < sectionCount; i++) {
      List list = itemList[i];
      Widget section = _buildSection(list);
      children.add(section);

      if (i != sectionCount - 1) {
        children.add(Divider(height: 1));
      }
    }
    return children;
  }

  Widget _buildSection(List<FLCupertinoOperationSheetItem> list) {
    return Container(
      height: _kSectionHeight,
      child: GridView(
        padding: EdgeInsets.symmetric(vertical: _kSectionInsetVertical, horizontal: _kSectionInsetVertical),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: _kItemSpacing,
          childAspectRatio: 6/5
        ),
        children: list,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FLCupertinoActionSheet(
      style: sheetStyle ?? FLCupertinoActionSheetStyle.roundedCard,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor ?? Color(0xD1F8F8F8),
      cancelButton: cancelButton,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildAllSections(),
        ),
      )
    );
  }
}

class FLCupertinoOperationSheetItem extends StatelessWidget {
  FLCupertinoOperationSheetItem({
    Key key,
    this.imagePath,
    this.title,
    this.onPressed,
  }) : assert(imagePath != null),
       assert(title != null),
       assert(onPressed != null),
       super(key: key);

  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        child: GestureDetector(
          excludeFromSemantics: true,
          onTap: onPressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage(imagePath),
                  width: _kItemImageSize,
                  height: _kItemImageSize,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: _kTextColor,
                      decoration: TextDecoration.none,
                      fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
        ),
      ),
    );
  }
}