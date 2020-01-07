import 'package:flui/src/widgets/rendering/persistent_header_constraints.dart';
import 'package:flui/src/widgets/rendering/persistent_header_layout_builder.dart';
import 'package:flui/src/widgets/rendering/render_sliver_persistent_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef FLSliverPersistentHeaderBuilder = Widget Function(
    BuildContext context, FLPersistentHeaderState state);

@immutable
class FLPersistentHeaderState {
  const FLPersistentHeaderState(
    this.scrollPercentage,
    this.pinning,
  )   : assert(scrollPercentage != null),
        assert(pinning != null);

  final double scrollPercentage;
  final bool pinning;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! FLPersistentHeaderState) return false;
    final FLPersistentHeaderState typedOther = other;
    return (scrollPercentage == typedOther.scrollPercentage &&
        pinning == typedOther.pinning);
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
  }) : super(key: key);

  /// The header widget for the sliver group
  final Widget header;

  /// The content slivers for the group
  final Widget content;

  /// Whether the header should be to top of content
  /// Default is false
  final bool overlapsContent;

  @override
  FLSliverPersistentHeaderWidgetElement createElement() {
    return FLSliverPersistentHeaderWidgetElement(this);
  }

  @override
  FLRenderSliverPersistentHeader createRenderObject(BuildContext context) {
    return FLRenderSliverPersistentHeader(overlapsContent: overlapsContent);
  }

  @override
  void updateRenderObject(
      BuildContext context, FLRenderSliverPersistentHeader renderObject) {
    renderObject.overlapsContent = overlapsContent;
  }
}

class FLSliverPersistentHeaderWidgetBuilder extends StatelessWidget {
  const FLSliverPersistentHeaderWidgetBuilder({
    Key key,
    @required this.builder,
    this.content,
    this.overlapsContent = false,
  }) : super(key: key);

  /// Sliver header builder, include state
  final FLSliverPersistentHeaderBuilder builder;

  /// The content slivers for the group
  final Widget content;

  /// Whether the header should be to top of content
  /// Default is false
  final bool overlapsContent;

  @override
  Widget build(BuildContext context) {
    return FLSliverPersistentHeaderWidget(
      content: content,
      overlapsContent: overlapsContent,
      header: FLPersistentHeaderLayoutBuilder(
          builder: (context, constraints) =>
              builder(context, constraints.state)),
    );
  }
}

class FLSliverPersistentHeaderWidgetElement extends RenderObjectElement {
  FLSliverPersistentHeaderWidgetElement(FLSliverPersistentHeaderWidget widget)
      : super(widget);

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

typedef Widget FLPersistentHeaderLayoutWidgetBuilder(
    BuildContext context, FLPersistentHeaderConstraints constraints);

class FLPersistentHeaderLayoutBuilder extends RenderObjectWidget {
  FLPersistentHeaderLayoutBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final FLPersistentHeaderLayoutWidgetBuilder builder;

  @override
  RenderObjectElement createElement() {
    return _FLPersistentHeaderLayoutBuilderElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return FLRenderPersistentHeaderLayoutBuilder();
  }
}

class _FLPersistentHeaderLayoutBuilderElement extends RenderObjectElement {
  _FLPersistentHeaderLayoutBuilderElement(RenderObjectWidget widget)
      : super(widget);

  @override
  FLPersistentHeaderLayoutBuilder get widget => super.widget;

  @override
  FLRenderPersistentHeaderLayoutBuilder get renderObject => super.renderObject;

  Element _child;

  @override
  void visitChildren(visitor) {
    if (_child != null) visitor(_child);
  }

  @override
  void forgetChild(Element child) {
    assert(child == _child);
    _child = null;
  }

  @override
  void mount(Element parent, newSlot) {
    super.mount(parent, newSlot);
    renderObject.callback = _layout;
  }

  @override
  void unmount() {
    renderObject.callback = null;
    super.unmount();
  }

  @override
  void update(RenderObjectWidget newWidget) {
    assert(widget != newWidget);
    super.update(newWidget);
    assert(widget == newWidget);
    renderObject.callback = _layout;
    renderObject.markNeedsLayout();
  }

  @override
  void performRebuild() {
    renderObject.markNeedsLayout();
    super.performRebuild();
  }

  void _layout(FLPersistentHeaderConstraints constraints) {
    owner.buildScope(this, () {
      Widget built;
      if (widget.builder != null) {
        try {
          built = widget.builder(this, constraints);
          debugWidgetBuilderValue(widget, built);
        } catch (e, stack) {
          built = ErrorWidget.builder(
              _debugReportException('building $widget', e, stack));
        }
      }

      try {
        _child = updateChild(_child, built, null);
        assert(_child != null);
      } catch (e, stack) {
        built = ErrorWidget.builder(
            _debugReportException('building $widget', e, stack));
        _child = updateChild(null, built, slot);
      }
    });
  }

  @override
  void insertChildRenderObject(RenderObject child, slot) {
    final RenderObjectWithChildMixin<RenderObject> renderObject =
        this.renderObject;
    assert(slot == null);
    assert(renderObject.debugValidateChild(child));
    renderObject.child = child;
    assert(renderObject == this.renderObject);
  }

  @override
  void moveChildRenderObject(RenderObject child, slot) {}

  @override
  void removeChildRenderObject(RenderObject child) {
    final FLRenderPersistentHeaderLayoutBuilder renderObject =
        this.renderObject;
    assert(renderObject.child == child);
    renderObject.child = null;
    assert(renderObject == this.renderObject);
  }
}

FlutterErrorDetails _debugReportException(
  String context,
  dynamic exception,
  StackTrace stack,
) {
  final FlutterErrorDetails details = new FlutterErrorDetails(
    exception: exception,
    stack: stack,
    library: 'flui widgets library',
    context: ErrorDescription('context'),
  );
  FlutterError.reportError(details);
  return details;
}
