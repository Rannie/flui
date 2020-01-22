import 'dart:collection';
import 'dart:async';
import 'dart:ffi';
import 'dart:ui' as ui;

import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum FLToastPosition { center, top, bottom }

enum FLToastStyle { dark, light }

typedef FLToastContentBuilder = Widget Function(BuildContext context);

class FLToastDefaults {
  const FLToastDefaults({
    this.showDuration = const Duration(milliseconds: 1500),
    this.darkColor = Colors.white,
    this.darkBackgroundColor = Colors.black87,
    this.backgroundOpacity = 0.8,
    this.lightColor = const Color(0xFF2F2F2F),
    this.lightBackgroundColor = const Color(0xFFE0E0E0),
    this.position = FLToastPosition.center,
    this.style = FLToastStyle.dark,
    this.dismissOtherToast = true,
    this.hideWithTap = true,
    this.textDirection = TextDirection.ltr,
    this.topOffset = kToolbarHeight + 10,
    this.bottomOffset = 10,
  });

  final Duration showDuration;
  final Color darkColor; // include text & icon
  final Color darkBackgroundColor;
  final double backgroundOpacity;
  final Color lightColor; // include text & icon
  final Color lightBackgroundColor;
  final FLToastPosition position;
  final FLToastStyle style;
  final bool dismissOtherToast;
  final bool hideWithTap;
  final TextDirection textDirection;
  final double topOffset;
  final double bottomOffset;
}

class FLToastProvider extends StatefulWidget {
  FLToastProvider(
      {Key key, this.defaults = const FLToastDefaults(), @required this.child})
      : assert(defaults != null),
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
    super.initState();
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
  }

  void _handlePointerEvent(PointerEvent event) {
    if (!widget.defaults.hideWithTap) return;

    if (!_toastManager.hasShowingToast()) return;

    if (event is PointerUpEvent || event is PointerCancelEvent) {
      _toastManager.dismissAllToast();
    }
  }

  @override
  void dispose() {
    _contextMap.remove(this);
    GestureBinding.instance.pointerRouter
        .removeGlobalRoute(_handlePointerEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Overlay overlay = Overlay(
      initialEntries: [
        OverlayEntry(builder: (BuildContext context) {
          _contextMap[this] = context;
          return widget.child;
        })
      ],
    );

    return _FLToastDefaultsWidget(
        defaults: widget.defaults,
        child: Directionality(
          textDirection: widget.defaults.textDirection,
          child: Stack(
            children: <Widget>[
              overlay,
              Positioned.fill(
                  child: IgnorePointer(
                child: Container(
                  color: Colors.black.withOpacity(0.0),
                ),
              ))
            ],
          ),
        ));
  }
}

class FLToast {
  static Function loading({String text}) => FLToast.showLoading(text: text);
  static Function showLoading(
          {String text, FLToastPosition position, FLToastStyle style}) =>
      _showToast(text,
          position: position, style: style, type: _FLToastType.loading);

  static Function show({String text, FLToastContentBuilder contentBuilder}) =>
      FLToast.showToast(text: text, contentBuilder: contentBuilder);
  static Function showToast(
          {String text,
          FLToastContentBuilder contentBuilder,
          Duration duration,
          FLToastPosition position,
          FLToastStyle style}) =>
      _showToast(text,
          contentBuilder: contentBuilder,
          showDuration: duration,
          position: position,
          style: style,
          type: _FLToastType.custom);

  static void text({String text}) => FLToast.showText(text: text);
  static void showText(
          {String text,
          Duration showDuration,
          FLToastPosition position,
          FLToastStyle style,
          VoidCallback onClosed}) =>
      _showToast(text,
          showDuration: showDuration,
          position: position,
          style: style,
          type: _FLToastType.text,
          onClosed: onClosed);

  static void success({String text}) => FLToast.showSuccess(text: text);
  static void showSuccess(
          {String text,
          Duration showDuration,
          FLToastPosition position,
          FLToastStyle style,
          VoidCallback onClosed}) =>
      _showToast(text,
          showDuration: showDuration,
          position: position,
          style: style,
          type: _FLToastType.success,
          onClosed: onClosed);

  static void error({String text}) => FLToast.showError(text: text);
  static void showError(
          {String text,
          Duration showDuration,
          FLToastPosition position,
          FLToastStyle style,
          VoidCallback onClosed}) =>
      _showToast(text,
          showDuration: showDuration,
          position: position,
          style: style,
          type: _FLToastType.error,
          onClosed: onClosed);

  static void info({String text}) => FLToast.showInfo(text: text);
  static void showInfo(
          {String text,
          Duration showDuration,
          FLToastPosition position,
          FLToastStyle style,
          VoidCallback onClosed}) =>
      _showToast(text,
          showDuration: showDuration,
          position: position,
          style: style,
          type: _FLToastType.info,
          onClosed: onClosed);
}

LinkedHashMap<_FLToastProviderState, BuildContext> _contextMap =
    LinkedHashMap();
final _FLToastManager _toastManager = _FLToastManager._();
final EdgeInsetsGeometry _padding =
    const EdgeInsets.symmetric(horizontal: 20, vertical: 13);
final double _iconSize = 36.0;
final double _toastMarginHorizontal = 10;

enum _FLToastType { text, loading, success, error, info, custom }

Function _showToast(String text,
    {Duration showDuration,
    FLToastPosition position,
    FLToastStyle style,
    _FLToastType type,
    FLToastContentBuilder contentBuilder,
    VoidCallback onClosed}) {
  BuildContext context = _contextMap.values.first;
  OverlayEntry entry;
  FLToastDefaults defaults = _FLToastDefaultsWidget.of(context);

  position ??= defaults.position;
  style ??= defaults.style;
  Color color =
      (style == FLToastStyle.dark) ? defaults.darkColor : defaults.lightColor;
  Color backgroundColor = (style == FLToastStyle.dark)
      ? defaults.darkBackgroundColor
      : defaults.lightBackgroundColor;
  double backgroundOpacity = defaults.backgroundOpacity;
  double topOffset = defaults.topOffset;
  double bottomOffset = defaults.bottomOffset;
  showDuration ??= (type == _FLToastType.custom) ? null : defaults.showDuration;
  if (type == _FLToastType.loading)
    showDuration = null; //loading type no duration
  Widget slotWidget = _typeWidget(type, color);

  GlobalKey<_FLToastViewState> key = GlobalKey();

  _FLToastView toastView = _FLToastView(
    key: key,
    color: color,
    backgroundColor: backgroundColor,
    backgroundOpacity: backgroundOpacity,
    text: text,
    padding: _padding,
    showDuration: showDuration,
    slotWidget: slotWidget,
    slotBuilder: contentBuilder,
    canBeAutoClear: type != _FLToastType.loading,
    position: position,
    style: style,
    topOffset: topOffset,
    bottomOffset: bottomOffset,
    onClosed: onClosed,
  );
  entry = OverlayEntry(builder: (BuildContext context) => toastView);

  if (defaults.dismissOtherToast == true) {
    _toastManager.dismissAllToast(immediately: true);
  }

  Overlay.of(context).insert(entry);
  _toastManager.addToast(_FLToastPack(key: key, entry: entry));
  SemanticsService.tooltip(text);

  return () {
    key.currentState?._dismiss();
  };
}

class _FLToastPack {
  _FLToastPack({this.key, this.entry});

  final Key key;
  final OverlayEntry entry;
}

Widget _typeWidget(_FLToastType type, Color tintColor) {
  if (type == _FLToastType.loading) {
    return CircularProgressIndicator(
      strokeWidth: 3.0,
      valueColor: AlwaysStoppedAnimation(tintColor),
    );
  } else if (type == _FLToastType.success) {
    return Icon(
      Icons.check_circle_outline,
      size: _iconSize,
      color: tintColor,
    );
  } else if (type == _FLToastType.info) {
    return Icon(
      Icons.info_outline,
      size: _iconSize,
      color: tintColor,
    );
  } else if (type == _FLToastType.error) {
    return Icon(
      Icons.highlight_off,
      size: _iconSize,
      color: tintColor,
    );
  }
  return null;
}

class _FLToastManager {
  _FLToastManager._();

  Map<GlobalKey<_FLToastViewState>, _FLToastPack> _toastMap = Map();

  bool hasShowingToast() => _toastMap.length > 0;

  void dismissAllToast({bool immediately = false}) {
    if (_toastMap.length == 0) {
      return;
    }

    _toastMap.forEach((key, pack) {
      if (key.currentState != null && key.currentState._showing) {
        _FLToastView toastView = key.currentWidget;
        if (toastView.canBeAutoClear) {
          key.currentState._dismiss(immediately: immediately);
        }
      }
    });
  }

  void addToast(_FLToastPack pack) {
    _toastMap[pack.key] = pack;
  }

  void removeToast(Key key) {
    if (!_toastMap.containsKey(key)) {
      return;
    }

    _toastMap.remove(key);
  }

  void removeEntry(Key key) {
    if (!_toastMap.containsKey(key)) {
      return;
    }

    _FLToastPack pack = _toastMap[key];
    pack.entry?.remove();
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
  bool updateShouldNotify(_FLToastDefaultsWidget oldWidget) =>
      this.defaults != oldWidget.defaults;

  static FLToastDefaults of(BuildContext context) {
    _FLToastDefaultsWidget defaultsWidget = context
        .dependOnInheritedWidgetOfExactType(aspect: _FLToastDefaultsWidget);
    return defaultsWidget.defaults;
  }
}

class _FLToastView extends StatefulWidget {
  _FLToastView(
      {Key key,
      this.text,
      this.padding,
      this.slotWidget,
      this.slotBuilder,
      this.color,
      this.backgroundColor,
      this.backgroundOpacity,
      this.showDuration,
      this.canBeAutoClear = true,
      this.position,
      this.style,
      this.topOffset,
      this.bottomOffset,
      this.onClosed})
      : assert(slotWidget != null || text != null || slotBuilder != null),
        super(key: key);

  final String text;
  final EdgeInsetsGeometry padding;
  final Widget slotWidget;
  final FLToastContentBuilder slotBuilder;
  final Color color;
  final Color backgroundColor;
  final double backgroundOpacity;
  final Duration showDuration;
  final bool canBeAutoClear;
  final FLToastPosition position;
  final FLToastStyle style;
  final double topOffset;
  final double bottomOffset;
  final VoidCallback onClosed;

  @override
  State<_FLToastView> createState() => _FLToastViewState();
}

class _FLToastViewState extends State<_FLToastView>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  // duration follow tooltip
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  static const Duration _waitDuration = Duration(milliseconds: 0);
  AnimationController _controller;
  Timer _showTimer;
  Timer _hideTimer;
  bool _showing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: _fadeInDuration,
        reverseDuration: _fadeOutDuration,
        vsync: this)
      ..addStatusListener(_handleStatusChanged);
    WidgetsBinding.instance.addObserver(this);
    _show();
  }

  void _handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      _dismiss(immediately: true);
      if (widget.onClosed != null) {
        widget.onClosed();
      }
    }
  }

  void _dismiss({bool immediately = false}) {
    _showTimer?.cancel();
    _showTimer = null;
    if (immediately) {
      _toastManager.removeEntry(widget.key);
      _showing = false;
      return;
    }
    _controller.reverse();
  }

  void _show() {
    _hideTimer?.cancel();
    _hideTimer = null;
    _showTimer ??= Timer(_waitDuration, () {
      _showTimer?.cancel();
      _showTimer = null;
      _controller.forward();
      _showing = true;
      if (widget.showDuration != null) {
        _hideTimer = Timer(widget.showDuration, _dismiss);
      }
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {});
  }

  @override
  void deactivate() {
    if (_showing) {
      _dismiss(immediately: true);
    }
    _toastManager.removeToast(widget.key);
    super.deactivate();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _hideTimer = null;
    _showTimer?.cancel();
    _showTimer = null;
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQueryData.fromWindow(ui.window);
    final double marginTop = widget.topOffset + mediaQueryData.padding.top;
    final double marginBottom =
        widget.bottomOffset + mediaQueryData.padding.bottom;
    MainAxisAlignment alignment = MainAxisAlignment.center;
    if (widget.position == FLToastPosition.top)
      alignment = MainAxisAlignment.start;
    else if (widget.position == FLToastPosition.bottom)
      alignment = MainAxisAlignment.end;

    final List<Widget> children = <Widget>[];
    // add custom slot
    if (widget.slotWidget != null) {
      children.add(widget.slotWidget);
      if (widget.text != null) {
        children.add(SizedBox(height: 8.0));
      }
    }
    // custom slot builder
    if (widget.slotBuilder != null) {
      children.add(widget.slotBuilder(context));
      if (widget.text != null) {
        children.add(SizedBox(height: 8.0));
      }
    }
    // add text
    if (widget.text != null) {
      children.add(Text(widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: widget.color, fontSize: 17)));
    }

    return AbsorbPointer(
      child: FadeTransition(
        opacity: _controller,
        child: Column(
          mainAxisAlignment: alignment,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: marginTop,
                  bottom: marginBottom,
                  left: _toastMarginHorizontal,
                  right: _toastMarginHorizontal),
              decoration: BoxDecoration(
                  color: widget.backgroundColor
                      .withOpacity(widget.backgroundOpacity),
                  borderRadius: BorderRadius.circular(5.0)),
              padding: widget.padding,
              child: Column(mainAxisSize: MainAxisSize.min, children: children),
            ),
          ],
        ),
      ),
    );
  }
}
