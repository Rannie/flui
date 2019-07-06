import 'package:example/gradient_button.dart';

import 'common/defines.dart';
import 'package:example/flat_button.dart';
import 'package:example/raised_button.dart';
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
            FLFlatButton(
              expanded: true,
              onPressed: () {
                logger.d('expand button click');
              },
              child: Text('fl flat button', textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 10,
            ),
            FLGradientButton.linear(
              colors: [Colors.red, Colors.purple],
              onPressed: () {
                logger.d('click gradient button xxxxx');
              },
              child: Text('gradient button'),
              textColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              child: FLGradientButton.radial(
                elevation: 10,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
                colors: [Theme.of(context).primaryColorLight, Theme.of(context).primaryColor],
                onPressed: () {
                  logger.d('click radial gradient button');
                },
                child: Text('radial'),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FLFlatButton.icon(
              onPressed: ()  {
                logger.d('icon click');
              },
              iconPosition: FLPosition.top,
              icon: Icon(Icons.access_time),
              label: Text('hello')
            ),
            SizedBox(
              height: 10,
            ),
            FLRaisedButton.icon(
                onPressed: () {
                  logger.d('click raised');
                },
                spacing: 10,
                elevation: 10,
                iconPosition: FLPosition.right,
                icon: Icon(Icons.access_time),
                label: Text('hello'),
            )
          ],
        ),
      ),
    );
  }
}
