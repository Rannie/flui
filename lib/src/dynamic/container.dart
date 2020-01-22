import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/parser.dart';

/// The container interface of dynamic widget
class FLDyContainer extends StatefulWidget {
  FLDyContainer({
    Key key,
    this.placeholder,
    this.jsonModel,
  }) : super(key: key);

  final FLDyJsonModel jsonModel;
  final Widget placeholder;

  @override
  State<FLDyContainer> createState() => FLDyContainerState();
}

class FLDyContainerState extends State<FLDyContainer> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}