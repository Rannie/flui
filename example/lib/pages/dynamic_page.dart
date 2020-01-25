import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class DynamicPage extends StatefulWidget {
  static const String routeName = '/dynamic';
  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic', style: TextStyle(letterSpacing: 1)),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FLListTile(
            title: Text('Flex Layout'),
          )
        ],
      )
    );
  }
}
