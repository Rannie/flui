import 'dart:io';

import 'pages/dycontainer_page.dart';
import 'pages/dyrich_text_page.dart';
import 'pages/dystack_page.dart';
import 'pages/list_page.dart';
import 'pages/persistent_header_page.dart';
import 'pages/dybutton_page.dart';
import 'pages/dyimage_page.dart';
import 'util.dart';
import 'about_page.dart';
import 'pages/action_sheet_page.dart';
import 'pages/avatar_page.dart';
import 'pages/badge_page.dart';
import 'pages/bubble_page.dart';
import 'pages/button_page.dart';
import 'pages/count_stepper_page.dart';
import 'pages/empty_page.dart';
import 'pages/hints_action_empty_page.dart';
import 'pages/hints_empty_page.dart';
import 'home_page.dart';
import 'pages/image_hints_empty_page.dart';
import 'pages/label_page.dart';
import 'pages/app_bar_page.dart';
import 'pages/loading_empty_page.dart';
import 'pages/notice_page.dart';
import 'pages/skeleton_page.dart';
import 'pages/toast_page.dart';
import 'pages/input_page.dart';
import 'pages/static_list_page.dart';
import 'dynamic_page.dart';
import 'pages/dyalign_page.dart';
import 'pages/dylistview_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/dydemo_home_page.dart';
import 'pages/dydemo_detail_page.dart';
import 'style/theme.dart';
import 'package:flui/flui.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  Util.initialize();
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  FLToastDefaults _defaults = FLToastDefaults();
  bool _userModeLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Util.eventBus.on().listen((event) {
      if (event == 'reset') {
        setState(() {
          _defaults = FLToastDefaults();
        });
      } else if (event == 'theme') {
        setState(() {});
      } else if (event == 'themeLoaded') {
        if (!_userModeLoaded) setState(() {});
      } else if (event == 'direction') {
        setState(() {});
      } else {
        setState(() => _defaults = event);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    if (Util.themeMode == ThemeMode.system) {
      setState(() {});
    }
  }

  bool _isDarkMode() {
    bool isDarkMode;
    final ThemeMode themeMode = Util.themeMode;
    if (themeMode == ThemeMode.light || themeMode == ThemeMode.dark) {
      isDarkMode = themeMode == ThemeMode.dark;
    } else {
      isDarkMode =
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    }
    return isDarkMode;
  }

  void _updateStatusBar() {
    final SystemUiOverlayStyle overlayStyle =
        _isDarkMode() ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }

  @override
  Widget build(BuildContext context) {
    if (_userModeLoaded == false && Util.preferences != null) {
      _userModeLoaded = true;
    }

    _updateStatusBar();
    final bool isDarkMode = _isDarkMode();
    final ThemeMode themeMode = Util.themeMode;
    final FLToastStyle style =
        isDarkMode ? FLToastStyle.light : FLToastStyle.dark;
    final FLToastDefaults toastDefaults = FLToastDefaults(
        style: style,
        position: _defaults.position,
        textDirection: Util.textDirection);

    return MaterialApp(
        title: 'FLUI',
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
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
          CountStepperPage.routeName: (context) => CountStepperPage(),
          PersistentHeaderPage.routeName: (context) => PersistentHeaderPage(),
          ListPage.routeName: (context) => ListPage(),
          // dynamic demo pages
          AlignLayoutPage.routeName: (context) => AlignLayoutPage(),
          ContainerEffectPage.routeName: (context) => ContainerEffectPage(),
          DyListPage.routeName: (context) => DyListPage(),
          StackPage.routeName: (context) => StackPage(),
          DyRichTextPage.routeName: (context) => DyRichTextPage(),
          DyButtonPage.routeName: (context) => DyButtonPage(),
          DyImagePage.routeName: (context) => DyImagePage(),
          DyHomeDemo.routeName: (context) => DyHomeDemo(),
          DyDetailDemo.routeName: (context) => DyDetailDemo()
        },
        builder: (BuildContext context, Widget child) {
          return FLToastProvider(
              defaults: toastDefaults,
              child: Directionality(
                textDirection: Util.textDirection,
                child: child,
              )
          );
        },
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
  List pages = [HomePage(), DynamicPage(), AboutPage()];

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
            icon: Icon(Icons.aspect_ratio),
            title: Text('dynamic'),
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
