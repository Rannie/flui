import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class NoticeBarPage extends StatefulWidget {
  static const String routeName = '/notice-bar';

  @override
  State<NoticeBarPage> createState() => _NoticeBarPageState();
}

class _NoticeBarPageState extends State<NoticeBarPage> {
  Widget _buildSection(String title, Widget content) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          child: Row(
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.blueGrey, fontSize: 17)),
            ],
          ),
        ),
        content
      ],
    );
  }

  Widget _buildNormalBar() {
    return FLNoticeBar(
      text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
    );
  }

  Widget _buildNoticeBar() {
    return FLNoticeBar.notice(
      text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
      velocity: 0.6,
    );
  }

  Widget _buildClosableBar() {
    return FLNoticeBar.closable(
      text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
      velocity: 0.8,
      onPressed: () {
        FLToast.text(text: 'Close NoticeBar');
      },
    );
  }

  Widget _buildCustomBar() {
    return FLNoticeBar(
      text: 'Notice: The arrival time of incomes and transfers of account will be delayed during National Day.',
      prefix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          'prefix',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      suffix: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          'suffix',
          style: TextStyle(color: Colors.grey),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notice Bar'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              _buildSection('normal', _buildNormalBar()),
              _buildSection('.notice', _buildNoticeBar()),
              _buildSection('.closable', _buildClosableBar()),
              _buildSection('custom prefix & suffix', _buildCustomBar())
            ],
          ),
        )
    );
  }
}