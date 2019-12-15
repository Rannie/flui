# Theme

由于 Flutter 本身的主题配置已经足够丰富，这里只是增加一些快捷方法和局部扩充。

## FLPrimaryColorOverride

**FLPrimaryColorOverride** 可以为子组件配置新的主颜色。

```dart
FLPrimaryColorOverride(
    color: Colors.blue,
    child: RaisedButton(
        child: Text('Color Override');
    ),
    onPressed: (){}
)
```
