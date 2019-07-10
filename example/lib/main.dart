import 'package:example/bubble.dart';
import 'package:example/loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:example/style/style.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

Logger logger = Logger();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUI',
      theme: ThemeData(
        primarySwatch: FLColors.primarySwatch,
        buttonTheme: ButtonThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: FLColors.primarySwatch)
        )
      ),
      home: MyHomePage(title: 'FLUI'),
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

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = 'hello';
//    Future.delayed(Duration(seconds: 2), () {
//      showMenu(
//          context: context,
//          position: RelativeRect.fromLTRB(100, 100, 100, 400),
//          items: [
//            PopupMenuItem<String>(
//              value: '1',
//              child: const Text('Context menu item one'),
//            ),
//          ]
//      );
//    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
            Container(
              width: 200,
              child: Text('bubble widget dfasdfasdfasfasdfasdfsdfasdfasd',
                style: TextStyle(color: Colors.blue),
              ),
            )
          ]
        )
      )
    );
  }
}
