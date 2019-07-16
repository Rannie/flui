import 'dart:collection';

import 'package:example/main.dart';
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

class FLToast {
  static void loading(String text) => FLToast.showLoading(text);
  static void showLoading(String text,
      { FLToastPosition position, FLToastStyle style }) {

  }

  static void text(String text) => FLToast.showText(text);
  static void showText(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) {

  }

  static void success(String text) => FLToast.showSuccess(text);
  static void showSuccess(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) {

  }

  static void error(String text) => FLToast.showError(text);
  static void showError(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) {

  }

  static void info(String text) => FLToast.showInfo(text);
  static void showInfo(String text,
      { Duration showDuration, FLToastPosition position, FLToastStyle style }) {

  }
}

LinkedHashMap<_FLToastProviderState, BuildContext> _contextMap = LinkedHashMap();

class FLToastDefaults {
  const FLToastDefaults({
    this.showDuration = const Duration(milliseconds: 1500),
    this.darkColor = Colors.white,
    this.darkBackgroundColor = Colors.black87,
    this.lightColor = Colors.black12,
    this.position = FLToastPosition.center,
    this.style = FLToastStyle.dark,
    this.dismissOtherToast = true
  });

  final Duration showDuration;
  final Color darkColor; // include text & icon
  final Color darkBackgroundColor;
  final Color lightColor; // include text & icon
  final FLToastPosition position;
  final FLToastStyle style;
  final bool dismissOtherToast;
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
    // TODO: ask manager to check dismiss or not.
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
      child: container,
    );
  }
}

//class _FLToastProviderState extends State<FLToastProvider> with SingleTickerProviderStateMixin {
//  static const EdgeInsetsGeometry _padding = EdgeInsets.symmetric(horizontal: 16.0);
//  static const Duration _fadeInDuration = Duration(milliseconds: 150);
//  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
//
//  AnimationController _controller;
//  OverlayEntry _overlayEntry;
//  Timer _hideTimer;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: _fadeInDuration,
//      reverseDuration: _fadeOutDuration,
//      vsync: this,
//    )
//    ..addStatusListener(_handleStatusChanged);
//    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
//
//    Future.delayed(Duration(seconds: 5), _showToast);
//  }
//
//  void _handleStatusChanged(AnimationStatus status) {
//    if (status == AnimationStatus.dismissed) {
//      _hideToast(immediately: true);
//    }
//  }
//
//  void _handlePointerEvent(PointerEvent event) {
//    logger.d('pointer event');
//    logger.d(event);
//
//    if (_overlayEntry == null) {
//      return;
//    }
//
//    if (event is PointerUpEvent
//        || event is PointerCancelEvent
//        || event is PointerDownEvent) {
//      _hideToast();
//    }
//  }
//
//  void _hideToast({ bool immediately = false }) {
//    if (immediately) {
//      _removeEntry();
//      return;
//    }
//    _hideTimer ??= Timer(widget.defaults.showDuration, _controller.reverse);
//  }
//
//  void _showToast() {
//    _hideTimer?.cancel();
//    _hideTimer = null;
//    _ensureToastVisible();
//  }
//
//  bool _ensureToastVisible() {
//    if (_overlayEntry != null) {
//      _hideTimer?.cancel();
//      _hideTimer = null;
//      _controller.forward();
//      return false;
//    }
//    _createNewEntry();
//    _controller.forward();
//    return true;
//  }
//
//  void _createNewEntry() {
//    final Widget overlay = _FLToastView(
//      text: 'nihao',
//      padding: _padding,
//      animation: CurvedAnimation(
//        parent: _controller,
//        curve: Curves.fastOutSlowIn
//      ),
//    );
//
//    _overlayEntry = OverlayEntry(builder: (BuildContext context) {
//      return overlay;
//    });
//    Overlay.of(context).insert(_overlayEntry);
//    SemanticsService.tooltip('nihao');
//  }
//
//  void _removeEntry() {
//    _hideTimer?.cancel();
//    _hideTimer = null;
//    _overlayEntry?.remove();
//    _overlayEntry = null;
//  }
//
//  @override
//  void deactivate() {
//    if (_overlayEntry != null) {
//      _hideToast(immediately: true);
//    }
//    super.deactivate();
//  }
//
//  @override
//  void dispose() {
//    _toastProviderContext = null;
//    GestureBinding.instance.pointerRouter.removeGlobalRoute(_handlePointerEvent);
//    if (_overlayEntry != null)
//      _removeEntry();
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    _toastProviderContext = context;
//    return widget.child;
//  }
//}

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

class _FLToastView extends StatelessWidget {
  _FLToastView({
    Key key,
    this.text,
    this.padding,
    this.animation,
    this.slotWidget
  });

  final String text;
  final EdgeInsetsGeometry padding;
  final CurvedAnimation animation;
  final Widget slotWidget;

  @override
  Widget build(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    logger.d(box);
    final Offset target = box.localToGlobal(box.size.center(Offset.zero));
    final FLToastDefaults defaults = _FLToastDefaultsWidget.of(context);

    return Positioned.fill(
        child: IgnorePointer(
          child: CustomSingleChildLayout(
            delegate: _FLToastPositionDelegate(target: target),
            child: FadeTransition(
              opacity: animation,
              child: Container(
                decoration: BoxDecoration(
                  color: defaults.darkBackgroundColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(4.0)
                ),
                padding: padding,
                child: Center(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: Text(text, style: TextStyle(color: defaults.darkColor))
                ),
              ),
            ),
          ),
        ));
  }
}

class _FLToastPositionDelegate extends SingleChildLayoutDelegate {
  _FLToastPositionDelegate({
    @required this.target,
  });

  final Offset target;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) => constraints.loosen();

  @override
  bool shouldRelayout(_FLToastPositionDelegate oldDelegate) {
    return target != oldDelegate.target;
  }
}