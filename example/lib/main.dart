import 'package:example/button_defines.dart';
import 'package:example/raised_button.dart';
import 'package:example/style/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUI',
      theme: ThemeData(
        primarySwatch: FLColors.primarySwatch,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: MaterialButton(
                height: 40,
                minWidth: 300,
                color: Theme.of(context).primaryColor,
                textColor: Color(FLColors.textWhite),
                onPressed: () {
                  print('clicked');
                },
                child: Text('button'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FLRaisedIconButton(
                onPressed: () {
                  print('click raised');
                },
                spacing: 30,
                iconPosition: FLPosition.right,
                icon: Icon(Icons.access_time),
                label: Text('hello')
            )
          ],
        ),
      ),
    );
  }
}
