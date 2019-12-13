import 'package:example/skeleton.dart';
import 'package:flutter/material.dart';

class SkeletonPage extends StatefulWidget {
  static const String routeName = '/skeleton';

  @override
  State<SkeletonPage> createState() => _SkeletonState();
}

class _SkeletonState extends State<SkeletonPage> {
  Widget _buildSection(String title, Widget content) {
    return Column(
      children: <Widget>[
        Container(
          color: Color.fromRGBO(246, 246, 246, 1),
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 56,
          child: Row(
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.blueGrey, fontSize: 17)),
            ],
          ),
        ),
        content
      ],
    );
  }

  Widget _buildNormalContent() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: EdgeInsets.only(top: 10, left: 10),
                active: false,
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 10, right: 10),
                active: false,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 40),
                active: false,
                width: 300,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
                active: false,
                width: 100,
                height: 20,
              ),
            ],
          ),
        )
    );
  }

  Widget _buildShimmerContent() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: EdgeInsets.only(top: 10, left: 10),
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 10, right: 10),
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 40),
                width: 300,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: EdgeInsets.only(left: 60, top: 70, bottom: 10),
                width: 100,
                height: 20,
              ),
            ],
          ),
        )
    );
  }

  Widget _buildStretchContent() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                FLSkeleton(
                  shape: BoxShape.circle,
                  margin: EdgeInsets.only(top: 10, left: 10),
                  active: false,
                  width: 40,
                  height: 40,
                ),
                FLSkeleton(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                  type: FLSkeletonAnimationType.stretch,
                  margin: EdgeInsets.only(left: 60, top: 10, right: 10),
                  height: 20,
                  width: 320,
                  stretchWidth: 100,
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
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skeleton Page'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildSection('Shimmer', _buildShimmerContent()),
            _buildSection('Stretch', _buildStretchContent()),
            _buildSection('No Animation', _buildNormalContent()),
          ],
        ),
      )
    );
  }
}