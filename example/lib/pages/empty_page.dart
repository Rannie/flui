import 'package:example/pages/hints_action_empty_page.dart';
import 'package:example/pages/hints_empty_page.dart';
import 'package:example/pages/image_hints_empty_page.dart';
import 'package:example/pages/loading_empty_page.dart';
import 'package:example/static_list.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  static const String routeName = '/empty';

  @override
  State<EmptyPage> createState() => _EmptyPageState();
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    final List<FLStaticSectionData> sectionList = [
      FLStaticSectionData(
          itemList: [
            FLStaticItemData(
              title: 'Loading',
              accessoryType: FLStaticListCellAccessoryType.accDetail,
              onTap: () {
                Navigator.pushNamed(context, LoadingEmptyPage.routeName);
              }
            ),
            FLStaticItemData(
              title: 'Hints',
                accessoryType: FLStaticListCellAccessoryType.accDetail,
                onTap: () {
                  Navigator.pushNamed(context, HintsEmptyPage.routeName);
                }
            ),
            FLStaticItemData(
                title: 'Hints and Action Button',
                accessoryType: FLStaticListCellAccessoryType.accDetail,
                onTap: () {
                  Navigator.pushNamed(context, HintsActionEmptyPage.routeName);
                }
            ),
            FLStaticItemData(
                title: 'Image and Hints',
                accessoryType: FLStaticListCellAccessoryType.accDetail,
                onTap: () {
                  Navigator.pushNamed(context, ImageHintsEmptyPage.routeName);
                }
            ),
          ]
      )
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Empty'),
        ),
        body: Container(
          height: double.infinity,
          child: FLStaticListView(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 1, color: Colors.grey);
            },
            sections: sectionList,
          )
        )
    );
  }
}