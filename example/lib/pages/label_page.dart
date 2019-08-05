import 'package:example/marquee_label.dart';
import 'package:flutter/material.dart';

class LabelPage extends StatefulWidget {
  static const String routeName = '/label';

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Badge'),
        ),
        body: Container(
           child: FLMarqueeLabel(
             padding: EdgeInsets.symmetric(horizontal: 8),
             velocity: 0,
             text: 'this is more than a fix',
           ),
        )
    );
  }
}