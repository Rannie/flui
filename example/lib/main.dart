import 'package:example/bubble.dart';
import 'package:example/bubble_menu.dart';
import 'package:example/copyable_label.dart';
import 'package:example/loading_button.dart';
import 'package:example/marquee_label.dart';
import 'package:example/raised_button.dart';
import 'package:example/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:example/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FLToastDefaults defaults = FLToastDefaults();
    return FLToastProvider(
      defaults: defaults,
      child: MaterialApp(
        title: 'FLUI',
        theme: ThemeData(
            primarySwatch: FLColors.primarySwatch,
            buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: FLColors.primarySwatch)
            )
        ),
        home: MyHomePage(title: 'FLUI'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FLLoadingButtonState> _loginKey = GlobalKey<FLLoadingButtonState>();
  final GlobalKey<EditableTextState> _editableTextKey = GlobalKey<EditableTextState>();

  EditableTextState get _editableText => _editableTextKey.currentState;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _handleLogin() {
    _loginKey.currentState.startLoading();
    Future.delayed(const Duration(seconds: 3), () {
      _loginKey.currentState.stopLoading();
    });
  }

  handleMenuSelected(value) {
    logger.d(value);
  }

  handleMenuCanceled() {
    logger.d('menu canceled');
  }

  _handleLoadingToast() {
    Function hideToast = FLToast.loading(text: 'loading...');
    Future.delayed(Duration(seconds: 2),() {
      hideToast();
      FLToast.success(text: 'success!');
    });
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = 'hello';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FLCopyableLabel(
                    showMenu: true,
                    afterCopyCallback: () {
                      logger.d('copy done');
                    },
                    copyData: 'Hanran',
                    child: Text('Hanran'),
                  ),
                  SizedBox(height: 20),
                  FLLoadingButton(
                    key: _loginKey,
                    onPressed: _handleLogin,
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.blue.withAlpha(150),
                    indicatorColor: Colors.white,
                    disabledTextColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  FLBubbleWidget(
                      from: FLBubbleFrom.left,
                      backgroundColor: Colors.lightGreen,
                      child: Container(
                        width: 200,
                        child: Text('bubble widget dfasdfasdfasfasdfasdfsdfasdfasd',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                  ),
                  SizedBox(height: 20),
                  FLMarqueeLabel(
                    text: 'this is marquee, round & round & round & round & round & round',
                    backgroundColor: Colors.amberAccent,
                    space: 400,
                    velocity: 1,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  FLRaisedButton(
                    child: Text('show info'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      FLToast.showInfo(text: 'show info', position: FLToastPosition.bottom);
                    },
                  ),
                  SizedBox(height: 20),
                  FLRaisedButton(
                    child: Text('show success'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      FLToast.showSuccess(text: 'show success');
                    },
                  ),
                  SizedBox(height: 20),
                  FLRaisedButton(
                    child: Text('show error'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      FLToast.showError();
                    },
                  ),
                  SizedBox(height: 20),
                  FLRaisedButton(
                    child: Text('show text'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      FLToast.showText(text: 'show text', position: FLToastPosition.top);
                    },
                  ),
                  SizedBox(height: 20),
                  FLRaisedButton(
                    child: Text('show loading'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: _handleLoadingToast,
                  )
            ]
          )
        )
      )
    );
  }
}
