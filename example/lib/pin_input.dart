import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// detect backspace related issue: https://github.com/flutter/flutter/issues/14809
class FLPinEditController extends TextEditingController {
  FLPinEditController.fromValue(String text) : super(text: text);
  FLPinEditController({ String text }) : super(text : text);
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
  }) : assert(pinLength > 0),
       super(key : key);

  final int pinLength;
  final FLPinEditController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
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
  final Radius cursorRadius;
  final Color cursorColor;
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

  List<TextEditingController> _editingControllerList = <TextEditingController>[];
  List<FocusNode> _focusNodeList = <FocusNode>[];
  
  @override
  void initState() {
    super.initState();
    if (widget.controller == null)
      _controller = FLPinEditController();
    _assembleEditControllers();
    _assembleFocusNodes();
  }
  
  @override
  void didUpdateWidget(FLPinCodeTextField oldWidget) {
    if (widget.controller == null && oldWidget.controller != null)
      _controller = FLPinEditController.fromValue(oldWidget.controller.text);
    else if (widget.controller != null && oldWidget.controller == null) {
      _controller = null;
    }

    final bool isEnabled = widget.enabled ?? widget.decoration?.enabled ?? true;
    final bool wasEnabled = oldWidget.enabled ?? oldWidget.decoration?.enabled ?? true;
    if (wasEnabled && !isEnabled) {
      _unfocus();
    }

    if (widget.pinLength != oldWidget.pinLength) {
      _assembleEditControllers();
      _assembleFocusNodes();
    }
    super.didUpdateWidget(oldWidget);
  }

  void _unfocus() {
    _focusNodeList.forEach((FocusNode focusNode) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
      }
    });
    _effectiveFocusNode.unfocus();
  }

  void _assembleEditControllers() {
    _uninstallEditControllers();
    for (int index = 0; index < widget.pinLength; index++) {
      TextEditingController textEditingController = TextEditingController();
//      textEditingController.addListener(() {
//        print('$index -- edit controller -- ${textEditingController.text}');
//      });
      _editingControllerList.add(textEditingController);
    }
  }

  void _uninstallEditControllers() {
    _editingControllerList.forEach((TextEditingController controller) {
      controller.dispose();
    });
    _editingControllerList.clear();
  }

  void _assembleFocusNodes() {
    _uninstallFocusNodes();
    for (int index = 0; index < widget.pinLength; index++) {
      FocusNode focusNode = FocusNode();
      focusNode.addListener(() {
        print('$index -- focus node -- ${focusNode.hasFocus}');
        _checkFocusStatus();
      });
      _focusNodeList.add(focusNode);
    }
  }

  void _checkFocusStatus() {
    bool hasFocus = false;
    _focusNodeList.forEach((FocusNode focusNode) {
      hasFocus |= focusNode.hasFocus;
    });

    if (hasFocus && !_effectiveFocusNode.hasFocus) {
      _effectiveFocusNode.requestFocus();
    } else if (!hasFocus && _effectiveFocusNode.hasFocus) {
      _effectiveFocusNode.unfocus();
    }
  }

  void _uninstallFocusNodes() {
    _focusNodeList.forEach((FocusNode focusNode) {
      focusNode.dispose();
    });
    _focusNodeList.clear();
  }

  void _moveNext(int index) {
    print('next');
    if (index < widget.pinLength - 1) {
      FocusNode nextFocusNode = _focusNodeList[++index];
      nextFocusNode.requestFocus();
    }
  }

  void _movePrevious(int index) {
    print('previous');
    if (index > 0) {
      FocusNode previousNode = _focusNodeList[--index];
      previousNode.requestFocus();
    }
  }

  @override
  void dispose() {
    _uninstallFocusNodes();
    _uninstallEditControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    for(int i = 0; i < widget.pinLength; i++) {
      FocusNode focusNode = _focusNodeList[i];
      TextEditingController editingController = _editingControllerList[i];
      List<TextInputFormatter> formatterList = widget.inputFormatters ?? <TextInputFormatter>[];
      formatterList.add(LengthLimitingTextInputFormatter(1));
      children.add(Container(
          width: widget.boxWidth,
          height: widget.boxHeight,
          child: TextField(
            focusNode: focusNode,
            controller: editingController,
            decoration: widget.decoration,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            style: widget.textStyle,
            textAlign: TextAlign.center,
            autofocus: (i > 0) ? widget.autofocus : false,
            obscureText: widget.obscure,
            showCursor: widget.showCursor,
            onChanged: (String text) {
              print('change text -- $i -- $text');
              if (text.length == 1) {
                _moveNext(i);
              } else {
                _movePrevious(i);
              }
            },
            onEditingComplete: () {
              print('edit complete -- $i');
            },
            onSubmitted: (String text) {
              print('submit -- $i -- $text');
            },
            inputFormatters: formatterList, // TODO: check all, not each single field
            cursorColor: widget.cursorColor,
            cursorRadius: widget.cursorRadius,
            cursorWidth: widget.cursorWidth,
          ),
        ),
      );
      if (i != widget.pinLength - 1) {
        children.add(SizedBox(
          width: widget.minSpace ?? 8,
        ));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }
}