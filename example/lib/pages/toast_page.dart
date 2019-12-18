import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flui/flui.dart';
import 'package:example/style/style.dart';
import 'package:example/event.dart';

class ToastPage extends StatefulWidget {
  static const String routeName = '/toast';

  @override
  State<ToastPage> createState() => _ToastPageState();
}

const Color lightBG = Colors.white;
const Color darkBG = Colors.black;
const Color lightBarBG = FLColors.primaryColor;
const Color darkBarBG = Color(0xFF161616);
const Color darkButtonBG = Color.fromRGBO(28, 28, 30, 1);

class _ToastPageState extends State<ToastPage> {
  bool _darkMode = false;
  FLToastStyle _toastStyle = FLToastStyle.dark;
  FLToastPosition _toastPosition = FLToastPosition.center;

  @override
  void dispose() {
    super.dispose();
    eventBus.fire('reset');
  }
  
  @override
  Widget build(BuildContext context) {
    Widget inset = SizedBox(height: 15);
    Color buttonColor = _darkMode ? darkButtonBG : lightBG;
    Color textColor = _darkMode ? lightBG : lightBarBG;
    TextStyle textStyle = TextStyle(fontSize: 15);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _darkMode ? darkBarBG : lightBarBG,
          title: FLAppBarTitle(
            title: 'Toast',
          ),
          centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _darkMode ? darkBG : lightBG,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Text Toast', style: textStyle),
                    onPressed: () => FLToast.text(text: 'Here is text'),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Loading Toast', style: textStyle),
                    onPressed: () {
                      var dismiss = FLToast.loading(text: 'Loading...');
                      Future.delayed(Duration(seconds: 2), () {
                        dismiss();
                      });
                    },
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Success Toast', style: textStyle),
                    onPressed: () => FLToast.success(text: 'Fetch success'),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Info Toast', style: textStyle),
                    onPressed: () => FLToast.info(text: 'Some info'),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Error Toast', style: textStyle),
                    onPressed: () => FLToast.error(text: 'Something was wrong'),
                  ),
                ),
                inset,
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Position Top', style: textStyle),
                    onPressed: () => setState(() {
                      _toastPosition = FLToastPosition.top;
                      eventBus.fire(FLToastDefaults(style: _toastStyle, position: _toastPosition));
                    }),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Position Center', style: textStyle),
                    onPressed: () => setState(() {
                      _toastPosition = FLToastPosition.center;
                      eventBus.fire(FLToastDefaults(style: _toastStyle, position: _toastPosition));
                    }),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text('Position Bottom', style: textStyle),
                    onPressed: () => setState(() {
                      _toastPosition = FLToastPosition.bottom;
                      eventBus.fire(FLToastDefaults(style: _toastStyle, position: _toastPosition));
                    }),
                  ),
                ),
                inset,
                SizedBox(
                  width: 220,
                  child: OutlineButton(
                    color: buttonColor,
                    textColor: textColor,
                    child: Text(_darkMode ? 'Light Mode' : 'Dark Mode', style: textStyle),
                    onPressed: () => setState(() {
                      _darkMode = !_darkMode;
                      _toastStyle = _darkMode ? FLToastStyle.light : FLToastStyle.dark;
                      eventBus.fire(FLToastDefaults(style: _toastStyle, position: _toastPosition));
                    }),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}