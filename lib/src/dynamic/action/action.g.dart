// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FLDyAction _$FLDyActionFromJson(Map<String, dynamic> json) {
  return FLDyAction(
    actionType: json['actionType'] as String,
    action: json['action'] as String,
    args: (json['args'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$FLDyActionToJson(FLDyAction instance) =>
    <String, dynamic>{
      'actionType': instance.actionType,
      'action': instance.action,
      'args': instance.args,
    };
