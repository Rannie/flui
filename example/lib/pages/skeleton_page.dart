import 'package:example/skeleton.dart';
import 'package:flutter/material.dart';

class SkeletonPage extends StatefulWidget {
  static const String routeName = '/skeleton';

  @override
  State<SkeletonPage> createState() => _SkeletonState();
}

class _SkeletonState extends State<SkeletonPage> {
  bool _active = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: EdgeInsets.only(top: 10, left: 10),
                active: _active,
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 10, right: 10),
                active: _active,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                type: FLSkeletonAnimationType.stretch,
                margin: EdgeInsets.only(left: 60, top: 40),
                width: 300,
                stretchWidth: 150,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                type: FLSkeletonAnimationType.stretch,
                margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
                width: 100,
                stretchWidth: 200,
                height: 20,
              ),
            ],
          ),
        )
      ),
    );
  }
}