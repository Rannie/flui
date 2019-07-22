import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FLPinEditController extends TextEditingController {

}

class FLPinBoxDecoration {
  FLPinBoxDecoration({
    this.radius = const Radius.circular(2),
    this.strokeWidth = 2.0,
    this.solidColor,
    this.enteredColor
  });

  final Radius radius;
  final double strokeWidth;
  final Color solidColor;
  final Color enteredColor;
}

class FLPinCodeTextField extends StatefulWidget {
  FLPinCodeTextField({
    Key key,
    this.pinLength = 6,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.autofocus = false,
    this.obscure = false,
    this.showCursor = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.boxWidth,
    this.boxHeight,
    this.minSpace
  }) : super(key : key);

  final int pinLength;
  final FLPinEditController controller;
  final FocusNode focusNode;
  final FLPinBoxDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle textStyle;
  final bool autofocus;
  final bool obscure;
  final bool showCursor;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final double cursorRadius;
  final double cursorColor;
  final double boxWidth;
  final double boxHeight;
  final double minSpace;

  @override
  State<FLPinCodeTextField> createState() => _FLPinCodeTextFieldState();
}

class _FLPinCodeTextFieldState extends State<FLPinCodeTextField> {

  FLPinEditController _controller;
  FLPinEditController get _effectiveController => widget.controller ?? _controller;

  FocusNode _focusNode;
  FocusNode get _effectiveFocusNode => widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}