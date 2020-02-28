import 'package:flutter/material.dart';
import 'package:flui/flui.dart';
import 'package:url_launcher/url_launcher.dart';
import '../json_strings.dart';

class DyRichTextPage extends StatefulWidget {
  static const String routeName = '/dy-richtext';
  @override
  State<DyRichTextPage> createState() => DyRichTextPageState();
}

class DyRichTextPageState extends State<DyRichTextPage> {
  @override
  void initState() {
    super.initState();
    FLDyActionDispatch.dispatcher.registerActionHandler('press-link',
        (BuildContext context, String uniqueId, List args) {
          String siteUrl = args.first;
          canLaunch(siteUrl).then((canOpen) {
            launch(siteUrl, forceSafariVC: false);
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    FLDyActionDispatch.dispatcher.removeActionHandler('press-link');
  }

  @override
  Widget build(BuildContext context) {
    final GestureDetector detector = null;
    final InkWell inkWell = null;
    return Scaffold(
      appBar: AppBar(
        title: Text('Rich Text'),
      ),
      body: FLDyContainer(
        jsonObject: RichTextJson,
        placeholder: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}