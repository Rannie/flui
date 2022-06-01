import 'package:flutter/material.dart';

const Color _kDefaultTitleColor = Color.fromARGB(255, 93, 100, 110);
const Color _kDefaultTitleColorLight = Color.fromARGB(255, 247, 247, 247);
const Color _kDefaultDetailColor = Color.fromARGB(255, 133, 140, 150);
const Color _kDefaultDetailColorLight =
    Color.fromARGB(255, 218, 218, 218);

class FLEmptyContainer extends StatefulWidget {
  FLEmptyContainer({
    Key? key,
    this.backgroundColor,
    this.customLoadingWidget,
    this.showLoading = false,
    this.image,
    this.title,
    this.titleStyle,
    this.detailText,
    this.detailTextStyle,
    this.space = 8.0,
    this.actionButton,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? customLoadingWidget;

  /// show loading or not, default is false.
  /// if [showLoading] is true & no custom loading widget, it will show a [CircularProgressIndicator].
  final bool showLoading;
  final Image? image;
  final String? title;
  final TextStyle? titleStyle;
  final String? detailText;
  final TextStyle? detailTextStyle;
  final double space;

  /// custom action button
  final Widget? actionButton;

  @override
  State<FLEmptyContainer> createState() => FLEmptyContainerState();
}

class FLEmptyContainerState extends State<FLEmptyContainer> {
  void _addChildAndSpacingIfNeeded(List<Widget?> list, Widget? newChild) {
    if (list.length > 0) {
      list.add(SizedBox(height: widget.space));
    }
    list.add(newChild);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> children = <Widget>[];
    if (widget.customLoadingWidget != null) {
      _addChildAndSpacingIfNeeded(children, widget.customLoadingWidget);
    }

    if (widget.customLoadingWidget == null && widget.showLoading) {
      Widget loading = CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation(Theme.of(context).colorScheme.secondary),
      );
      _addChildAndSpacingIfNeeded(children, loading);
    }

    if (widget.image != null) {
      _addChildAndSpacingIfNeeded(children, widget.image);
    }

    if (widget.title != null && widget.title!.isNotEmpty) {
      TextStyle textStyle = widget.titleStyle ??
          TextStyle(
              fontSize: 16.0,
              color:
                  isDarkMode ? _kDefaultTitleColorLight : _kDefaultTitleColor);
      Widget title =
          Text(widget.title!, style: textStyle, textAlign: TextAlign.center);
      _addChildAndSpacingIfNeeded(children, title);
    }

    if (widget.detailText != null && widget.detailText!.isNotEmpty) {
      TextStyle textStyle = widget.detailTextStyle ??
          TextStyle(
              fontSize: 14.0,
              color: isDarkMode
                  ? _kDefaultDetailColorLight
                  : _kDefaultDetailColor);
      Widget detailText = Text(widget.detailText!,
          style: textStyle, textAlign: TextAlign.center);
      _addChildAndSpacingIfNeeded(children, detailText);
    }

    if (widget.actionButton != null) {
      _addChildAndSpacingIfNeeded(children, widget.actionButton);
    }

    return Container(
        color: widget.backgroundColor,
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ));
  }
}
