import 'package:example/pages/dyalign_page.dart';
import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class DynamicPage extends StatefulWidget {
  static const String routeName = '/dynamic';
  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic', style: TextStyle(letterSpacing: 1)),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return FLListTile(
                  title: Text('Container Effects'),
                );
              }
              if (index == 1) {
                return FLListTile(
                  title: Text('Flex Layout'),
                  onTap: () => Navigator.pushNamed(context, AlignLayoutPage.routeName),
                );
              }
              return null;
            },
            separatorBuilder: (context, index) => Divider(height: 1)
        ),
      )
    );
  }
}
