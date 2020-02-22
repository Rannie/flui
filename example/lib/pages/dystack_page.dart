import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  static const String routeName = '/stack';

  @override
  State<StackPage> createState() => StackPageState();
}

class StackPageState extends State<StackPage> {
  @override
  Widget build(BuildContext context) {
    var widget = Stack();
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: FLDyContainer(
        jsonObject: null,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}