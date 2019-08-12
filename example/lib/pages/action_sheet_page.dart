import 'package:example/action_sheet.dart';
import 'package:example/operation_sheet.dart';
import 'package:example/raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetPage extends StatefulWidget {
  static const String routeName = '/action-sheet';
  @override
  State<ActionSheetPage> createState() => _ActionSheetPageState();
}

class _ActionSheetPageState extends State<ActionSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aciont Sheet'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              FLRaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return FLCupertinoActionSheet(
                          style: FLCupertinoActionSheetStyle.filled,
                          child: Container(
                            height: 150,
                            child: Text('action sheet test',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13, decoration: TextDecoration.none
                                )
                            ),
                          ),
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
                child: Text('action sheet'),
              ),
              SizedBox(height: 20),
              FLRaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('operation sheet'),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return FLCupertinoOperationSheet(
                          cancelButton: CupertinoActionSheetAction(
                            child: const Text('Cancel'),
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.pop(context, 'Cancel');
                            },
                          ),
                          itemList: [
                            [
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Friends',
                                onPressed: () {
                                  print('click wechat');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  print('click wechat');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  print('click wechat');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  print('click wechat');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  print('click wechat');
                                },
                              )
                            ],
                            [
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Friends',
                                onPressed: () {
                                  print('click wechat');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  print('click wechat');
                                },
                              )
                            ]
                          ],
                        );
                      }
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}