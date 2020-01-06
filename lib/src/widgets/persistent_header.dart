import 'package:flui/src/widgets/rendering/render_sliver_persistent_header.dart';
import 'package:flutter/material.dart';

typedef FLSliverPersistentHeaderBuilder =
    Widget Function(BuildContext context, FLPersistentHeaderState state);
typedef FLPersistentHeaderBuilder =
    Widget Function(BuildContext context, FLPersistentHeaderState state);

@immutable
class FLPersistentHeaderState {
  const FLPersistentHeaderState(
      this.scrollPercentage,
      this.pinning,
  ) : assert(scrollPercentage != null),
      assert(pinning != null);

  final double scrollPercentage;
  final bool pinning;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! FLPersistentHeaderState) return false;
    final FLPersistentHeaderState typedOther = other;
    return (scrollPercentage == typedOther.scrollPercentage
        && pinning == typedOther.pinning);
  }

  @override
  int get hashCode => hashValues(scrollPercentage, pinning);
}

class FLSliverPersistentHeaderWidget extends RenderObjectWidget {
  FLSliverPersistentHeaderWidget({
      Key key,
      this.header,
      this.content,
      this.overlapsContent = false,
      this.reverse = false,
      this.headerTop = 0,
  }) : super(key: key);

  /// The header widget for the sliver group
  final Widget header;

  /// The content slivers for the group
  final Widget content;

  /// When the custom scroll view is reversed, set this property to true can
  /// ensure the header still on the top
  final bool reverse;

  /// Whether the header should be to top of content
  /// Default is false
  final bool overlapsContent;

  /// The distance between header and the zero pos of viewport
  final double headerTop;

  @override
  FLSliverPersistentHeaderWidgetElement createElement() {
    return FLSliverPersistentHeaderWidgetElement(this);
  }

  @override
  FLRenderSliverPersistentHeader createRenderObject(BuildContext context) {
    return FLRenderSliverPersistentHeader(
      overlapsContent: overlapsContent
    );
  }

  @override
  void updateRenderObject(BuildContext context,
      FLRenderSliverPersistentHeader renderObject) {
    renderObject.overlapsContent = overlapsContent;
  }
}

class FLSliverPersistentHeaderWidgetBuilder extends StatelessWidget {
  const FLSliverPersistentHeaderWidgetBuilder({
    Key key,
    @required this.builder,
    this.content,
    this.reverse = false,
    this.overlapsContent = false,
    this.headerTop = 0,
  }) : super(key: key);

  /// Sliver header builder, include state
  final FLSliverPersistentHeaderWidgetBuilder builder;

  /// The content slivers for the group
  final Widget content;

  /// When the custom scroll view is reversed, set this property to true can
  /// ensure the header still on the top
  final bool reverse;

  /// Whether the header should be to top of content
  /// Default is false
  final bool overlapsContent;

  /// The distance between header and the zero pos of viewport
  final double headerTop;

  @override
  Widget build(BuildContext context) {
    return FLSliverPersistentHeaderWidget(
      content: content,
      reverse: reverse,
      overlapsContent: overlapsContent,
      headerTop: headerTop,
      header: null,
    );
  }
}

class FLSliverPersistentHeaderWidgetElement extends RenderObjectElement {
  FLSliverPersistentHeaderWidgetElement(
      FLSliverPersistentHeaderWidget widget) : super(widget);

  @override
  FLSliverPersistentHeaderWidget get widget => super.widget;

  Element _header;
  Element _content;

  @override
  void visitChildren(visitor) {
    if (_header != null) visitor(_header);
    if (_content != null) visitor(_content);
  }

  @override
  void forgetChild(Element child) {
    if (child == _header) _header = null;
    if (child == _content) _content = null;
  }

  @override
  void mount(Element parent, newSlot) {
    super.mount(parent, newSlot);
    _header = updateChild(_header, widget.header, 0);
    _content = updateChild(_content, widget.content, 1);
  }

  @override
  void update(FLSliverPersistentHeaderWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _header = updateChild(_header, widget.header, 0);
    _content = updateChild(_content, widget.content, 1);
  }

  @override
  void insertChildRenderObject(RenderObject child, slot) {
    final FLRenderSliverPersistentHeader renderObject = this.renderObject;
    if (slot == 0) renderObject.header = child;
    if (slot == 1) renderObject.content = child;
    assert(renderObject == this.renderObject);
  }

  @override
  void moveChildRenderObject(RenderObject child, slot) {}

  @override
  void removeChildRenderObject(RenderObject child) {
    final FLRenderSliverPersistentHeader renderObject = this.renderObject;
    if (renderObject.header == child) renderObject.header = null;
    if (renderObject.content == child) renderObject.content = null;
    assert(renderObject == this.renderObject);
  }
}
