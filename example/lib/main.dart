import 'package:example/event.dart';
import 'package:example/pages/action_sheet_page.dart';
import 'package:example/pages/avatar_page.dart';
import 'package:example/pages/badge_page.dart';
import 'package:example/pages/bubble_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/hints_action_empty_page.dart';
import 'package:example/pages/hints_empty_page.dart';
import 'package:example/pages/image_hints_empty_page.dart';
import 'package:example/pages/label_page.dart';
import 'package:example/pages/app_bar_page.dart';
import 'package:example/pages/loading_empty_page.dart';
import 'package:example/pages/notice_page.dart';
import 'package:example/pages/skeleton_page.dart';
import 'package:example/pages/toast_page.dart';
import 'package:example/toast.dart';
import 'package:example/style/style.dart';
import 'package:example/pages/input_page.dart';
import 'package:example/pages/static_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FLToastDefaults _toastDefaults = FLToastDefaults();

  @override
  void initState() {
    super.initState();
    eventBus.on().listen((event) {
      if (event.runtimeType == FLToastDefaults) {
        setState(() => _toastDefaults = event);
      }

      if (event == 'reset') {
        setState(() => _toastDefaults = FLToastDefaults());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FLToastProvider(
      defaults: _toastDefaults,
      child: MaterialApp(
        title: 'FLUI',
        debugShowCheckedModeBanner: false,
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
          LoadingEmptyPage.routeName: (context) => LoadingEmptyPage(),
          HintsEmptyPage.routeName: (context) => HintsEmptyPage(),
          HintsActionEmptyPage.routeName: (context) => HintsActionEmptyPage(),
          ImageHintsEmptyPage.routeName: (context) => ImageHintsEmptyPage(),
          BadgePage.routeName: (context) => BadgePage(),
          LabelPage.routeName: (context) => LabelPage(),
          NoticeBarPage.routeName: (context) => NoticeBarPage(),
          SkeletonPage.routeName: (context) => SkeletonPage(),
          ActionSheetPage.routeName: (context) => ActionSheetPage(),
          AppBarPage.routeName: (context) => AppBarPage(),
          StaticListViewPage.routeName: (context) => StaticListViewPage(),
          ButtonPage.routeName: (context) => ButtonPage(),
          ToastPage.routeName: (context) => ToastPage(),
          BubblePage.routeName: (context) => BubblePage(),
          AvatarPage.routeName: (context) => AvatarPage(),
          InputPage.routeName: (context) => InputPage(),
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
      _FLDemoListData(title: 'Labels', picPath: '', targetRouteName: LabelPage.routeName),
      _FLDemoListData(title: 'AppBar', picPath: '', targetRouteName: AppBarPage.routeName),
      _FLDemoListData(title: 'Toast', picPath: '', targetRouteName: ToastPage.routeName),
      _FLDemoListData(title: 'Bubble', picPath: '', targetRouteName: BubblePage.routeName),
      _FLDemoListData(title: 'Avatar', picPath: '', targetRouteName: AvatarPage.routeName),
      _FLDemoListData(title: 'Input', picPath: '', targetRouteName: InputPage.routeName),
      _FLDemoListData(title: 'Badge', picPath: '', targetRouteName: BadgePage.routeName),
      _FLDemoListData(title: 'Empty', picPath: '', targetRouteName: EmptyPage.routeName),
      _FLDemoListData(title: 'NoticeBar', picPath: '', targetRouteName: NoticeBarPage.routeName),
      _FLDemoListData(title: 'Skeleton', picPath: '', targetRouteName: SkeletonPage.routeName),
      _FLDemoListData(title: 'BottomSheet', picPath: '', targetRouteName: ActionSheetPage.routeName)
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
