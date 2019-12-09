import 'package:example/pages/action_sheet_page.dart';
import 'package:example/pages/badge_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/label_page.dart';
import 'package:example/pages/navi_title_page.dart';
import 'package:example/pages/notice_page.dart';
import 'package:example/pages/skeleton_page.dart';
import 'package:example/toast.dart';
import 'package:example/style/style.dart';
import 'package:example/pages/input_page.dart';
import 'package:example/pages/static_list_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FLToastDefaults defaults = FLToastDefaults(style: FLToastStyle.dark);
    return FLToastProvider(
      defaults: defaults,
      child: MaterialApp(
        title: 'FLUI',
        theme: ThemeData(
            primarySwatch: FLColors.primarySwatch,
            buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: FLColors.primarySwatch)
            ),
        ),
        routes: {
          MyHomePage.routeName: (context) => MyHomePage(),
          InputPage.routeName: (context) => InputPage(),
          EmptyPage.routeName: (context) => EmptyPage(),
          BadgePage.routeName: (context) => BadgePage(),
          LabelPage.routeName: (context) => LabelPage(),
          NoticeBarPage.routeName: (context) => NoticeBarPage(),
          SkeletonPage.routeName: (context) => SkeletonPage(),
          ActionSheetPage.routeName: (context) => ActionSheetPage(),
          NaviTitlePage.routeName: (context) => NaviTitlePage(),
          StaticListViewPage.routeName: (context) => StaticListViewPage(),
          ButtonPage.routeName: (context) => ButtonPage()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = '/';

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<_FLDemoListData> get _demoList {
    return [
      _FLDemoListData(title: 'Buttons', picPath: '', targetRouteName: ButtonPage.routeName),
    ];
  }

  List<Widget> get _demoCards {
    List<Widget> list = [ SizedBox(height: 15) ];
    for (_FLDemoListData demoData in _demoList) {
      Widget card = Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                elevation: 2,
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, demoData.targetRouteName);
                    },
                    splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                    // Generally, material cards do not have a highlight overlay.
                    highlightColor: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 15,
                          top: 26,
                          child: Text(demoData.title, style: TextStyle(fontSize: 18)),
                        ),
                        Positioned(
                          right: 15,
                          top: 10,
                          bottom: 10,
                          child: Container(
                            width: 100,
                            color: Color(0xFF0F4C81),
                          ),
                        )
                      ],
                    )
                )
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 15))
        ],
      );
      list.add(card);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLUI'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: ListView(
              children: _demoCards,
            )
        )
      )
    );
  }
}

class _FLDemoListData {
  const _FLDemoListData({
    this.title,
    this.picPath,
    this.targetRouteName,
  });

  final String title;
  final String picPath;
  final String targetRouteName;
}
