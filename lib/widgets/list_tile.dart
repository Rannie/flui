import 'package:flutter/material.dart';

const Color kListTileHighlightColor = Color.fromRGBO(238, 239, 241, 1);

/// FLListTile is a component that include [ListTile],
/// just handle gesture to change background color.
class FLListTile extends StatefulWidget {
  FLListTile({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.backgroundColor = Colors.white,
    this.highlightBackgroundColor = kListTileHighlightColor,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final bool isThreeLine;
  final bool dense;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final bool selected;

  final Color backgroundColor;
  final Color highlightBackgroundColor;

  @override
  State<StatefulWidget> createState() => _FLListTileState();
}

class _FLListTileState extends State<FLListTile> {
  bool _pressed = false;

  void _handleHighlightChanged(bool value) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  Color get _effectiveBackgroundColor {
    if (_pressed) {
      return widget.highlightBackgroundColor;
    }

    return widget.backgroundColor;
  }

  @override
  void didUpdateWidget(FLListTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && _pressed) {
      _handleHighlightChanged(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _effectiveBackgroundColor,
      child: InkWell(
        onHighlightChanged: _handleHighlightChanged,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: ListTile(
          leading: widget.leading,
          title: widget.title,
          subtitle: widget.subtitle,
          trailing: widget.trailing,
          isThreeLine: widget.isThreeLine,
          dense: widget.dense,
          contentPadding: widget.contentPadding,
          enabled: widget.enabled,
          selected: widget.selected,
        ),
      ),
    );
  }
}