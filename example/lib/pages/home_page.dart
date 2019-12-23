import 'package:example/pages/count_stepper_page.dart';
import 'package:flutter/material.dart';
import 'package:example/pages/action_sheet_page.dart';
import 'package:example/pages/avatar_page.dart';
import 'package:example/pages/badge_page.dart';
import 'package:example/pages/bubble_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/label_page.dart';
import 'package:example/pages/app_bar_page.dart';
import 'package:example/pages/notice_page.dart';
import 'package:example/pages/skeleton_page.dart';
import 'package:example/pages/toast_page.dart';
import 'package:example/pages/input_page.dart';
import 'package:example/pages/static_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<_FLDemoListData> get _demoList {
    return [
      _FLDemoListData(
          title: 'Button',
          picPath: 'assets/button.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: ButtonPage.routeName),
      _FLDemoListData(
          title: 'Label',
          picPath: 'assets/label.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: LabelPage.routeName),
      _FLDemoListData(
          title: 'AppBar',
          picPath: 'assets/navi.png',
          imgWidth: 120,
          imgHeight: 50,
          targetRouteName: AppBarPage.routeName),
      _FLDemoListData(
          title: 'Toast',
          picPath: 'assets/toast.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: ToastPage.routeName),
      _FLDemoListData(
          title: 'Bubble',
          picPath: 'assets/bubble.png',
          imgWidth: 120,
          imgHeight: 58,
          targetRouteName: BubblePage.routeName),
      _FLDemoListData(
          title: 'Avatar',
          picPath: 'assets/avatar.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: AvatarPage.routeName),
      _FLDemoListData(
          title: 'Input',
          picPath: 'assets/input.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: InputPage.routeName),
      _FLDemoListData(
          title: 'Badge',
          picPath: 'assets/badge.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: BadgePage.routeName),
      _FLDemoListData(
          title: 'CountStepper',
          picPath: 'assets/list.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: CountStepperPage.routeName),
      _FLDemoListData(
          title: 'Empty',
          picPath: 'assets/empty.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: EmptyPage.routeName),
      _FLDemoListData(
          title: 'NoticeBar',
          picPath: 'assets/notice.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: NoticeBarPage.routeName),
      _FLDemoListData(
          title: 'Skeleton',
          picPath: 'assets/skeleton.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: SkeletonPage.routeName),
      _FLDemoListData(
          title: 'BottomSheet',
          picPath: 'assets/sheet.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: ActionSheetPage.routeName),
      _FLDemoListData(
          title: 'List',
          picPath: 'assets/list.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: StaticListViewPage.routeName),
    ];
  }

  List<Widget> get _demoCards {
    List<Widget> list = [];
    for (_FLDemoListData demoData in _demoList) {
      Widget card = Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          elevation: 1,
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, demoData.targetRouteName);
              },
              splashColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              // Generally, material cards do not have a highlight overlay.
              highlightColor: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 10,
                      right: 10,
                      top: 15,
                      bottom: 55,
                      child: Center(
                        child: Image.asset(
                          demoData.picPath,
                          width: demoData.imgWidth,
                          height: demoData.imgHeight,
                          scale: 1.6,
                        ),
                      )),
                  Positioned(
                    left: 10,
                    right: 10,
                    bottom: 20,
                    child: Text(demoData.title,
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center),
                  )
                ],
              )));
      list.add(card);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FLUI', style: TextStyle(letterSpacing: 6)),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView(
              padding: EdgeInsets.symmetric(vertical: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 8,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20),
              children: _demoCards,
            )));
  }
}

class _FLDemoListData {
  const _FLDemoListData({
    this.title,
    this.picPath,
    this.imgWidth,
    this.imgHeight,
    this.targetRouteName,
  });

  final String title;
  final String picPath;
  final double imgWidth;
  final double imgHeight;
  final String targetRouteName;
}
