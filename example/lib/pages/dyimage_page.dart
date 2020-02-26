import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:example/json_strings.dart';

class DyImagePage extends StatefulWidget {
  static const String routeName = '/dy-image';
  @override
  State<DyImagePage> createState() => DyImagePageState();
}

class DyImagePageState extends State<DyImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: FLDyContainer(
        jsonObject: ImageJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}