import 'package:example/action_sheet.dart';
import 'package:example/operation_sheet.dart';
import 'package:example/raised_button.dart';
import 'package:example/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetPage extends StatefulWidget {
  static const String routeName = '/action-sheet';
  @override
  State<ActionSheetPage> createState() => _ActionSheetPageState();
}

class _ActionSheetPageState extends State<ActionSheetPage> {
  Widget _buildActionSheetContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/poster.png'),
          SizedBox(height: 15),
          Text(
            'Flutter Interact is here! Check out the livestream.\nFlutter 1.12 is live! Check out the latest announcement and see what\'s new on the site.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                width: 200,
                child: FLRaisedButton(
                  textColor: Colors.white,
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FLCupertinoActionSheet(
                            style: FLCupertinoActionSheetStyle.filled,
                            child: _buildActionSheetContent(),
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          );
                        }).then((value) {
                      print(value);
                    });
                  },
                  child: Text('ActionSheet - Filled'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: FLRaisedButton(
                  textColor: Colors.white,
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FLCupertinoActionSheet(
                            child: _buildActionSheetContent(),
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          );
                        }).then((value) {
                      print(value);
                    });
                  },
                  child: Text('ActionSheet - Rounded'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                child: FLRaisedButton(
                  textColor: Colors.white,
                  child: Text('OperationSheet'),
                  onPressed: () {
                    showFLBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FLCupertinoOperationSheet(
                            backgroundColor: Color(0xFFFAFAFA),
                            sheetStyle: FLCupertinoActionSheetStyle.filled,
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                            header: Container(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                              child: Text('Share', style: TextStyle(color: Colors.blueGrey, fontSize: 18)),
                            ),
                            itemList: [
                              [
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/google.png',
                                  title: 'Google',
                                  onPressed: () {
                                    Navigator.pop(context, 'Google');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/share_friend.png',
                                  title: 'Wechat',
                                  onPressed: () {
                                    Navigator.pop(context, 'Wechat');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/instagram.png',
                                  title: 'Instagram',
                                  onPressed: () {
                                    Navigator.pop(context, 'Instagram');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/twitter.png',
                                  title: 'Twitter',
                                  onPressed: () {
                                    Navigator.pop(context, 'Twitter');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/whatsapp.png',
                                  title: 'Whatsapp',
                                  onPressed: () {
                                    Navigator.pop(context, 'Whatsapp');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/word.png',
                                  title: 'Office',
                                  onPressed: () {
                                    Navigator.pop(context, 'Office');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/share_weibo.png',
                                  title: 'Weibo',
                                  onPressed: () {
                                    Navigator.pop(context, 'Weibo');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/omnifocus.png',
                                  title: 'Omni',
                                  onPressed: () {
                                    Navigator.pop(context, 'Omni');
                                  },
                                ),
                              ],
                              [
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/messages.png',
                                  title: 'Messages',
                                  onPressed: () {
                                    Navigator.pop(context, 'Messages');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/mail.png',
                                  title: 'Mail',
                                  onPressed: () {
                                    Navigator.pop(context, 'Mail');
                                  },
                                ),
                                FLCupertinoOperationSheetItem(
                                  imagePath: 'assets/keynote.png',
                                  title: 'Keynote',
                                  onPressed: () {
                                    Navigator.pop(context, 'Keynote');
                                  },
                                ),
                              ]
                            ],
                          );
                        }
                    ).then((value) => FLToast.info(text: value));
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}