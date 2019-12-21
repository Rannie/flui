import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

const double _kDefaultInputWidth = 50;
const double _kDefaultInputHeight = 35;
const double _kDefaultEleSize = 18;
const double _kDefaultButtonSize = 30;

const Color _kDefaultBackgroundColor = Color.fromRGBO(242, 243, 245, 1);

class FLCountStepper extends StatefulWidget {
  FLCountStepper({
    Key key,
    @required this.controller,
    this.onChanged,
    this.disabled = false,
    this.disableInput = true,
    this.inputWidth = _kDefaultInputWidth,
  }) : assert(controller != null),
       super(key: key);

  final FLCountStepperController controller;
  final ValueChanged<num> onChanged;
  /// disable step button
  final bool disabled;
  /// disable input
  final bool disableInput;
  final double inputWidth;

  @override
  State<FLCountStepper> createState() => _FLCountStepperState();
}

class _FLCountStepperState extends State<FLCountStepper> {
  FLCountStepperController _controller;
  TextEditingController _inputController = TextEditingController();
  bool _minusEnabled;
  bool _addEnabled;
  int _maxLength;

  @override
  void initState() {
    super.initState();
    _assembleCountStepper();
  }

  @override
  void didUpdateWidget(FLCountStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    _assembleCountStepper();
  }

  void _assembleCountStepper() {
    _controller = widget.controller;
    int number = _controller.value;
    _inputController.value = TextEditingValue(text: '$number');
    _minusEnabled =  !(widget.disabled || _controller.isMin());
    _addEnabled = !(widget.disabled || _controller.isMax());
  }

  void _onStepperValueChanged() {
    num number = _controller.number;
    _inputController.value = TextEditingValue(text: '$number');
  }

  void _handleMinusPressed() {
    _resignFocus();
    _syncValueAndInput();
    _controller.minus();
    _onStepperValueChanged();
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged(_controller.number);
    }
  }

  void _handleAddPressed() {
    _resignFocus();
    _syncValueAndInput();
    _controller.add();
    _onStepperValueChanged();
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged(_controller.number);
    }
  }

  void _syncValueAndInput() {
    if (_controller.value.compareTo(num.parse(_inputController.text)) != 0) {
      String text = _inputController.value.text;
      if (text == null || text.trim().length == 0) {
        num regVal = math.min(_controller.max, math.max(0, _controller.min));
        text = '$regVal';
      }
      _controller.number = num.parse(text);
    }
  }

  void _updateEnableStates() {
      setState(() {
        _minusEnabled = !_controller.isMin();
        _addEnabled = !_controller.isMax();
      });
  }

  void _resignFocus() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  void _handleInputComplete() {
    _resignFocus();
    _syncValueAndInput();

    num curValue = _controller.number;
    _inputController.value = TextEditingValue(text: '$curValue');
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged(_controller.number);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _maxLength = (widget.inputWidth/10).floor()-1;
    final ThemeData themeData = Theme.of(context);

    final Widget minusButton = Container(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Icon(Icons.remove, size: _kDefaultEleSize), //Text('-', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        textColor: themeData.primaryColor,
        onPressed: _minusEnabled ? _handleMinusPressed : null,
      ),
    );

    final Widget input = Container(
      width: widget.inputWidth,
      height: _kDefaultInputHeight,
      padding: EdgeInsets.only(left: 4), // resolve text center issue
      decoration: BoxDecoration(
        color: _kDefaultBackgroundColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextField(
        controller: _inputController,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(fontSize: 15),
        enabled: !widget.disableInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          WhitelistingTextInputFormatter(RegExp("[-0-9]")),
          LengthLimitingTextInputFormatter(_maxLength),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        ),
        onEditingComplete: _handleInputComplete,
      ),
    );

    final Widget addButton = Container(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: FlatButton(
        padding: EdgeInsets.zero,
        child: Icon(Icons.add, size: _kDefaultEleSize), //Text('+', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        textColor: themeData.primaryColor,
        onPressed: _addEnabled ? _handleAddPressed : null,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        minusButton,
        SizedBox(width: 3),
        input,
        SizedBox(width: 3),
        addButton
      ],
    );
  }
}

class FLCountStepperController extends ValueNotifier<int> {
  FLCountStepperController({
    this.defaultValue,
    this.min = -999,
    this.max = 9999,
    this.step = 1,
  }) : assert(min < max),
       super(defaultValue ?? min > 0 ? min : 0);

  final int defaultValue;
  final int min;
  final int max;
  final int step;

  num get number => value;
  set number(num newNum) {
    if (newNum > max) newNum = max;
    if (newNum < min) newNum = min;

    value = newNum;
  }

  bool isMin() {
    return number.compareTo(min) == 0;
  }

  bool isMax() {
    return number.compareTo(max) == 0;
  }

  void add() {
    number += step;
  }

  void minus() {
    number -= step;
  }

  void clear() {
    value = defaultValue;
  }
}
