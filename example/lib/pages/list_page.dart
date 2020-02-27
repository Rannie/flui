import 'persistent_header_page.dart';
import 'static_list_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const String routeName = '/list';

  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              width: 200,
              child: RaisedButton(
                child: Text('Static List'),
                onPressed: () {
                  Navigator.pushNamed(context, StaticListViewPage.routeName);
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 200,
              child: RaisedButton(
                child: Text('Persistent Header'),
                onPressed: () {
                  Navigator.pushNamed(context, PersistentHeaderPage.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
