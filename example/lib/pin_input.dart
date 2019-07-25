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
    this.textStyle,
    this.autofocus = false,
    this.obscure = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.boxWidth,
    this.boxHeight,
    this.minSpace
  }) : assert(pinLength > 0),
       super(key : key);

  final int pinLength;
  final FLPinEditController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextStyle textStyle;
  final bool autofocus;
  final bool obscure;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
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
      textEditingController.addListener(_popText);
      _editingControllerList.add(textEditingController);
    }
  }

  String _fullText() {
    String text = '';
    _editingControllerList.forEach((TextEditingController controller) {
      text += controller.text ?? '';
    });
    return text;
  }

  void _popText() {
    String totalText = _fullText();
    _effectiveController.text = totalText;
    widget.onChanged?.call(totalText);
  }

  void _uninstallEditControllers() {
    _editingControllerList.forEach((TextEditingController controller) {
      controller.removeListener(_popText);
      controller.dispose();
    });
    _editingControllerList.clear();
  }

  void _assembleFocusNodes() {
    _uninstallFocusNodes();
    for (int index = 0; index < widget.pinLength; index++) {
      FocusNode focusNode = FocusNode();
      focusNode.addListener(_checkFocusStatus);
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
    _focusNodeList.clear();
  }

  void _moveNext(int index) {
    if (index < widget.pinLength - 1) {
      FocusNode nextFocusNode = _focusNodeList[++index];
      nextFocusNode.requestFocus();
    } else {
      _focusNodeList[index].unfocus();
      widget.onEditingComplete?.call();
      widget.onSubmitted?.call(_fullText());
    }
  }

  void _movePrevious(int index) {
    if (index > 0) {
      FocusNode previousNode = _focusNodeList[--index];
      previousNode.requestFocus();
    } else {
      _focusNodeList[0].unfocus();
      widget.onEditingComplete?.call();
    }
  }

  @override
  void dispose() {
    _uninstallEditControllers();
    _uninstallFocusNodes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];
    for(int i = 0; i < widget.pinLength; i++) {
      FocusNode focusNode = _focusNodeList[i];
      TextEditingController editingController = _editingControllerList[i];
      children.add(Container(
          width: widget.boxWidth,
          height: widget.boxHeight,
          child: _FLTraceDeleteTextField(
            focusNode: focusNode,
            controller: editingController,
            decoration: widget.decoration,
            textInputAction: (i != widget.pinLength - 1) ? TextInputAction.next : TextInputAction.done,
            keyboardType: TextInputType.number,
            textStyle: widget.textStyle,
            textAlign: TextAlign.center,
            autofocus: (i == 0) ? widget.autofocus : false,
            obscure: widget.obscure,
            onChanged: (String text) {
              if (text.length == 1) {
                _moveNext(i);
              }
            },
            onSubmitted: (String text) {
              _moveNext(i);
            },
            onDeleted: () {
              _movePrevious(i);
            },
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

class _FLTraceDeleteTextField extends StatefulWidget {
  _FLTraceDeleteTextField({
    Key key,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textStyle,
    this.textAlign,
    this.autofocus,
    this.obscure,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onDeleted,
    this.inputFormatters,
    this.enabled
  }): super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscure;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onDeleted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;

  @override
  State<_FLTraceDeleteTextField> createState() => _FLTraceDeleteTextFieldState();
}

class _FLTraceDeleteTextFieldState extends State<_FLTraceDeleteTextField> {
  FocusNode get _effectiveFocusNode => widget.focusNode;
  TextEditingController _controller = TextEditingController();
  final String _sign = '.';
  final String _nullString = '';

  bool _flag = true;
  bool get _userValue => _flag;
  set _userValue(bool value) {
    if (_flag != value) {
      setState(() {
        _flag = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(() {
      if (_effectiveFocusNode.hasFocus) {
        if (_userValue)
          _userValue = false;

        widget.controller.text = _nullString;
        _controller.text = _sign;
        widget.onChanged?.call(_nullString);
      }
    });
  }

  bool _validPopText() {
    if (_controller.text != _sign) {
      return true;
    }
    return false;
  }

  void _setText(String text) {
    _controller.text = text;
    widget.controller.text = text;
  }

  @override
  void dispose() {
    _effectiveFocusNode?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = !_userValue ? TextStyle(color: Colors.transparent) : widget.textStyle;
    List<TextInputFormatter> formatterList = widget.inputFormatters ?? <TextInputFormatter>[];
    formatterList.add(LengthLimitingTextInputFormatter(2));
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: textStyle,
      autofocus: widget.autofocus,
      obscureText: widget.obscure,
      textAlign: widget.textAlign,
      inputFormatters: formatterList,
      showCursor: false,
      onChanged: (text) {
        if (text.startsWith(_sign)) {
          String newText = _controller.text[1];
          _setText(newText);
          _userValue = true;
          widget.onChanged?.call(newText);
        } else {
          if (text.isEmpty) {
            _setText(_nullString);
            _userValue = false;
            widget.onDeleted?.call();
          } else {
            _setText(_nullString);
            _userValue = true;
            widget.onChanged?.call(text);
          }
        }
      },
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: (text) {
        if (_validPopText()) {
          widget.onSubmitted(text);
        } else {
          widget.onSubmitted(_nullString);
        }
      },
      enabled: widget.enabled,
    );
  }
}