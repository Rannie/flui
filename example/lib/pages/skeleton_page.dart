import 'page_util.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class SkeletonPage extends StatefulWidget {
  static const String routeName = '/skeleton';

  @override
  State<SkeletonPage> createState() => _SkeletonState();
}

class _SkeletonState extends State<SkeletonPage> {
  Widget _buildNormalContent() {
    TextDirection direction = Directionality.of(context);
    bool isRtl = direction == TextDirection.rtl;
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: isRtl
                    ? EdgeInsets.only(top: 10, right: 10)
                    : EdgeInsets.only(top: 10, left: 10),
                active: false,
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(left: 10, top: 10, right: 60)
                    : EdgeInsets.only(left: 60, top: 10, right: 10),
                active: false,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 40)
                    : EdgeInsets.only(left: 60, top: 40),
                active: false,
                width: 300,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 70, bottom: 10)
                    : EdgeInsets.only(left: 60, top: 70, bottom: 10),
                active: false,
                width: 100,
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget _buildShimmerContent() {
    TextDirection direction = Directionality.of(context);
    bool isRtl = direction == TextDirection.rtl;
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: isRtl
                    ? EdgeInsets.only(top: 10, right: 10)
                    : EdgeInsets.only(top: 10, left: 10),
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(left: 10, top: 10, right: 60)
                    : EdgeInsets.only(left: 60, top: 10, right: 10),
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 40)
                    : EdgeInsets.only(left: 60, top: 40),
                width: 300,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 70, bottom: 10)
                    : EdgeInsets.only(left: 60, top: 70, bottom: 10),
                width: 100,
                height: 20,
              ),
            ],
          ),
        ));
  }

  Widget _buildStretchContent() {
    TextDirection direction = Directionality.of(context);
    bool isRtl = direction == TextDirection.rtl;
    return Container(
        padding: EdgeInsets.all(10),
        child: Card(
            child: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              FLSkeleton(
                shape: BoxShape.circle,
                margin: isRtl
                    ? EdgeInsets.only(top: 10, right: 10)
                    : EdgeInsets.only(top: 10, left: 10),
                active: false,
                width: 40,
                height: 40,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                type: FLSkeletonAnimationType.stretch,
                margin: isRtl
                    ? EdgeInsets.only(left: 10, top: 10, right: 60)
                    : EdgeInsets.only(left: 60, top: 10, right: 10),
                height: 20,
                width: 320,
                stretchWidth: 100,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                type: FLSkeletonAnimationType.stretch,
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 40)
                    : EdgeInsets.only(left: 60, top: 40),
                width: 300,
                stretchWidth: 150,
                height: 20,
              ),
              FLSkeleton(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(2),
                type: FLSkeletonAnimationType.stretch,
                margin: isRtl
                    ? EdgeInsets.only(right: 60, top: 70, bottom: 10)
                    : EdgeInsets.only(left: 60, top: 70, bottom: 10),
                width: 100,
                stretchWidth: 200,
                height: 20,
              ),
            ],
          ),
        )));
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
              PageUtil.buildSection('Shimmer', _buildShimmerContent(), context),
              PageUtil.buildSection('Stretch', _buildStretchContent(), context),
              PageUtil.buildSection(
                  'No Animation', _buildNormalContent(), context),
            ],
          ),
        ));
  }
}
