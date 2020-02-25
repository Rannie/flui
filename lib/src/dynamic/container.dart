import 'dart:convert';

import 'package:flui/src/dynamic/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flui/src/dynamic/render_parser.dart';
import 'package:flui/src/dynamic/units/unit_model.dart';
import 'package:flui/src/dynamic/cache/cache.dart';

/// The container interface of dynamic widget
class FLDyContainer extends StatefulWidget {
  FLDyContainer({
    Key key,
    this.placeholder,
    this.jsonObject,
  })  : assert(placeholder != null || jsonObject != null),
        super(key: key);

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
      FLDyUnitModel unitModel = processJsonObject(widget.jsonObject);
      _renderContent = FLDyRenderParser.markupContent(unitModel);
    }
  }

  FLDyUnitModel processJsonObject(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    // convert json string to unit model
    if (jsonObj.runtimeType == String) {
      jsonObj = json.decode(jsonObj);
    }
    return FLDyUnitModel.fromJson(jsonObj);
  }

  void loadJson(dynamic jsonObj) {
    assert(debugJsonAndType(jsonObj));
    _loadJsonAndRender(jsonObj, null);
  }

  void loadCachedJson(String cacheKey) {
    assert(cacheKey != null);
    _loadJsonAndRender(null, cacheKey);
  }

  void _loadJsonAndRender(dynamic jsonObj, String cacheKey) {
    if (cacheKey != null) {
      jsonObj = FLDyCache.cache.jsonForKey(cacheKey);
      assert(debugJsonAndType(jsonObj));
    }
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
