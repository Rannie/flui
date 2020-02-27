import 'pages/dyalign_page.dart';
import 'pages/dycontainer_page.dart';
import 'pages/dylistview_page.dart';
import 'pages/dyrich_text_page.dart';
import 'pages/dystack_page.dart';
import 'pages/dybutton_page.dart';
import 'pages/dyimage_page.dart';
import 'package:flutter/material.dart';
import 'package:flui/flui.dart';

class DynamicPage extends StatefulWidget {
  static const String routeName = '/dynamic';
  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {

  List<FLStaticSectionData> sectionList() {
    return [
      FLStaticSectionData(headerTitle: 'Basic', itemList: [
        FLStaticItemData(
            title: 'Rich Text',
            onTap: () => Navigator.pushNamed(
                context, DyRichTextPage.routeName)
        ),
        FLStaticItemData(
            title: 'Image',
            onTap: () => Navigator.pushNamed(
                context, DyImagePage.routeName)
        ),
        FLStaticItemData(
            title: 'Button',
            onTap: () => Navigator.pushNamed(
                context, DyButtonPage.routeName)
        ),
        FLStaticItemData(
            title: 'Container',
            onTap: () => Navigator.pushNamed(
                context, ContainerEffectPage.routeName)
        ),
        FLStaticItemData(
            title: 'Flex Layout',
            onTap: () => Navigator.pushNamed(
                context, AlignLayoutPage.routeName)
        ),
        FLStaticItemData(
            title: 'Stack Layout',
            onTap: () => Navigator.pushNamed(
                context, StackPage.routeName)
        ),
        FLStaticItemData(
            title: 'List View',
            onTap: () => Navigator.pushNamed(
                context, DyListPage.routeName)
        ),
      ]),
    ];
  }

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
          child: FLStaticListView(
            shrinkWrap: true,
            sections: sectionList(),
          )
        ),
      )
    );
  }
}
