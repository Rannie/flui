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

///是否执行数量更改,数量拦截器,当返回false的时候,则不执行数量修改,true则执行数量更改
///当返回false的时候,不会进入onChanged回调
///[value] - 将要修改的数量
///[actionType] - 操作类型,有三种 [CountStepperActionType] ,加,减,自定义输入
typedef DoChangeInterceptor = bool Function(int value,CountStepperActionType actionType);

///焦点回调
/// [hasFocus] - 是否存在焦点
/// [value] - 编辑框里面当前的值
typedef FocusNodeHandle = void Function(bool hasFocus, int value, FocusNode focusNode, TextEditingController controller);

/// 自定义渲染组件
/// [callMethod] - 点击回调事件
typedef CustomButtonRender = Widget Function(Function callMethod);

///值改变回调
typedef ValueChangeHandle = void Function(int value, TextEditingController controller);

///[FocusNode]的添加和删除的回调事件
typedef FocusNodeEvent = void Function(bool isRemove,FocusNode focusNode);

class FLCountStepper<T> extends StatefulWidget {
  const FLCountStepper(
      {Key? key,
      required this.controller,
      this.onChanged,
      this.disabled = false,
      this.disableInput = true,
      this.inputWidth = _kDefaultInputWidth,
      this.actionColor,
      this.iconFontSize,
      this.textAndInputHeight,
      this.inputOnTap,
      this.focusNodeHandle,
      this.onChangeWithInput,
      this.minButtonRender,
      this.addButtonRender,
      this.initValue,
      this.valueInterceptor,
      this.loggerLevel = CountStepperLoggerLevel.enable,required this.value,this.focusNodeEvent})
      : super(key: key);

  /// the controller of count values
  final FLCountStepperController controller;

  /// value changed callback
  final ValueChanged<num>? onChanged;

  /// 当输入框的数字被改变时
  final ValueChangeHandle? onChangeWithInput;

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

  ///初始值
  final String? initValue;

  /// 输入框被点击的回调
  final ValueChanged<TextEditingController>? inputOnTap;

  ///当输入框失去或者获得焦点事件
  final FocusNodeHandle? focusNodeHandle;

  ///加购自定义渲染button
  final CustomButtonRender? addButtonRender;

  //减购自定义button
  final CustomButtonRender? minButtonRender;

  //更新拦截器
  final DoChangeInterceptor? valueInterceptor;

  //开启日志设置
  final CountStepperLoggerLevel? loggerLevel;

  ///item的值,也可以理解为模型
  final T value;

  final FocusNodeEvent? focusNodeEvent;

  @override
  State<FLCountStepper> createState() => _FLCountStepperState();
}

class _FLCountStepperState extends State<FLCountStepper> {
  late FLCountStepperController _controller;
  final TextEditingController _inputController = TextEditingController();
  late bool _minusEnabled;
  late bool _addEnabled;
  int? _maxLength;
  final FocusNode _focusNode =  FocusNode();

  @override
  void initState() {
    super.initState();
    _assembleCountStepper();
    _focusNode.addListener(_addFocusNodeListing);
    widget.focusNodeEvent?.call(false,_focusNode);

  }

  @override
  void didUpdateWidget(FLCountStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _assembleCountStepper();
    }
  }

  //添加失去焦点事件监听
  void _addFocusNodeListing() {
    final v = _inputController.text;
    final val = v.isEmpty ? 0 : int.parse(v);
    widget.focusNodeHandle?.call(_focusNode.hasFocus, val, _focusNode, _inputController);
  }

  void _assembleCountStepper() {
    _controller = widget.controller;
    int? number = _controller.value;
    _inputController.value = TextEditingValue(
        text: '$number', selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: '$number'.length)));
    _minusEnabled = !(widget.disabled || _controller.isMin());
    _addEnabled = !(widget.disabled || _controller.isMax());
    if (mounted) {
      _controller.addListener(_onStepperValueChanged);
    }
  }

  void _onStepperValueChanged() {
    num number = _controller.number;
    _inputController.value = TextEditingValue(
        text: '$number', selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: '$number'.length)));
  }

  ///减数量
  void _handleMinusPressed() {
    _showLog('执行 - 操作');
    _resignFocus();
    final isGo = _syncValueAndInput(CountStepperActionType.reduce);
    if(isGo){
      _controller.minus();
      _updateEnableStates();

      if (widget.onChanged != null) {
        widget.onChanged!(_controller.number);
      }
    }
  }

  ///加数量
  void _handleAddPressed() {
    _showLog('执行 + 操作');
    _resignFocus();
    final isGo =  _syncValueAndInput(CountStepperActionType.add);
    if(isGo){
      _controller.add();
      _updateEnableStates();
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.number);
      }
    }
  }

  ///如果返回true则继续执行余下步骤
  bool _syncValueAndInput(CountStepperActionType actionType) {
    String text = _inputController.value.text;
    if (text.trim().isEmpty) {
      num regVal = math.min(_controller.max, math.max(0, _controller.min));
      text = '$regVal';
    }

    _showLog('修改文本内容:$text  >>>>是否满足条件:${_controller.value!.compareTo(num.parse(text)) != 0}');
    if (_controller.value!.compareTo(num.parse(text)) != 0) {
      final isGo = widget.valueInterceptor?.call(int.parse(text),actionType) ?? true;
      _showLog('执行拦截器,是否放行? :$isGo');
      if(isGo){
        _controller.number = num.parse(text);
        return true;
      }
    }
    final isGo = widget.valueInterceptor?.call(int.parse(text),actionType) ?? true;
    _showLog('执行拦截器,是否放行? :$isGo');
    return isGo;
  }

  void _updateEnableStates() {
    setState(() {
      _minusEnabled = !_controller.isMin();
      _addEnabled = !_controller.isMax();
    });
  }

  ///输入框焦点移除
  void _resignFocus() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  void _handleInputComplete() {
    _resignFocus();
    final isOk = _syncValueAndInput(CountStepperActionType.customInput);
    if(isOk){
      num curValue = _controller.number;
      _inputController.value = TextEditingValue(
          text: '$curValue', selection: TextSelection.fromPosition(TextPosition(affinity: TextAffinity.downstream, offset: '$curValue'.length)));
      _updateEnableStates();

      if (widget.onChanged != null) {
        widget.onChanged!(_controller.number);
      }
    }

  }

  void _showLog(dynamic msg) {
    if(widget.loggerLevel == CountStepperLoggerLevel.enable){
      debugPrint(msg);
    }
  }

  @override
  void dispose() {
    widget.focusNodeEvent?.call(true,_focusNode);
      _focusNode.removeListener(_addFocusNodeListing);
      _focusNode.dispose();
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
    final Color buttonIconColor = widget.actionColor ?? (isDarkMode ? Colors.white : themeData.primaryColor);
    final Color inputBackgroundColor = isDarkMode ? Colors.transparent : _kDefaultBackgroundColor;

    final Widget minusButton = SizedBox(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: TextButton(
        style:
            ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero), textStyle: MaterialStateProperty.all(TextStyle(color: buttonIconColor))),
        onPressed: _minusEnabled ? _handleMinusPressed : null,
        child: Icon(Icons.remove, size: widget.iconFontSize ?? _kDefaultEleSize),
      ),
    );

    final Widget input = Container(
      width: widget.inputWidth,
      height: widget.textAndInputHeight ?? _kDefaultInputHeight,
      padding: const EdgeInsets.only(left: 3),
      // resolve text center issue
      decoration: BoxDecoration(
        color: inputBackgroundColor,
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextField(
        onChanged: (v) {
          final nV = v.isEmpty ? 0 : int.parse(v);
          widget.onChangeWithInput?.call(nV, _inputController);
        },
        controller: _inputController,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: _kDefaultFontSize),
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        onTap: () {
          widget.inputOnTap?.call(_inputController);
        },
        enabled: !widget.disableInput,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[-0-9]")),
          LengthLimitingTextInputFormatter(_maxLength),
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        ),
        onEditingComplete: _handleInputComplete,
      ),
    );


    /// + 按钮
    final Widget addButton = SizedBox(
      width: _kDefaultButtonSize,
      height: _kDefaultButtonSize,
      child: TextButton(
        style:
            ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero), textStyle: MaterialStateProperty.all(TextStyle(color: buttonIconColor))),
        onPressed: _addEnabled ? _handleAddPressed : null,
        child: Icon(Icons.add, size: widget.iconFontSize ?? _kDefaultEleSize),
      ),
    );

    const double inset = 3;
    return SizedBox(
      width: 2 * (_kDefaultButtonSize + inset) + widget.inputWidth,
      height: widget.textAndInputHeight ?? _kDefaultInputHeight,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: ((widget.textAndInputHeight ?? _kDefaultInputHeight) - _kDefaultButtonSize) / 2,
            child: widget.minButtonRender?.call(_handleMinusPressed) ?? minusButton,
          ),
          Positioned(
            top: 0,
            left: _kDefaultButtonSize + inset,
            child: input,
          ),
          Positioned(
            left: _kDefaultButtonSize + widget.inputWidth + 2 * inset,
            top: ((widget.textAndInputHeight ?? _kDefaultInputHeight) - _kDefaultButtonSize) / 2,
            child: widget.addButtonRender?.call(_handleAddPressed) ?? addButton,
          )
        ],
      ),
    );
  }
}

class _FLFloatingAnimationWrapper extends StatefulWidget {
  const _FLFloatingAnimationWrapper({
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
              child: SizedBox(
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

class _FLFloatingCountStepperState extends State<FLFloatingCountStepper> with TickerProviderStateMixin {
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
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
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
      if (text.trim().isEmpty) {
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

  Future<void> _playMinusAnim() async {
    try {
      await _animationController!.forward().orCancel;
    } on TickerCanceled catch(_){}
  }

  Future<void> _reversMinusAnim() async {
    try {
      await _animationController?.reverse().orCancel;
    } on TickerCanceled catch(_){}
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
    const double inset = 3;

    final Widget minusButtonWrapper = _FLFloatingAnimationWrapper(
      marginTop: (_kDefaultInputHeight - _kDefaultFloatingButtonSize) / 2,
      marginLeft: widget.labelWidth + _kDefaultFloatingButtonSize + inset * 2,
      width: _kDefaultFloatingButtonSize,
      height: _kDefaultFloatingButtonSize,
      controller: _animationController,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero), shape: MaterialStateProperty.all(CircleBorder(side: BorderSide(color: tintColor)))),
        onPressed: _minusEnabled ? _handleMinusPressed : null,
        child: Icon(Icons.remove, size: _kDefaultEleSize, color: tintColor),
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
            style: widget.labelTextStyle ?? const TextStyle(fontSize: _kDefaultFloatingSize),
          ),
        ));

    final Widget addButton = SizedBox(
      width: _kDefaultFloatingButtonSize,
      height: _kDefaultFloatingButtonSize,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(tintColor)),
        onPressed: _addEnabled ? _handleAddPressed : null,
        child: const Icon(Icons.add, size: _kDefaultEleSize, color: Colors.white),
      ),
    );

    return SizedBox(
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

enum CountStepperLoggerLevel{
  enable,
  disable
}

enum CountStepperActionType {
  //加操作
  add,

  //减操作
  reduce,

  //自定义输入
  customInput
}