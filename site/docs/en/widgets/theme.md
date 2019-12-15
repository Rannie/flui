# Theme

Since the theme configuration of Flutter is already rich enough, here are just some shortcut methods and extensions.

## FLPrimaryColorOverride

**FLPrimaryColorOverride** can configure a new primary color for a sub-widget.

```dart
FLPrimaryColorOverride(
    color: Colors.blue,
    child: RaisedButton(
        child: Text('Color Override');
    ),
    onPressed: (){}
)
```
