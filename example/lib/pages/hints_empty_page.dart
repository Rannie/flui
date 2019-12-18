import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class HintsEmptyPage extends StatefulWidget {
  static const String routeName = '/hints-empty';

  @override
  State<HintsEmptyPage> createState() => _HintsEmptyPageState();
}

class _HintsEmptyPageState extends State<HintsEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hints'),
      ),
      body: FLEmptyContainer(
        title: 'Contact is empty',
        detailText: 'Go to \'Settings\' - \'Privacy\' to view your contact permissions settings',
        space: 15,
      )
    );
  }
}