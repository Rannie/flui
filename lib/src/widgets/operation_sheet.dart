import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../flui_nullsafety.dart';

const double _kSectionHeight = 120;
const double _kSectionInsetVertical = 10;
const double _kItemSpacing = 0;
const double _kItemImageSize = 56;

const CupertinoDynamicColor _kTextColor = CupertinoDynamicColor.withBrightness(
  color: Color.fromARGB(255, 93, 93, 93),
  darkColor: Color.fromARGB(255, 237, 237, 237),
);

/// The operation sheet is based on [FLCupertinoActionSheet].
class FLCupertinoOperationSheet extends StatelessWidget {
  const FLCupertinoOperationSheet({
    Key? key,
    this.borderRadius,
    this.sheetStyle,
    this.backgroundColor,
    this.cancelButton,
    this.header,
    required this.itemList,
  })  : assert(itemList.length > 0),
        super(key: key);

  final BorderRadius? borderRadius;
  final FLCupertinoActionSheetStyle? sheetStyle;
  final Color? backgroundColor;
  final CupertinoActionSheetAction? cancelButton;

  final Widget? header;
  final List<List<FLCupertinoOperationSheetItem>> itemList;

  List<Widget?> _buildAllSections() {
    List<Widget?> children = [];
    // add header
    if (header != null) {
      children.add(header);
      children.add(const Divider(height: 1));
    }
    // add items
    int sectionCount = itemList.length;
    for (int i = 0; i < sectionCount; i++) {
      List list = itemList[i];
      Widget section = _buildSection(list as List<FLCupertinoOperationSheetItem>);
      children.add(section);
      if (i != sectionCount - 1) {
        children.add(const Divider(height: 1));
      }
    }
    return children;
  }

  Widget _buildSection(List<FLCupertinoOperationSheetItem> list) {
    return SizedBox(
      height: _kSectionHeight,
      child: GridView(
        padding: const EdgeInsets.symmetric(
            vertical: _kSectionInsetVertical,
            horizontal: _kSectionInsetVertical),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        backgroundColor: backgroundColor,
        cancelButton: cancelButton,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildAllSections() as List<Widget>,
        ));
  }
}

class FLCupertinoOperationSheetItem extends StatelessWidget {
  const FLCupertinoOperationSheetItem({
    Key? key,
    this.imagePath,
    this.highlightImagePath,
    this.title,
    this.onPressed,
    this.customChild,
  })  : assert((imagePath != null && title != null && onPressed != null) ||
            customChild != null),
        super(key: key);

  final String? imagePath;
  final String? highlightImagePath;
  final String? title;
  final VoidCallback? onPressed;
  final Widget? customChild;

  Widget _buildImageTitleItem(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FLImage(
          borderRadius: BorderRadius.circular(10),
          image: AssetImage(imagePath!),
          width: _kItemImageSize,
          height: _kItemImageSize,
          fit: BoxFit.fill,
          onPressed: onPressed,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: TextStyle(
            color: CupertinoDynamicColor.resolve(_kTextColor, context),
            decoration: TextDecoration.none,
            fontSize: 12,
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
    final child = customChild ?? _buildImageTitleItem(context);
    return ClipRect(
      child: Container(child: child),
    );
  }
}
