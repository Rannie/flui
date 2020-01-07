import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class PersistentHeaderPage extends StatefulWidget {
  static const String routeName = '/persistent-header';

  @override
  State<StatefulWidget> createState() => _PersistentHeaderPageState();
}

class _PersistentHeaderPageState extends State<PersistentHeaderPage> {
  List<Widget> _buildSlivers() {
    List<Widget> children = [
      _buildGroup(1),
      _buildGroup(2),
      _buildGroup(3),
      _buildGroup(4)
    ];
    return children;
  }

  Widget _buildGroup(int headerIndex) {
    ThemeData themeData = Theme.of(context);
    return FLSliverPersistentHeaderWidgetBuilder(
      overlapsContent: false,
      builder: (context, state) {
        return Container(
          color: themeData.brightness == Brightness.light
              ? Color.fromRGBO(246, 246, 246, 1)
              : themeData.cardColor,
          height: 50,
          child: Row(
            children: <Widget>[
              SizedBox(width: 15),
              Text('Header #$headerIndex')
            ],
          ),
        );
      },
      content: SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, i) => FLListTile(
                  leading: CircleAvatar(
                    child: Text('${i + 1}'),
                  ),
                  title: Text('List tile ${i + 1}'),
                ),
            childCount: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistent Header'),
      ),
      body: CustomScrollView(
        slivers: _buildSlivers(),
      ),
    );
  }
}
