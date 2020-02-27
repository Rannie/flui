import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import '../json_strings.dart';

class DyRichTextPage extends StatefulWidget {
  static const String routeName = '/dy-richtext';
  @override
  State<DyRichTextPage> createState() => DyRichTextPageState();
}

class DyRichTextPageState extends State<DyRichTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich Text'),
      ),
      body: FLDyContainer(
        jsonObject: RichTextJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}