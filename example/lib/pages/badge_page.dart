import 'package:example/badge.dart';
import 'package:flutter/material.dart';

class BadgePage extends StatefulWidget {
  static const String routeName = '/badge';

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Badge'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: FLBadge(
            position: FLBadgePosition.topRight,
            text: '2',
            child: Container(
              width: 44,
              height: 44,
              color: Colors.blue,
            ),
          )
        ),
    );
  }
}