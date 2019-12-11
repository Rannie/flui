import 'package:example/empty.dart';
import 'package:example/flat_button.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  static const String routeName = '/empty';

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  GlobalKey<FLEmptyContainerState> _emptyKey = GlobalKey<FLEmptyContainerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Empty Page'),
        ),
        body:FLEmptyContainer(
          key: _emptyKey,
          title: 'request failed',
          detailText: 'please check the network status and retry',
          actionButton: FLFlatButton(
            textColor: Theme.of(context).primaryColor,
            color: Colors.white,
            child: Text('retry'),
            onPressed: () {
              print('retry');
            },
          ),
          content: Container(
            padding: EdgeInsets.all(10),
            child: Text('this is content'),
          ),
        )
    );
  }
}