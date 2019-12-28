import 'package:flutter/material.dart';

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
    this.backgroundColor,
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

  @override
  State<StatefulWidget> createState() => _FLListTileState();
}

class _FLListTileState extends State<FLListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: Container(
          color: widget.backgroundColor,
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
        ));
  }
}
