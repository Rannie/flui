import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import '../json_strings.dart';

class DyHomeDemo extends StatefulWidget {
  static const String routeName = '/home-demo';
  @override
  State<DyHomeDemo> createState() => DyHomeDemoState();
}

class DyHomeDemoState extends State<DyHomeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Color(0xFFF8F8F9) : Color(0xFF323135),
      appBar: AppBar(
        title: Text("Extend GitHub"),
        centerTitle: true,
      ),
      body: FLDyContainer(
        jsonObject: HomeJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}