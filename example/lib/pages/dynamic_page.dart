import 'package:example/pages/dyalign_page.dart';
import 'package:example/pages/dycontainer_page.dart';
import 'package:example/pages/dylistview_page.dart';
import 'package:example/pages/dystack_page.dart';
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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return FLListTile(
                    title: Text('Container'),
                    onTap: () => Navigator.pushNamed(
                        context, ContainerEffectPage.routeName),
                  );
                }
                if (index == 1) {
                  return FLListTile(
                    title: Text('Flex Layout'),
                    onTap: () => Navigator.pushNamed(
                        context, AlignLayoutPage.routeName),
                  );
                }
                if (index == 2) {
                  return FLListTile(
                    title: Text('Stack Layout'),
                    onTap: () => Navigator.pushNamed(
                        context, StackPage.routeName),
                  );
                }
                if (index == 3) {
                  return FLListTile(
                    title: Text('List View'),
                    onTap: () => Navigator.pushNamed(
                        context, DyListPage.routeName),
                  );
                }
                return null;
              },
              separatorBuilder: (context, index) => Divider(height: 1)
          ),
        ),
      )
    );
  }
}
