import 'package:flutter/material.dart';

const double _kDefaultTitleSize = 17;
const double _kDefaultVerticalTitleSize = 15;
const double _kDefaultVerticalSubtitleSize = 12;

enum FLAppBarTitleLayout {
  horizontal,
  vertical,
}

enum FLAppBarPosition {
  left,
  right,
}

class FLAppBarTitle extends StatelessWidget {
  FLAppBarTitle(
      {Key? key,
      required this.title,
      this.titleStyle,
      this.subtitle,
      this.subtitleStyle,
      this.layout = FLAppBarTitleLayout.horizontal,
      this.showLoading = false,
      this.loadingPosition = FLAppBarPosition.left,
      this.customAccessoryWidget,
      this.accessoryPosition = FLAppBarPosition.right})
      : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool showLoading;
  final FLAppBarTitleLayout layout;
  final FLAppBarPosition loadingPosition;
  final Widget? customAccessoryWidget;
  final FLAppBarPosition accessoryPosition;

  Widget _buildTitles() {
    List<Widget> titles = [];
    double tSize = layout == FLAppBarTitleLayout.horizontal
        ? _kDefaultTitleSize
        : _kDefaultVerticalTitleSize;
    TextStyle tStyle =
        titleStyle ?? TextStyle(fontWeight: FontWeight.bold, fontSize: tSize);
    Text titleWidget = Text(title, style: tStyle);
    titles.add(titleWidget);

    if (subtitle != null) {
      Widget inset = layout == FLAppBarTitleLayout.horizontal
          ? SizedBox(width: 5)
          : SizedBox(height: 3);
      titles.add(inset);

      double sSize = layout == FLAppBarTitleLayout.horizontal
          ? _kDefaultTitleSize
          : _kDefaultVerticalSubtitleSize;
      TextStyle sStyle = subtitleStyle ??
          TextStyle(fontWeight: FontWeight.w300, fontSize: sSize);
      Text subtitleWidget = Text(subtitle!, style: sStyle);
      titles.add(subtitleWidget);
    }

    if (layout == FLAppBarTitleLayout.horizontal) {
      return Row(mainAxisSize: MainAxisSize.min, children: titles);
    } else {
      return Column(
        children: titles,
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }
  }

  Widget _buildLoadingIndicator(Color? tintColor) {
    return Transform.scale(
        scale: 0.4,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(tintColor),
        ));
  }

  _widgetInsetsAdd(List<Widget?> list, Widget? widget) {
    if (list.length > 0) {
      list.add(SizedBox(width: 3));
    }
    list.add(widget);
  }

  @override
  Widget build(BuildContext context) {
    final Widget titleWidget = _buildTitles();
    ThemeData themeData = Theme.of(context);
    final Color? tintColor = themeData.appBarTheme.toolbarTextStyle?.color ??
        themeData.primaryTextTheme.headline6!.color;
    List<Widget> children = [];

    // build left
    if (loadingPosition == FLAppBarPosition.left && showLoading) {
      children.add(_buildLoadingIndicator(tintColor));
    }
    if (accessoryPosition == FLAppBarPosition.left &&
        customAccessoryWidget != null) {
      _widgetInsetsAdd(children, customAccessoryWidget);
    }

    // add title
    _widgetInsetsAdd(children, titleWidget);

    // build right
    if (accessoryPosition == FLAppBarPosition.right &&
        customAccessoryWidget != null) {
      _widgetInsetsAdd(children, customAccessoryWidget);
    }
    if (loadingPosition == FLAppBarPosition.right && showLoading) {
      _widgetInsetsAdd(children, _buildLoadingIndicator(tintColor));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
