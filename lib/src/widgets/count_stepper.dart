import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kDefaultInputWidth = 40;
const double _kDefaultFloatingTextWidth = 35;
const double _kDefaultInputHeight = 35;
const double _kDefaultEleSize = 18;
const double _kDefaultButtonSize = 30;
const double _kDefaultFloatingButtonSize = 25;
const double _kDefaultFontSize = 16;
const double _kDefaultFloatingSize = 17;

const Color _kDefaultBackgroundColor = Color.fromRGBO(242, 243, 245, 1);

class FLCountStepper extends StatefulWidget {
  FLCountStepper(
      {Key? key,
      required this.controller,
      this.onChanged,
      this.disabled = false,
      this.disableInput = true,
      this.inputWidth = _kDefaultInputWidth,
      this.actionColor,
      this.iconFontSize, this.textAndInputHeight,

      })
      : super(key: key);

  /// the controller of count values
  final FLCountStepperController controller;

  /// value changed callback
  final ValueChanged<num>? onChanged;

  /// disable step button
  final bool disabled;

  /// disable input, default is true
  final bool disableInput;

  /// the width of input, also related with TextField's max length
  final double inputWidth;

  /// default is Theme.of(context).primaryColor
  final Color? actionColor;

  /// 图标icon的字体大小
  final double? iconFontSize;

  /// 文本显示的高度和输入框的高度
  final double? textAndInputHeight;

  @override
  State<FLCountStepper> createState() => _FLCountStepperState();
}

class _FLCountStepperState extends State<FLCountStepper> {
  late FLCountStepperController _controller;
  final TextEditingController _inputController = TextEditingController();
  late bool _minusEnabled;
  late bool _addEnabled;
  int? _maxLength;

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
    int? number = _controller.value;
    _inputController.value = TextEditingValue(text: '$number');
    _minusEnabled = !(widget.disabled || _controller.isMin());
    _addEnabled = !(widget.disabled || _controller.isMax());

    _controller.addListener(_onStepperValueChanged);
  }

  void _onStepperValueChanged() {
    num number = _controller.number;
    _inputController.value = TextEditingValue(text: '$number');
  }

  void _handleMinusPressed() {
    _resignFocus();
    _syncValueAndInput();
    _controller.minus();
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged!(_controller.number);
    }
  }

  void _handleAddPressed() {
    _resignFocus();
    _syncValueAndInput();
    _controller.add();
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged!(_controller.number);
    }
  }

  void _syncValueAndInput() {
    String text = _inputController.value.text;
    if (text.trim().length == 0) {
      num regVal = math.min(_controller.max, math.max(0, _controller.min));
      text = '$regVal';
    }

    if (_controller.value!.compareTo(num.parse(text)) != 0) {
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
      widget.onChanged!(_controller.number);
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
    _maxLength = (widget.inputWidth / 10).floor() - 1;
    final ThemeData themeData = Theme.of(context);
    final Brightness brightness = themeData.brightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final Color buttonIconColor =
        widget.actionColor ?? (isDarkMode ? Colors.white : themeData.primaryColor);
    final Color inputBackgroundColor = isDarkMode ? Colors.transparent : _kDefaultBackgroundColor;

    final Widget minusButton = Container(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle: MaterialStateProperty.all(TextStyle(color: buttonIconColor))),
        child: Icon(Icons.remove, size: widget.iconFontSize ?? _kDefaultEleSize),
        //Text('-', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        onPressed: _minusEnabled ? _handleMinusPressed : null,
      ),
    );

    final Widget input = Container(
      width: widget.inputWidth,
      height:widget.textAndInputHeight ?? _kDefaultInputHeight,
      padding: EdgeInsets.only(left: 3),
      // resolve text center issue
      decoration: BoxDecoration(
        color: inputBackgroundColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextField(
        controller: _inputController,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(fontSize: _kDefaultFontSize),
        enabled: !widget.disableInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[-0-9]")),
          LengthLimitingTextInputFormatter(_maxLength),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        ),
        onEditingComplete: _handleInputComplete,
      ),
    );

    final Widget addButton = Container(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle: MaterialStateProperty.all(TextStyle(color: buttonIconColor))),
        child: Icon(Icons.add, size: widget.iconFontSize ?? _kDefaultEleSize),
        //Text('+', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        onPressed: _addEnabled ? _handleAddPressed : null,
      ),
    );

    final double inset = 3;
    return Container(
      width: 2 * (_kDefaultButtonSize + inset) + widget.inputWidth,
      height: widget.textAndInputHeight ?? _kDefaultInputHeight,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: ((widget.textAndInputHeight ?? _kDefaultInputHeight) - _kDefaultButtonSize) / 2,
            child: minusButton,
          ),
          Positioned(
            top: 0,
            left: _kDefaultButtonSize + inset,
            child: input,
          ),
          Positioned(
            left: _kDefaultButtonSize + widget.inputWidth + 2 * inset,
            top: ((widget.textAndInputHeight ?? _kDefaultInputHeight) - _kDefaultButtonSize) / 2,
            child: addButton,
          )
        ],
      ),
    );
  }
}

class _FLFloatingAnimationWrapper extends StatefulWidget {
  _FLFloatingAnimationWrapper({
    Key? key,
    required this.controller,
    required this.child,
    this.marginLeft = 0,
    this.targetLeft = 0,
    this.marginTop = 0,
    this.width,
    this.height,
  }) : super(key: key);

  final Animation<double>? controller;
  final double marginLeft;
  final double targetLeft;
  final double marginTop;
  final double? width;
  final double? height;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _FLFloatingAnimationWrapperState();
}

class _FLFloatingAnimationWrapperState extends State<_FLFloatingAnimationWrapper> {
  late Animation<double> rotateAnim;
  late Animation<double> transRightAnim;

  @override
  void initState() {
    super.initState();
    rotateAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(widget.controller!);

    transRightAnim = Tween<double>(
      begin: widget.marginLeft,
      end: widget.targetLeft,
    ).animate(widget.controller!);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
            top: widget.marginTop,
            left: transRightAnim.value,
            child: RotationTransition(
              turns: rotateAnim,
              child: Container(
                width: widget.width,
                height: widget.height,
                child: child,
              ),
            ));
      },
    );
  }
}

/// In FLFloatingCountStepper, the controller's min value must be 0,
/// so it can hide minus button and value label.
/// FLFloatingCountStepper can't edit input value.
class FLFloatingCountStepper extends StatefulWidget {
  FLFloatingCountStepper({
    Key? key,
    required this.controller,
    this.onChanged,
    this.disabled = false,
    this.labelWidth = _kDefaultFloatingTextWidth,
    this.labelTextStyle,
    this.actionColor,
  })  : assert(controller.min == 0),
        super(key: key);

  /// the controller of count values
  final FLCountStepperController controller;

  /// value changed callback
  final ValueChanged<num>? onChanged;

  /// disable step button
  final bool disabled;

  /// the width of text, also related with TextField's max length
  final double labelWidth;

  /// the style of text
  final TextStyle? labelTextStyle;

  /// default is Theme.of(context).primaryColor
  final Color? actionColor;

  @override
  State<FLFloatingCountStepper> createState() => _FLFloatingCountStepperState();
}

class _FLFloatingCountStepperState extends State<FLFloatingCountStepper>
    with TickerProviderStateMixin {
  late FLCountStepperController _controller;
  final TextEditingController _inputController = TextEditingController();
  late bool _minusEnabled;
  late bool _addEnabled;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    // setup count step controllers
    _assembleCountStepper();
    // setup animation controller
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  void didUpdateWidget(FLFloatingCountStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    _assembleCountStepper();
  }

  void _assembleCountStepper() {
    _controller = widget.controller;
    int? number = _controller.value;
    _inputController.value = TextEditingValue(text: '$number');
    _minusEnabled = !(widget.disabled || _controller.isMin());
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

    if (_controller.isMin()) {
      _reversMinusAnim();
    }

    if (widget.onChanged != null) {
      widget.onChanged!(_controller.number);
    }
  }

  void _handleAddPressed() {
    if (_controller.isMin()) {
      _playMinusAnim();
    }

    _resignFocus();
    _syncValueAndInput();
    _controller.add();
    _onStepperValueChanged();
    _updateEnableStates();

    if (widget.onChanged != null) {
      widget.onChanged!(_controller.number);
    }
  }

  void _syncValueAndInput() {
    if (_controller.value!.compareTo(num.parse(_inputController.text)) != 0) {
      String text = _inputController.value.text;
      if (text.trim().length == 0) {
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

  Future<Null> _playMinusAnim() async {
    try {
      await _animationController!.forward().orCancel;
    } on TickerCanceled {}
  }

  Future<Null> _reversMinusAnim() async {
    try {
      await _animationController!.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    _controller.dispose();
    _inputController.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Color tintColor = widget.actionColor ?? themeData.primaryColor;
    final double inset = 3;

    final Widget minusButtonWrapper = _FLFloatingAnimationWrapper(
      marginTop: (_kDefaultInputHeight - _kDefaultFloatingButtonSize) / 2,
      marginLeft: widget.labelWidth + _kDefaultFloatingButtonSize + inset * 2,
      width: _kDefaultFloatingButtonSize,
      height: _kDefaultFloatingButtonSize,
      controller: _animationController,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(CircleBorder(side: BorderSide(color: tintColor)))
        ),
        child: Icon(Icons.remove, size: _kDefaultEleSize, color: tintColor),
        onPressed: _minusEnabled ? _handleMinusPressed : null,
      ),
    );

    final Widget label = _FLFloatingAnimationWrapper(
        marginTop: 0,
        targetLeft: _kDefaultFloatingButtonSize + inset,
        marginLeft: widget.labelWidth + _kDefaultFloatingButtonSize + inset * 2,
        width: widget.labelWidth,
        height: _kDefaultInputHeight,
        controller: _animationController,
        child: Center(
          child: Text(
            _inputController.value.text,
            style: widget.labelTextStyle ?? TextStyle(fontSize: _kDefaultFloatingSize),
          ),
        ));

    final Widget addButton = Container(
      width: _kDefaultFloatingButtonSize,
      height: _kDefaultFloatingButtonSize,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(CircleBorder()),
          backgroundColor: MaterialStateProperty.all(tintColor)
        ),
        child: Icon(Icons.add, size: _kDefaultEleSize, color: Colors.white),
        onPressed: _addEnabled ? _handleAddPressed : null,
      ),
    );

    return Container(
      width: 2 * (_kDefaultFloatingButtonSize + inset) + widget.labelWidth,
      height: _kDefaultInputHeight,
      child: Stack(
        children: <Widget>[
          minusButtonWrapper,
          label,
          Positioned(
            left: _kDefaultFloatingButtonSize + widget.labelWidth + 2 * inset,
            top: (_kDefaultInputHeight - _kDefaultFloatingButtonSize) / 2,
            child: addButton,
          )
        ],
      ),
    );
  }
}

class FLCountStepperController extends ValueNotifier<int?> {
  FLCountStepperController({
    this.defaultValue,
    this.min = 0,
    this.max = 999,
    this.step = 1,
  })  : assert(min < max),
        super(defaultValue ?? (min > 0 ? min : 0));

  final int? defaultValue;
  final int min;
  final int max;
  final int step;

  num get number => value!;

  set number(num newNum) {
    if (newNum > max) newNum = max;
    if (newNum < min) newNum = min;

    value = newNum as int;
  }

  bool isMin() {
    return number == min;
  }

  bool isMax() {
    return number == max;
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
