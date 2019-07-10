import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FLCopyableLabel extends StatelessWidget {
  FLCopyableLabel({
    Key key,
    @required this.copyData,
    this.showMenu = false,
    @required this.child,
    this.afterCopyCallback
  }) : super(key: key);

  final String copyData;
  final bool showMenu;
  final Widget child;
  final VoidCallback afterCopyCallback;

  void _handleLongPress() {
    Clipboard.setData(ClipboardData(
      text: copyData
    ));
    if (this.afterCopyCallback != null)
      this.afterCopyCallback();
  }

  Widget _buildGestureWidget() {
    return GestureDetector(
      onLongPress: _handleLongPress,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildGestureWidget();
  }
}