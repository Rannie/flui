import 'package:flui/flui.dart';
import 'package:flui/src/widgets/rendering/persistent_header_constraints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class FLRenderSliverPersistentHeader extends RenderSliver
    with RenderSliverHelpers {
  FLRenderSliverPersistentHeader({
    RenderObject header,
    RenderSliver content,
    overlapsContent: false,
  }) {
    _overlapsContent = overlapsContent;
    this.header = header;
    this.content = content;
  }

  FLPersistentHeaderState _oldState;
  double _headerExtent;
  bool _pinning;

  bool get overlapsContent => _overlapsContent;
  bool _overlapsContent;
  set overlapsContent(bool value) {
    assert(value != null);
    if (_overlapsContent == value) return;
    _overlapsContent = value;
    markNeedsLayout();
  }

  RenderBox _header;
  RenderBox get header => _header;
  set header(RenderBox value) {
    if (_header != null) dropChild(_header);
    _header = value;
    if (_header != null) adoptChild(_header);
  }

  RenderSliver _content;
  RenderSliver get content => _content;
  set content(RenderSliver value) {
    if (_content != null) dropChild(_content);
    _content = value;
    if (_content != null) adoptChild(_content);
  }

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverPhysicalParentData)
      child.parentData = SliverPhysicalParentData();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    if (_header != null) _header.attach(owner);
    if (_content != null) _content.attach(owner);
  }

  @override
  void detach() {
    super.detach();
    if (_header != null) _header.detach();
    if (_content != null) _content.detach();
  }

  @override
  void redepthChildren() {
    if (_header != null) redepthChild(_header);
    if (_content != null) redepthChild(_content);
  }

  @override
  void visitChildren(visitor) {
    if (_header != null) visitor(_header);
    if (_content != null) visitor(_content);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    List<DiagnosticsNode> result = <DiagnosticsNode>[];
    if (header != null) {
      result.add(header.toDiagnosticsNode(name: 'header'));
    }
    if (content != null) {
      result.add(content.toDiagnosticsNode(name: 'content'));
    }
    return result;
  }

  double computeHeaderExtent() {
    if (header == null) return 0.0;
    assert(header.hasSize);
    assert(constraints.axis != null);
    switch(constraints.axis) {
      case Axis.vertical:
        return header.size.height;
      case Axis.horizontal:
        return header.size.width;
    }
    return null;
  }

  double get headerLogicalExtent => overlapsContent ? 0.0 : _headerExtent;

  @override
  void performLayout() {
    if (header == null && content == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    AxisDirection axisDirection = applyGrowthDirectionToAxisDirection(
        constraints.axisDirection, constraints.growthDirection);

    // layout header
    if (header != null) {
      header.layout(
        FLPersistentHeaderConstraints(
          state: _oldState ?? FLPersistentHeaderState(0.0, false),
          boxConstraints: constraints.asBoxConstraints(),
        ),
        parentUsesSize: true
      );
      _headerExtent = computeHeaderExtent();
    }

    // compute header extent
    double headerExtent = headerLogicalExtent;
    final double headerPaintExtent =
        calculatePaintOffset(constraints, from: 0.0, to: headerExtent);
    final double headerCacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: headerExtent);

    if (content == null) { // config geometry
      geometry = SliverGeometry(
        scrollExtent: headerExtent,
        maxPaintExtent: headerExtent,
        paintExtent: headerPaintExtent,
        cacheExtent: headerCacheExtent,
        hitTestExtent: headerPaintExtent,
        hasVisualOverflow: headerExtent > constraints.remainingPaintExtent
            || constraints.scrollOffset > 0.0
      );
    } else {
      // content layout
      content.layout(
        constraints.copyWith(
          scrollOffset: math.max(0.0, constraints.scrollOffset - headerExtent),
          cacheOrigin: math.min(0.0, constraints.cacheOrigin + headerExtent),
          overlap: 0.0,
          remainingPaintExtent:
            constraints.remainingPaintExtent - headerPaintExtent,
          remainingCacheExtent:
            constraints.remainingCacheExtent - headerCacheExtent,
        ),
        parentUsesSize: true,
      );
      final SliverGeometry contentLayoutGeometry = content.geometry;
      if (contentLayoutGeometry.scrollOffsetCorrection != null) {
        geometry = SliverGeometry(
          scrollOffsetCorrection: contentLayoutGeometry.scrollOffsetCorrection,
        );
        return;
      }

      final double paintExtent = math.min(
          headerPaintExtent + math.max(contentLayoutGeometry.paintExtent,
              contentLayoutGeometry.layoutExtent),
        constraints.remainingPaintExtent
      );

      // config geometry
      geometry = SliverGeometry(
        scrollExtent: headerExtent + contentLayoutGeometry.scrollExtent,
        paintExtent:  paintExtent,
        layoutExtent: math.min(
            headerPaintExtent + contentLayoutGeometry.layoutExtent, paintExtent),
        cacheExtent: math.min(
            headerCacheExtent + contentLayoutGeometry.cacheExtent,
            constraints.remainingCacheExtent),
        maxPaintExtent: headerExtent + contentLayoutGeometry.maxPaintExtent,
        hitTestExtent: math.max(
            headerPaintExtent + contentLayoutGeometry.paintExtent,
            headerPaintExtent + contentLayoutGeometry.hitTestExtent),
        hasVisualOverflow: contentLayoutGeometry.hasVisualOverflow,
      );

      final SliverPhysicalParentData contentParentData = content.parentData;
      assert(constraints.axisDirection != null);
      assert(constraints.growthDirection != null);
      switch(axisDirection) {
        case AxisDirection.up:
          contentParentData.paintOffset = Offset.zero;
          break;
        case AxisDirection.right:
          contentParentData.paintOffset = Offset(
            calculatePaintOffset(constraints, from: 0.0, to: headerExtent), 0.0
          );
          break;
        case AxisDirection.down:
          contentParentData.paintOffset = Offset(
              calculatePaintOffset(constraints, from: 0.0, to: headerExtent), 0.0
          );
          break;
        case AxisDirection.left:
          contentParentData.paintOffset = Offset.zero;
          break;
      }
    }
  }

  @override
  bool hitTestChildren(SliverHitTestResult result, {double mainAxisPosition, double crossAxisPosition}) {
    assert(geometry.hitTestExtent > 0.0);
    if(header != null
        && mainAxisPosition - constraints.overlap <= _headerExtent) {
      return hitTestBoxChild(
          BoxHitTestResult.wrap(SliverHitTestResult.wrap(result)), header,
          mainAxisPosition: mainAxisPosition - constraints.overlap,
          crossAxisPosition: crossAxisPosition)
          || (_overlapsContent
              && content != null
              && content.geometry.hitTestExtent > 0.0
              && content.hitTest(result,
                  mainAxisPosition: mainAxisPosition - childMainAxisPosition(content),
                  crossAxisPosition: crossAxisPosition));
    } else if (content != null && content.geometry.hitTestExtent > 0.0) {
      return content.hitTest(result,
          mainAxisPosition: mainAxisPosition - childMainAxisPosition(content),
          crossAxisPosition: crossAxisPosition);
    }
    return false;
  }

  @override
  double childMainAxisPosition(RenderObject child) {
    if (child == header) {
      return _pinning
          ? 0.0 : -(constraints.scrollOffset + constraints.overlap);
    }
    if (child == content) {
      return calculatePaintOffset(constraints,
          from: 0.0, to: headerLogicalExtent);
    }
    return null;
  }

  @override
  double childScrollOffset(RenderObject child) {
    assert(child.parent == this);
    if (child == this.content) {
      return _headerExtent;
    } else {
      return super.childScrollOffset(child);
    }
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    assert(child != null);
    final SliverPhysicalParentData childParentData = child.parentData;
    childParentData.applyPaintTransform(transform);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (geometry.visible) {
      if (content != null && content.geometry.visible) {
        final SliverPhysicalParentData contentParentData = content.parentData;
        context.paintChild(content, offset + contentParentData.paintOffset);
      }

      if (header != null) {
        final SliverPhysicalParentData headerParentData = header.parentData;
        context.paintChild(header, offset + headerParentData.paintOffset);
      }
    }
  }
}
