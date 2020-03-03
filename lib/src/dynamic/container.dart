import 'dart:convert';

import 'package:flui/src/dynamic/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/render_parser.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';

/// The container interface of dynamic widget
class FLDyContainer extends StatefulWidget {
  FLDyContainer({
    Key key,
    this.placeholder,
    this.jsonObject,
  })  : assert(placeholder != null || jsonObject != null),
        super(key: key) {
    FLDyLogger.logStartTime();
  }

  final Widget placeholder;
  final dynamic jsonObject;

  @override
  State<FLDyContainer> createState() => FLDyContainerState();
}

class FLDyContainerState extends State<FLDyContainer> {
  Widget _renderContent;

  @override
  void initState() {
    super.initState();
    if (widget.jsonObject != null) {
      FLDyLogger.logStartTime();
      FLDyUnitModel unitModel = processJsonObject(widget.jsonObject);
      FLDyLogger.logEndTime('serialization');
      _renderContent = FLDyRenderParser.markupContent(unitModel);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FLDyLogger.logEndTime('total');
    });
  }

  FLDyUnitModel processJsonObject(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    // convert json string to unit model
    if (jsonObj is String) {
      jsonObj = json.decode(jsonObj);
    } else if (jsonObj is FLDyUnitModel) {
      return jsonObj;
    }
    return FLDyUnitModel.fromJson(jsonObj);
  }

  void loadJson(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    _loadJsonAndRender(jsonObj);
  }

  void _loadJsonAndRender(dynamic jsonObj) {
    FLDyUnitModel unitModel = processJsonObject(jsonObj);
    // mark up content
    setState(() {
      _renderContent = FLDyRenderParser.markupContent(unitModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    FLDyLogger.log('build dynamic container');
    return _renderContent ?? widget.placeholder;
  }
}

bool debugJsonAndType(dynamic jsonObj) {
  if (jsonObj == null) return false;
  if (jsonObj.runtimeType != Map && jsonObj.runtimeType != String) {
    throw FlutterError(
        '[FLUI Dyanmic]: "loadJsonAndRender" method needs to pass a parameter of String or Map');
  }
  return true;
}
