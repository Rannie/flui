import '../json_strings.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class ContainerEffectPage extends StatefulWidget {
  static const String routeName = '/container-effect';
  @override
  State<ContainerEffectPage> createState() => ContainerEffectPageState();
}

class ContainerEffectPageState extends State<ContainerEffectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: FLDyContainer(
        jsonObject: ContainerEffectJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}