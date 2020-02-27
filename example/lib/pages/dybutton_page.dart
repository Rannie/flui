import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import '../json_strings.dart';

class DyButtonPage extends StatefulWidget {
  static const String routeName = '/dy-button';
  @override
  State<DyButtonPage> createState() => DyButtonPageState();
}

class DyButtonPageState extends State<DyButtonPage> {
  @override
  void initState() {
    super.initState();
    FLDyActionDispatch.dispatcher.registerActionHandler(
      'custom-handler',
      (BuildContext context, String uniqueId, List args) {
        FLToast.success(text: 'click $uniqueId');
    });
  }

  @override
  void dispose() {
    super.dispose();
    FLDyActionDispatch.dispatcher.removeActionHandler('custom-handler');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
      ),
      body: FLDyContainer(
        jsonObject: ButtonJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
