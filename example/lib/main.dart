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
          colorScheme: ColorScheme.fromSwatch()
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
    ButtonThemeData buttonTheme = ButtonTheme.of(context);
    logger.d(buttonTheme);

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
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                logger.d('native flat clicked');
              },
              child: Text('native flatbutton'),
            ),
            SizedBox(
              height: 10,
            ),
            FLFlatButton.icon(
              onPressed: ()  {
                logger.d('icon click');
              },
              spacing: 30,
              iconPosition: FLPosition.right,
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
                spacing: 30,
                elevation: 40,
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
