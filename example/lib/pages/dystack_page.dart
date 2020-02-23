import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import '../json_strings.dart';

class StackPage extends StatefulWidget {
  static const String routeName = '/stack';

  @override
  State<StackPage> createState() => StackPageState();
}

class StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Color(0xFFECEFF1) : null,
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: FLDyContainer(
        jsonObject: StackJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}