# Input

Input 包含一些业务场景中需要的输入组件。

## FLAutoComplete

**FLAutoComplete** 为子组件提供了展示自动补全提示列表的功能。

<p align="left">
    <img width="400" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-12-autocomplete.gif" />
</p>

```dart
FLAutoComplete(
    key: _key,
    focusNode: _focusNode,
    itemBuilder: (context, suggestion) => Padding(
      padding: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(suggestion),
      ),
    ),
    onSelectedSuggestion: (suggestion) {
      FLToast.text(text: 'Select - $suggestion');
    },
    child: TextField(
      focusNode: _focusNode,
      onChanged: (text) {
        List<String> sugList = [];
        if (text != null && text.isNotEmpty) {
          for (String option in acData) {
            if (option.toLowerCase().contains(text.toLowerCase())) {
              sugList.add(option);
            }
          }
        }
        _key.currentState.updateSuggestionList(sugList);
      },
    ),
)
```

你可以通过 *itemBuilder* 来自定义展示框的样式。另外注意这里 **FLAutoComplete** 和 TextField 传入了同一个 *FocusNode* 对象来保证焦点行为的一致。


## FLPinCodeTextField

::: warning 注意 
Flutter v1.10 以后添加了 attach 的判断，这样会导致修改非当前连接的 Input 状态时报 assert exception，相关的 [Issue](https://github.com/flutter/flutter/issues/40755), 所以如果你的 Flutter 版本在使用此控件报异常，可以考虑注释掉 attatch 判断或者不要使用此控件，我也会继续跟踪官方对于这个问题的更新。
:::

**FLPinCodeTextField** 适用于输入数字验证码的场景。

<p align="left">
    <img width="300" src="http://abtfun.oss-cn-beijing.aliyuncs.com/img/2019-12-12-pin-input.gif" />
</p>

```dart
FLPinCodeTextField(
    controller: _pinController,
    boxWidth: 45,
    boxHeight: 60,
    pinLength: 6,
    obscure: true,
    minSpace: 20,
    autofocus: false,
    textStyle: TextStyle(fontSize: 22),
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: UnderlineInputBorder(),
    ),
    onChanged: (text) {
        print('change -- $text');
    },
    onSubmitted: (text) {
        print('submit -- $text');
    },
    onEditingComplete: () {
        print('editing complete');
    },
)
```

你可以通过 *pinLength* 来控制需要的输入框的个数，*obsure* 来控制是否为加密输入。

::: warning 注意
由于 TextField 类本身并不能设置高度，所以需要通过 *boxHeight*， InputDecoration 的 contentPadding 和字体大小一起调整。
:::



