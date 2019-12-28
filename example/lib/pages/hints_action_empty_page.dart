import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class HintsActionEmptyPage extends StatefulWidget {
  static const String routeName = '/hints-action-empty';

  @override
  State<StatefulWidget> createState() => _HintsActionEmptyPageState();
}

class _HintsActionEmptyPageState extends State<HintsActionEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hints & Action'),
      ),
      body: FLEmptyContainer(
          title: 'Request Failed',
          detailText: 'Please check the network status and retry',
          space: 12,
          actionButton: Container(
            width: 150,
            height: 35,
            child: RaisedButton(
              textColor: Colors.white,
              child: Text('Retry'),
              onPressed: () => print('retry'),
            ),
          )),
    );
  }
}
