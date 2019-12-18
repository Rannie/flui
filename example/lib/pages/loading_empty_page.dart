import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class LoadingEmptyPage extends StatefulWidget {
  static const String routeName = '/loading-empty';

  @override
  State<LoadingEmptyPage> createState() => _LoadingEmptyPageState();
}

class _LoadingEmptyPageState extends State<LoadingEmptyPage> {
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => setState(() => _showContent = true));
  }

  @override
  Widget build(BuildContext context) {
    final Widget loadingEmpty = FLEmptyContainer(
      showLoading: true,
      title: 'Fetching...',
    );

    final Widget content = Container(
      child: Center(
        child: Text('This is content'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Container(
        child: _showContent ? content : loadingEmpty,
      ),
    );
  }
}