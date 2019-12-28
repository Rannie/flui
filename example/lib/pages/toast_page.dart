import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:example/util.dart';

class ToastPage extends StatefulWidget {
  static const String routeName = '/toast';

  @override
  State<ToastPage> createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  FLToastStyle _toastStyle = FLToastStyle.dark;
  FLToastPosition _toastPosition = FLToastPosition.center;
  Function _hideCustomToast;

  @override
  void dispose() {
    super.dispose();
    Util.eventBus.fire('reset');
  }

  @override
  Widget build(BuildContext context) {
    if (_hideCustomToast != null) {
      _hideCustomToast();
      _hideCustomToast = null;
    }

    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Widget inset = SizedBox(height: 15);
    final TextStyle textStyle = isDarkMode
        ? TextStyle(fontSize: 15)
        : TextStyle(fontSize: 15, color: Theme.of(context).primaryColor);
    return Scaffold(
        appBar: AppBar(
          title: FLAppBarTitle(
            title: 'Toast',
          ),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Text Toast', style: textStyle),
                        onPressed: () => FLToast.text(text: 'Here is text'),
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
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
                        child: Text('Success Toast', style: textStyle),
                        onPressed: () => FLToast.success(text: 'Fetch success'),
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Info Toast', style: textStyle),
                        onPressed: () => FLToast.info(text: 'Some info'),
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Error Toast', style: textStyle),
                        onPressed: () =>
                            FLToast.error(text: 'Something was wrong'),
                      ),
                    ),
                    inset,
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        final Widget mic = Container(
                            padding: EdgeInsets.all(15),
                            child: Image.asset('assets/record.gif', scale: 2));

                        _hideCustomToast = FLToast.show(
                            text: 'Swipe up to cancel sending',
                            contentBuilder: (context) => mic);
                      },
                      onLongPressEnd: (LongPressEndDetails details) {
                        if (_hideCustomToast != null) {
                          _hideCustomToast();
                          _hideCustomToast = null;
                        }
                      },
                      child: Container(
                        width: 220,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withAlpha(100)),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Center(
                          child: Text('Custom Toast', style: textStyle),
                        ),
                      ),
                    ),
                    inset,
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Position Top', style: textStyle),
                        onPressed: () => setState(() {
                          _toastPosition = FLToastPosition.top;
                          Util.eventBus.fire(FLToastDefaults(
                              style: _toastStyle, position: _toastPosition));
                        }),
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Position Center', style: textStyle),
                        onPressed: () => setState(() {
                          _toastPosition = FLToastPosition.center;
                          Util.eventBus.fire(FLToastDefaults(
                              style: _toastStyle, position: _toastPosition));
                        }),
                      ),
                    ),
                    inset,
                    SizedBox(
                      width: 220,
                      child: OutlineButton(
                        child: Text('Position Bottom', style: textStyle),
                        onPressed: () => setState(() {
                          _toastPosition = FLToastPosition.bottom;
                          Util.eventBus.fire(FLToastDefaults(
                              style: _toastStyle, position: _toastPosition));
                        }),
                      ),
                    ),
                    inset,
                  ],
                )
              ],
            )));
  }
}
