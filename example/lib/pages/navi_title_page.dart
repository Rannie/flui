import 'package:flutter/material.dart';
import 'package:example/appbar_title.dart';

class NaviTitlePage extends StatefulWidget {
  static const String routeName = '/navi-title';
  @override
  State<NaviTitlePage> createState() => _NaviTitlePageState();
}

class _NaviTitlePageState extends State<NaviTitlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FLAppBarTitle(
          title: 'Page Title',
          layout: FLAppBarTitleLayout.horizontal,
          showLoading: true,
          loadingPosition: FLAppBarPosition.right,
        ),
        centerTitle: true,
      ),
      body: Container(
      ),
    );
  }
}