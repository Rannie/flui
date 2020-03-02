import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import '../json_strings.dart';

class DyDetailDemo extends StatefulWidget {
  static const String routeName = '/detail-demo';
  @override
  State<DyDetailDemo> createState() => DyDetailDemoState();
}

class DyDetailDemoState extends State<DyDetailDemo> {
  GlobalKey _dyKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      FLDyContainerState dyState = _dyKey.currentState;
      dyState.loadJson(DetailJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F3),
      appBar: AppBar(
        backgroundColor: Color(0xFF4E8B80),
        elevation: 0,
        actions: <Widget>[
          CircleAvatar(
            child: Image.asset('assets/iron_man.png'),
          ),
          SizedBox(width: 20)
        ],
      ),
      body: FLDyContainer(
        key: _dyKey,
        placeholder: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Color(0xFF4E8B80)),
          ),
        ),
      )
    );
  }
}