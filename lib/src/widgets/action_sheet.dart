import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Translucent, very light gray that is painted on top of the blurred backdrop
// as the action sheet's background color.
// TODO(LongCatIsLooong): https://github.com/flutter/flutter/issues/39272. Use
// System Materials once we have them.
// Extracted from https://developer.apple.com/design/resources/.
const Color _kBackgroundColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xC7F9F9F9),
  darkColor: Color(0xC7252525),
);

const Color _kCancelPressedColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFECECEC),
  darkColor: Color(0xFF49494B),
);

const double _kEdgeHorizontalPadding = 8.0;
const double _kEdgeVerticalPadding = 10.0;
const double _kCancelButtonPadding = 8.0;
const double _kCornerRadius = 14.0;

enum FLCupertinoActionSheetStyle { roundedCard, filled }

/// Don't use [showCupertinoModalPopup], in iOS it will blur the content,
/// related issue: https://bugs.chromium.org/p/skia/issues/detail?id=7898
Future<T> showFLBottomSheet<T>(
    {@required BuildContext context, @required WidgetBuilder builder}) {
  return showModalBottomSheet(
      context: context, builder: builder, backgroundColor: Colors.transparent);
}

class FLCupertinoActionSheet extends StatelessWidget {
  FLCupertinoActionSheet(
      {Key key,
      this.backgroundColor,
      this.style = FLCupertinoActionSheetStyle.roundedCard,
      this.borderRadius,
      @required this.child,
      this.cancelButton})
      : assert(child != null),
        super(key: key);

  final Color backgroundColor;
  final Widget child;

  /// Customized border radius, both two styles use this value first.
  final BorderRadius borderRadius;

  /// The style of the action sheet, currently support
  /// [FLCupertinoActionSheetStyle.roundedCard] & [FLCupertinoActionSheetStyle.filled].
  /// Default value is [FLCupertinoActionSheetStyle.roundedCard], like iOS style.
  final FLCupertinoActionSheetStyle style;

  /// The optional cancel button that is grouped separately from the other
  /// actions.
  ///
  /// Typically this is an [CupertinoActionSheetAction] widget.
  final CupertinoActionSheetAction cancelButton;

  bool _isRound() {
    return style == FLCupertinoActionSheetStyle.roundedCard;
  }

  Widget _wrapWithBackground({
    Color backgroundColor,
    Widget child,
    bool updateSystemUiOverlay = true,
  }) {
    Widget result = child;
    if (updateSystemUiOverlay) {
      final bool darkBackground = backgroundColor.computeLuminance() < 0.179;
      final SystemUiOverlayStyle overlayStyle = darkBackground
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
      result = AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        sized: true,
        child: result,
      );
    }
    final DecoratedBox childWithBackground = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: result,
    );

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: childWithBackground,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    BorderRadius radius = this.borderRadius ??
        (_isRound() ? BorderRadius.circular(_kCornerRadius) : null);
    final Widget blurContent = _wrapWithBackground(
        backgroundColor:
            CupertinoDynamicColor.resolve(backgroundColor ?? _kBackgroundColor, context),
        updateSystemUiOverlay: true,
        child: CupertinoScrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[Flexible(child: child)],
            ),
          ),
        ));

    final Widget mainChild = _isRound()
        ? ClipRRect(
            borderRadius: radius,
            child: blurContent,
          )
        : ClipRect(
            child: blurContent,
          );

    return Flexible(
      child: mainChild,
    );
  }

  Widget _buildCancelButton() {
    double top = _isRound() ? _kCancelButtonPadding : 0;
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: _FLCupertinoActionSheetCancelButton(
        isRound: _isRound(),
        child: cancelButton,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin = _isRound()
        ? EdgeInsets.symmetric(
            horizontal: _kEdgeHorizontalPadding,
            vertical: _kEdgeVerticalPadding)
        : EdgeInsets.only(top: _kEdgeVerticalPadding);
    List<Widget> children = <Widget>[];
    children.add(_buildMainContent(context));

    if (cancelButton != null) children.add(_buildCancelButton());

    final Orientation orientation = MediaQuery.of(context).orientation;
    double preferWidth;
    if (orientation == Orientation.portrait) {
      preferWidth = MediaQuery.of(context).size.width - margin.horizontal;
    } else {
      preferWidth = MediaQuery.of(context).size.height - margin.horizontal;
    }

    return SafeArea(
      child: Semantics(
        namesRoute: true,
        scopesRoute: true,
        explicitChildNodes: true,
        label: 'Alert',
        child: Container(
            width: preferWidth,
            margin: margin,
            child: Column(
              children: children,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            )),
      ),
    );
  }
}

class _FLCupertinoActionSheetCancelButton extends StatefulWidget {
  const _FLCupertinoActionSheetCancelButton(
      {Key key, this.child, this.isRound = true})
      : super(key: key);

  final Widget child;
  final bool isRound;

  @override
  _FLCupertinoActionSheetCancelButtonState createState() =>
      _FLCupertinoActionSheetCancelButtonState();
}

class _FLCupertinoActionSheetCancelButtonState
    extends State<_FLCupertinoActionSheetCancelButton> {
  CupertinoDynamicColor _backgroundColor;

  @override
  void initState() {
    _backgroundColor = CupertinoColors.secondarySystemGroupedBackground;
    super.initState();
  }

  void _onTapDown(TapDownDetails event) {
    setState(() {
      _backgroundColor =
          CupertinoDynamicColor.resolve(_kCancelPressedColor, context);
    });
  }

  void _onTapUp(TapUpDetails event) {
    setState(() {
      _backgroundColor =
          CupertinoDynamicColor.resolve(_backgroundColor, context);
    });
  }

  void _onTapCancel() {
    setState(() {
      _backgroundColor =
          CupertinoDynamicColor.resolve(_backgroundColor, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius =
        widget.isRound ? BorderRadius.circular(_kCornerRadius) : null;
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(_backgroundColor, context),
          borderRadius: borderRadius,
        ),
        child: widget.child,
      ),
    );
  }
}
