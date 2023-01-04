import 'dart:math';

import 'package:flutter/material.dart';

class FLAvatar extends StatelessWidget {
  const FLAvatar(
      {Key? key,
      this.image,
      this.color,
      this.text,
      this.textStyle,
      this.width,
      this.height,
      this.radius,
      this.onTap})
      : super(key: key);

  final Image? image;

  /// Only use color for image == null.
  final Color? color;
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  /// Default is width / 2, if width is null, radius = 1.
  final double? radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final double rad = radius ?? (width != null ? max(width! / 2, 1) : 1);
    final bool isImageAva = image != null;
    final Widget? content = isImageAva ? image : Text(text!, style: textStyle);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(rad)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: isImageAva ? null : color,
          width: width,
          height: height,
          child: Center(
            child: content,
          ),
        ),
      ),
    );
  }
}
