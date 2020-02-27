import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flui/flui.dart';

part 'action.g.dart';

typedef FLDyActionHandler =
  Function(BuildContext context, String uniqueId, List<String> args);

class FLDyActionType {
  static const String builtin = 'builtin';
  static const String custom = 'custom';
}

class FLDyNavigatorAction {
  static const String pushNamed = 'pushNamed';
  static const String pop = 'pop';
}

class FLDyFrameworkAction {
  static const String textToast = 'textToast';
  static const String successToast = 'successToast';
  static const String errorToast = 'errorToast';
  static const String infoToast = 'infoToast';
}

@JsonSerializable()
/// Action Model
class FLDyAction {
  FLDyAction({
    this.actionType,
    this.action,
    this.args,
  });

  final String actionType;
  /// Builtin action use, like '@navigator.push'
  final String action;
  final List<String> args;

  factory FLDyAction.fromJson(Map<String, dynamic> json) =>
      _$FLDyActionFromJson(json);
  Map<String, dynamic> toJson() => _$FLDyActionToJson(this);
}


class FLDyActionDispatch {
  static final FLDyActionDispatch _instance = FLDyActionDispatch();
  static FLDyActionDispatch get dispatcher => _instance;

  final LinkedHashMap _customActionMap = new LinkedHashMap();

  void dispatchAction(String uniqueId, FLDyAction action, BuildContext context) {
    if (action == null) return;
    if (action.actionType == FLDyActionType.builtin) {
      _dispatchBuiltinAction(action, context);
    } else {
      _dispatchCustomAction(uniqueId, action, context);
    }
  }

  void registerActionHandler(String action, FLDyActionHandler handler) {
    assert(action != null && handler != null);
    _customActionMap[action] = handler;
  }

  void removeActionHandler(String action) {
    assert(action != null);
    _customActionMap.remove(action);
  }

  void _dispatchCustomAction(String uniqueId, FLDyAction action, BuildContext context) {
    FLDyActionHandler handler = _customActionMap[action.action];
    if (handler == null) return;
    handler(context, uniqueId, action.args);
  }

  void _dispatchBuiltinAction(FLDyAction action, BuildContext context) {
    String act = action.action;
    String descriptor = act?.split('.')?.last;
    if (act.startsWith('@navigator'))
    {
      switch (descriptor) {
        case FLDyNavigatorAction.pushNamed: {
          Navigator.pushNamed(context, action.args.first, arguments: action.args);
          break;
        }
        case FLDyNavigatorAction.pop: {
          Navigator.pop(context);
          break;
        }
      }
    }
    else if (act.startsWith('@flui'))
    {
      switch (descriptor) {
        case FLDyFrameworkAction.textToast: {
          FLToast.text(text: action.args.first);
          break;
        }
        case FLDyFrameworkAction.infoToast: {
          FLToast.info(text: action.args.first);
          break;
        }
        case FLDyFrameworkAction.successToast: {
          FLToast.success(text: action.args.first);
          break;
        }
        case FLDyFrameworkAction.errorToast: {
          FLToast.error(text: action.args.first);
          break;
        }
      }
    }
  }
}

