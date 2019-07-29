import 'package:flutter/material.dart';

class FLEmptyContainer extends StatefulWidget {
  FLEmptyContainer({
    Key key,
    this.customLoadingWidget,
    this.showLoading = false,
    this.image,
    this.title,
    this.titleStyle,
    this.detailText,
    this.detailTextStyle,
    this.actionButtonTitle,
    this.actionButton,
    @required this.content,
  }) : assert(content != null),
       super(key: key);

  final Widget customLoadingWidget;
  /// show loading or not, default is false.
  /// if [showLoading] is true & no custom loading widget, it will show a [CircularProgressIndicator].
  final bool showLoading;
  final Image image;
  final String title;
  final TextStyle titleStyle;
  final String detailText;
  final TextStyle detailTextStyle;
  /// widget will generate a button when u config this field.
  /// if u want to customize the style of the action button, please use [actionButton].
  final String actionButtonTitle;
  /// custom action button
  final Widget actionButton;
  /// when call [FLEmptyContainerState.switchToContent], it will switch to this widget.
  final Widget content;

  @override
  State<FLEmptyContainer> createState() => FLEmptyContainerState();
}

class FLEmptyContainerState extends State<FLEmptyContainer> {
  void switchToContent() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}