# Input

## FLAutoComplete

**FLAutoComplete** provides the ability for sub-widgets to display a list of auto-completion hints.

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

You can customize the style of the display list with *itemBuilder*. Also note that **FLAutoComplete** and TextField use the same *FocusNode* object to ensure consistent focus behavior.


## FLPinInput

**FLPinInput** is applicable to the scenario of inputting digital verification code.

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

You can use *pinLength* to control the number of input boxes required, and use *obsure* to control whether it is encrypted mode.

::: warning
Since the TextField class itself cannot set the height, it needs to be adjusted with *boxHeight*, the contentPadding of InputDecoration and the font size.
:::



