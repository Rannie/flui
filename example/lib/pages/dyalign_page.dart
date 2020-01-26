import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import '../json_strings.dart';

class AlignLayoutPage extends StatefulWidget {
  static const String routeName = '/align-layout';
  @override
  State<AlignLayoutPage> createState() => AlignLayoutPageState();
}

class AlignLayoutPageState extends State<AlignLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Layout'),
        centerTitle: true,
      ),
      body: FLDyContainer(
        jsonObject: FlexLayoutJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}