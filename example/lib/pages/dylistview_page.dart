import 'package:flui/flui.dart';
import '../json_strings.dart';
import 'package:flutter/material.dart';

class DyListPage extends StatefulWidget {
  static const String routeName = '/dylist';

  @override
  State<DyListPage> createState() => DyListPageState();
}

class DyListPageState extends State<DyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: FLDyContainer(
        jsonObject: ListJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}