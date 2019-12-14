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
                textColor: Colors.white,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
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
                textColor: Colors.white,
                child: Text('operation sheet'),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
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
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              )
                            ],
                            [
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Friends',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              ),
                              FLCupertinoOperationSheetItem(
                                imagePath: 'assets/share_friend.png',
                                title: 'Wechat',
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                              )
                            ]
                          ],
                        );
                      }
                  );
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                textColor: Colors.white,
                child: Text('show cupertino action sheet'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: Text('提示', style: TextStyle(fontSize: 22),), //标题
                        message: Text('麻烦抽出几分钟对该软件进行评价，谢谢!'), //提示内容
                        actions: <Widget>[ //操作按钮集合
                          CupertinoActionSheetAction(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('给个好评'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('我要吐槽'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction( //取消按钮
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('取消'),
                        ),
                      );
                    },
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