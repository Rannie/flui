import 'package:example/notice_bar.dart';
import 'package:flutter/material.dart';

class NoticeBarPage extends StatefulWidget {
  static const String routeName = '/notice-bar';

  @override
  State<NoticeBarPage> createState() => _NoticeBarPageState();
}

class _NoticeBarPageState extends State<NoticeBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notice Bar'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FLNoticeBar.notice(
                text: 'Notice: The arrival time of incomes and transfers of Yu \'E Bao will be delayed during National Day.',
              ),
              SizedBox(height: 20),
              FLNoticeBar.closable(
                text: 'Notice: The arrival time of incomes and transfers of Yu \'E Bao will be delayed during National Day.',
                onPressed: () {
                  print('pressed close');
                },
              )
            ],
          ),
        )
    );
  }
}