import 'dart:collection';

import 'package:example/main.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum FLToastPosition {
  center,
  top,
  bottom
}

enum FLToastStyle {
  dark,
  lightBlur
}

class FLToastDefaults {
  const FLToastDefaults({
    this.showDuration = const Duration(milliseconds: 1500),
    this.darkColor = Colors.white,
    this.darkBackgroundColor = Colors.black87,
    this.lightColor = Colors.black12,
    this.position = FLToastPosition.center,
    this.style = FLToastStyle.dark,
    this.dismissOtherToast = true,
    this.hideWithTap = true,
    this.trackOrientation = true
  });

  final Duration showDuration;
  final Color darkColor; // include text & icon
  final Color darkBackgroundColor;
  final Color lightColor; // include text & icon
  final FLToastPosition position;
  final FLToastStyle style;
  final bool dismissOtherToast;
  final bool hideWithTap;
  final bool trackOrientation;
}

class FLToastProvider extends StatefulWidget {
  FLToastProvider({
    Key key,
    this.defaults = const FLToastDefaults(),
    @required this.child
  }) : assert(defaults != null),
        assert(child != null),
        super(key: key);

  final FLToastDefaults defaults;
  final Widget child;

  @override
  State<FLToastProvider> createState() => _FLToastProviderState();
}

class _FLToastProviderState extends State<FLToastProvider> {
  @override
  void initState() {
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
    super.initState();
  }

  void _handlePointerEvent(PointerEvent event) {
    if (!widget.defaults.hideWithTap)
      return;

    if (!_toastManager.hasShowingToast())
      return;

    if (event is PointerUpEvent || event is PointerCancelEvent) {
      _toastManager.dismissAllToast();
    }
  }

  @override
  void dispose() {
    _contextMap.remove(this);
    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handlePointerEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Overlay overlay = Overlay(
      initialEntries: [
        OverlayEntry(
            builder: (BuildContext context) {
              _contextMap[this] = context;
              return widget.child;
            }
        )
      ],
    );

    Widget container = Stack(
      children: <Widget>[
        overlay,
        Positioned.fill(
            child: IgnorePointer(
              child: Container(
                color: Colors.black.withOpacity(0.0),
              ),
            )
        )
      ],
    );

    return _FLToastDefaultsWidget(
        child: container
    );
  }
}


class FLToast {
  static Function loading(String text) => FLToast.showLoading(text);
  static Function showLoading(String text,
      { FLToastPosition position, FLToastStyle style }) =>
      _showLoadingToast(text, position: position, style: style);

  static void text(String text) => FLToast.showText(text);
  static void showText(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) =>
      _showToast(text, showDuration: showDuration, position: position, style: style, type: _FLToastType.text);

  static void success(String text) => FLToast.showSuccess(text);
  static void showSuccess(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) =>
      _showToast(text, showDuration: showDuration, position: position, style: style, type: _FLToastType.success);

  static void error(String text) => FLToast.showError(text);
  static void showError(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) =>
      _showToast(text, showDuration: showDuration, position: position, style: style, type: _FLToastType.error);

  static void info(String text) => FLToast.showInfo(text);
  static void showInfo(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) =>
      _showToast(text, showDuration: showDuration, position: position, style: style, type: _FLToastType.info);
}

LinkedHashMap<_FLToastProviderState, BuildContext> _contextMap = LinkedHashMap();
final _toastManager = _FLToastManager._();
final EdgeInsetsGeometry _padding = EdgeInsets.symmetric(horizontal: 16.0);
final _iconSize = 36.0;

enum _FLToastType {
  text,
  loading,
  success,
  error,
  info
}

Function _showLoadingToast(String text, { FLToastPosition position, FLToastStyle style }) {
  return null;
}

void _showToast(String text, { Duration showDuration, FLToastPosition position, FLToastStyle style, _FLToastType type }) {
  BuildContext context = _contextMap.values.first;
  OverlayEntry entry;
  FLToastDefaults defaults = _FLToastDefaultsWidget.of(context);

  position ??= defaults.position;
  showDuration ??= defaults.showDuration;
  style ??= defaults.style;
  Color color = defaults.darkColor;
  Color backgroundColor = defaults.darkBackgroundColor;
  ScaffoldState scaffoldState = Scaffold.of(context);
  logger.d(scaffoldState.appBarMaxHeight);

  GlobalKey<_FLToastViewState> key = GlobalKey();

  entry = OverlayEntry(builder: (BuildContext context) {
    return _FLToastView(
      key: key,
      color: color,
      backgroundColor: backgroundColor,
      text: text,
      padding: _padding,
      slotWidget: _typeWidget(type, color),
    );
  });
}

Widget _typeWidget(_FLToastType type, Color tintColor) {
  if (type == _FLToastType.loading)
  {
    return CircularProgressIndicator(
      strokeWidth: 3.0,
      valueColor: AlwaysStoppedAnimation(tintColor),
    );
  }
  else if (type == _FLToastType.success)
  {
    return Icon(
      Icons.check_circle_outline,
      size: _iconSize,
    );
  }
  else if (type == _FLToastType.info)
  {
    return Icon(
      Icons.error_outline,
      size: _iconSize,
    );
  }
  else if (type == _FLToastType.error)
  {
    return Icon(
      Icons.highlight_off,
      size: _iconSize,
    );
  }
  return null;
}

class _FLToastManager {
  _FLToastManager._();
  Set _toastSet = Set();

  bool hasShowingToast() => _toastSet.length > 0;

  void dismissAllToast() {

  }

  void addToast(value) {
    _toastSet.add(value);
  }
}

class _FLToastDefaultsWidget extends InheritedWidget {
  const _FLToastDefaultsWidget({
    Key key,
    this.defaults,
    Widget child,
  }) : super(key: key, child: child);

  final FLToastDefaults defaults;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static FLToastDefaults of(BuildContext context) {
    _FLToastDefaultsWidget defaultsWidget = context.inheritFromWidgetOfExactType(_FLToastDefaultsWidget);
    return defaultsWidget.defaults;
  }
}

class _FLToastView extends StatefulWidget {
  _FLToastView({
    Key key,
    this.text,
    this.padding,
    this.slotWidget,
    this.color,
    this.backgroundColor
  });

  final String text;
  final EdgeInsetsGeometry padding;
  final Widget slotWidget;
  final Color color;
  final Color backgroundColor;

  @override
  State<_FLToastView> createState() => _FLToastViewState();
}

class _FLToastViewState extends State<_FLToastView> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: null,
      child: Container(
        margin: const EdgeInsets.all(50.0),
        decoration: BoxDecoration(
            color: widget.backgroundColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(4.0)
        ),
        padding: widget.padding,
        child: Center(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Column(
              children: <Widget>[
                widget.slotWidget,
                Text(widget.text, style: TextStyle(color: widget.color))
              ],
            )
        ),
      ),
    );
  }
}