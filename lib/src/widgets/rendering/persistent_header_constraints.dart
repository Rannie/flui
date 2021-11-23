import 'package:flutter/material.dart';

import '../../../flui_nullsafety.dart';

class FLPersistentHeaderConstraints extends BoxConstraints {
  FLPersistentHeaderConstraints({
    required this.state,
    required BoxConstraints boxConstraints,
  })  : super(
          minWidth: boxConstraints.minWidth,
          maxWidth: boxConstraints.maxWidth,
          minHeight: boxConstraints.minHeight,
          maxHeight: boxConstraints.maxHeight,
        );

  final FLPersistentHeaderState state;

  @override
  bool get isNormalized =>
      state.scrollPercentage >= 0.0 &&
      state.scrollPercentage <= 1.0 &&
      super.isNormalized;

  @override
  bool operator ==(dynamic other) {
    assert(debugAssertIsValid());
    if (identical(this, other)) return true;
    if (other is! FLPersistentHeaderConstraints) return false;
    final FLPersistentHeaderConstraints typedOther = other;
    assert(typedOther.debugAssertIsValid());
    return state == typedOther.state &&
        minWidth == typedOther.minWidth &&
        maxWidth == typedOther.maxWidth &&
        minHeight == typedOther.minHeight &&
        maxHeight == typedOther.maxHeight;
  }

  @override
  int get hashCode {
    assert(debugAssertIsValid());
    return hashValues(minWidth, maxWidth, minHeight, maxHeight, state);
  }
}
