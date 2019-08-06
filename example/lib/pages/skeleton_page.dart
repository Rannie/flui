import 'package:example/skeleton.dart';
import 'package:flutter/material.dart';

class SkeletonPage extends StatefulWidget {
  static const String routeName = '/skeleton';

  @override
  State<SkeletonPage> createState() => _SkeletonState();
}

class _SkeletonState extends State<SkeletonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton Page'),
      ),
      body: Container(
        child: FLSkeleton(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          height: 30,
        ),
      ),
    );
  }
}