import 'pages/count_stepper_page.dart';
import 'pages/list_page.dart';
import 'package:flutter/material.dart';
import 'pages/action_sheet_page.dart';
import 'pages/avatar_page.dart';
import 'pages/badge_page.dart';
import 'pages/bubble_page.dart';
import 'pages/button_page.dart';
import 'pages/empty_page.dart';
import 'pages/label_page.dart';
import 'pages/app_bar_page.dart';
import 'pages/notice_page.dart';
import 'pages/skeleton_page.dart';
import 'pages/toast_page.dart';
import 'pages/input_page.dart';

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
          darkPicPath: 'assets/button_dark.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: ButtonPage.routeName),
      _FLDemoListData(
          title: 'Label',
          picPath: 'assets/label.png',
          darkPicPath: 'assets/label_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: LabelPage.routeName),
      _FLDemoListData(
          title: 'AppBar',
          picPath: 'assets/navi.png',
          darkPicPath: 'assets/navi_dark.png',
          imgWidth: 120,
          imgHeight: 50,
          targetRouteName: AppBarPage.routeName),
      _FLDemoListData(
          title: 'Toast',
          picPath: 'assets/toast.png',
          darkPicPath: 'assets/toast_dark.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: ToastPage.routeName),
      _FLDemoListData(
          title: 'Bubble',
          picPath: 'assets/bubble.png',
          darkPicPath: 'assets/bubble_dark.png',
          imgWidth: 120,
          imgHeight: 58,
          targetRouteName: BubblePage.routeName),
      _FLDemoListData(
          title: 'Avatar',
          picPath: 'assets/avatar.png',
          darkPicPath: 'assets/avatar_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: AvatarPage.routeName),
      _FLDemoListData(
          title: 'Input',
          picPath: 'assets/input.png',
          darkPicPath: 'assets/input_dark.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: InputPage.routeName),
      _FLDemoListData(
          title: 'Badge',
          picPath: 'assets/badge.png',
          darkPicPath: 'assets/badge_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: BadgePage.routeName),
      _FLDemoListData(
          title: 'CountStepper',
          picPath: 'assets/count_stepper.png',
          darkPicPath: 'assets/count_stepper_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: CountStepperPage.routeName),
      _FLDemoListData(
          title: 'Empty',
          picPath: 'assets/empty.png',
          darkPicPath: 'assets/empty_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: EmptyPage.routeName),
      _FLDemoListData(
          title: 'NoticeBar',
          picPath: 'assets/notice.png',
          darkPicPath: 'assets/notice_dark.png',
          imgWidth: 110,
          imgHeight: 50,
          targetRouteName: NoticeBarPage.routeName),
      _FLDemoListData(
          title: 'Skeleton',
          picPath: 'assets/skeleton.png',
          darkPicPath: 'assets/skeleton_dark.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: SkeletonPage.routeName),
      _FLDemoListData(
          title: 'BottomSheet',
          picPath: 'assets/sheet.png',
          darkPicPath: 'assets/sheet_dark.png',
          imgWidth: 100,
          imgHeight: 65,
          targetRouteName: ActionSheetPage.routeName),
      _FLDemoListData(
          title: 'List',
          picPath: 'assets/list.png',
          darkPicPath: 'assets/list_dark.png',
          imgWidth: 70,
          imgHeight: 70,
          targetRouteName: ListPage.routeName),
    ];
  }

  List<Widget> get _demoCards {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                          isDarkMode
                              ? (demoData.darkPicPath ?? demoData.picPath)
                              : demoData.picPath,
                          width: demoData.imgWidth,
                          height: demoData.imgHeight,
                          scale: 1.8,
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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color bgColor = Theme.of(context).backgroundColor;
    return Scaffold(
        appBar: AppBar(
          title: Text('FLUI', style: TextStyle(letterSpacing: 4)),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: isDarkMode ? bgColor : Color(0xFFFCFCFC),
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
    this.darkPicPath,
    this.imgWidth,
    this.imgHeight,
    this.targetRouteName,
  });

  final String title;
  final String picPath;
  final String darkPicPath;
  final double imgWidth;
  final double imgHeight;
  final String targetRouteName;
}
