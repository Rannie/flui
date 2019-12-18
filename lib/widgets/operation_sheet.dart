import 'image.dart';
import 'action_sheet.dart';
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

  final BorderRadius borderRadius;
  final FLCupertinoActionSheetStyle sheetStyle;
  final Color backgroundColor;
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
        padding: EdgeInsets.symmetric(
            vertical: _kSectionInsetVertical,
            horizontal: _kSectionInsetVertical),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: _kItemSpacing,
            childAspectRatio: 6 / 5),
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
        ));
  }
}

class FLCupertinoOperationSheetItem extends StatelessWidget {
  FLCupertinoOperationSheetItem({
    Key key,
    this.imagePath,
    this.highlightImagePath,
    this.title,
    this.onPressed,
    this.customChild,
  })  : assert((imagePath != null && title != null && onPressed != null) ||
            customChild != null),
        super(key: key);

  final String imagePath;
  final String highlightImagePath;
  final String title;
  final VoidCallback onPressed;
  final Widget customChild;

  Widget _buildImageTitleItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FLImage(
          borderRadius: BorderRadius.circular(10),
          image: AssetImage(imagePath),
          width: _kItemImageSize,
          height: _kItemImageSize,
          fit: BoxFit.fill,
          onPressed: onPressed,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = this.customChild ?? _buildImageTitleItem();
    return ClipRect(
      child: Container(child: child),
    );
  }
}
