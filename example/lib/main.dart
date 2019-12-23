import 'package:example/event.dart';
import 'package:example/pages/about_page.dart';
import 'package:example/pages/action_sheet_page.dart';
import 'package:example/pages/avatar_page.dart';
import 'package:example/pages/badge_page.dart';
import 'package:example/pages/bubble_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/count_stepper_page.dart';
import 'package:example/pages/empty_page.dart';
import 'package:example/pages/hints_action_empty_page.dart';
import 'package:example/pages/hints_empty_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/image_hints_empty_page.dart';
import 'package:example/pages/label_page.dart';
import 'package:example/pages/app_bar_page.dart';
import 'package:example/pages/loading_empty_page.dart';
import 'package:example/pages/notice_page.dart';
import 'package:example/pages/skeleton_page.dart';
import 'package:example/pages/toast_page.dart';
import 'package:flui/flui.dart';
import 'package:example/pages/input_page.dart';
import 'package:example/pages/static_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:example/style/theme.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    eventBus.on().listen((event) {});
    WidgetsBinding.instance.addObserver(this);
    _isDarkMode = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final Brightness brightness =
        WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      _isDarkMode = brightness == Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    FLToastStyle style = _isDarkMode ? FLToastStyle.light : FLToastStyle.dark;
    FLToastDefaults toastDefaults = FLToastDefaults(style: style);
    return FLToastProvider(
      defaults: toastDefaults,
      child: MaterialApp(
        title: 'FLUI',
        debugShowCheckedModeBanner: false,
        theme: kLightTheme,
        darkTheme: kDarkTheme,
        routes: {
          HomeTab.routeName: (context) => HomeTab(),
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
          CountStepperPage.routeName: (context) => CountStepperPage()
        },
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  static const String routeName = '/';

  HomeTab({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  List pages = [
    HomePage(),
    AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text('widgets'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('about'),
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
