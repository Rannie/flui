import 'package:flutter/material.dart';

const Color _kDefaultImageHighlightColor = const Color(0X40FFFFFF);

class FLImage extends StatefulWidget {
  FLImage({
    Key key,
    @required this.image,
    this.highlightImage,
    this.borderRadius,
    this.imageWidth,
    this.imageHeight,
    this.fit,
    this.splashColor,
    this.highlightColor,
    this.onPressed,
  }) : assert(image != null),
       super(key: key);

  final ImageProvider image;
  final ImageProvider highlightImage;
  final BorderRadius borderRadius;
  final double imageWidth;
  final double imageHeight;
  final BoxFit fit;
  final Color splashColor;
  final Color highlightColor;
  final VoidCallback onPressed;

  @override
  State<FLImage> createState() => _FLImageState();
}

class _FLImageState extends State<FLImage> {
  ImageProvider _contentImage;

  @override
  void initState() {
    super.initState();
    _contentImage = widget.image;
  }

  void _handleHighlightChanged(bool highlight) {
    if (widget.highlightImage != null) {
      if (highlight) {
        setState(() {
          _contentImage = widget.highlightImage;
        });
      } else {
        setState(() {
          _contentImage = widget.image;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color highlightColor = widget.highlightColor ?? _kDefaultImageHighlightColor;
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Container(
        width: widget.imageWidth,
        height: widget.imageHeight,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image(
                  image: _contentImage,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                  fit: widget.fit,
                )
            ),
            Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onHighlightChanged: _handleHighlightChanged,
                    splashColor: widget.splashColor,
                    highlightColor: highlightColor,
                    onTap: widget.onPressed,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}