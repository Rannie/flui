import 'package:flutter/material.dart';

const Color _kDefaultImageHighlightColor = Color(0X40FFFFFF);

class FLImage extends StatefulWidget {
  const FLImage({
    Key? key,
    required this.image,
    this.highlightImage,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
    this.loadingBuilder,
    this.frameBuilder,
    this.alignment = Alignment.center,
    this.imageRepeat = ImageRepeat.noRepeat,
    this.colorBlendMode,
    this.filterQuality = FilterQuality.low,
    this.splashColor,
    this.highlightColor,
    this.onPressed,
  })  : super(key: key);

  final ImageProvider image;
  final ImageProvider? highlightImage;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageLoadingBuilder? loadingBuilder;
  final ImageFrameBuilder? frameBuilder;
  final AlignmentGeometry alignment;
  final ImageRepeat imageRepeat;
  final BlendMode? colorBlendMode;
  final FilterQuality filterQuality;
  final Color? splashColor;
  final Color? highlightColor;
  final VoidCallback? onPressed;

  @override
  State<FLImage> createState() => _FLImageState();
}

class _FLImageState extends State<FLImage> {
  ImageProvider? _contentImage;

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
    Color highlightColor =
        widget.highlightColor ?? _kDefaultImageHighlightColor;
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image(
              image: _contentImage!,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              loadingBuilder: widget.loadingBuilder,
              frameBuilder: widget.frameBuilder,
              alignment: widget.alignment,
              repeat: widget.imageRepeat,
              colorBlendMode: widget.colorBlendMode,
              filterQuality: widget.filterQuality,
            )),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                onHighlightChanged: _handleHighlightChanged,
                splashColor: widget.splashColor,
                highlightColor: highlightColor,
                onTap: widget.onPressed,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
