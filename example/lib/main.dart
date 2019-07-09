import 'package:example/bubble.dart';
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

  bool _loading = false;

  _handleLoading() {
    setState(() {
      _loading = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            Container(
                width: 300,
                margin: EdgeInsets.all(20),
                child: EditableText(
                  controller: _textEditingController,
                  focusNode: FocusNode(),
                  cursorColor: Colors.lightBlue,
                  backgroundCursorColor: Colors.lightBlue,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  selectionControls: cupertinoTextSelectionControls,
                )
            ),
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
