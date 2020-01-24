import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:example/json_strings.dart';

class DynamicPage extends StatefulWidget {
  static const String routeName = '/dynamic';
  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic', style: TextStyle(letterSpacing: 1)),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FLDyContainer(
            jsonObject: ColumnLayoutJson,
            placeholder: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
            ),
          ),
        ],
      ),
    );
  }
}
