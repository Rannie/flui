import 'package:flutter/material.dart';

typedef Widget FLAutoCompleteItemBuilder<T> (BuildContext context, T suggestion);

class FLAutoComplete<T> extends StatefulWidget {
  /// must same as the child's focus node;
  final FocusNode focusNode;

  final ValueChanged<T> onSelectedSuggestion;
  /// hide suggestions overlay automatically after select suggestion.
  /// default is true.
  final bool hideAfterSelection;
  /// hide suggestions overlay when focus node unfocus.
  /// default is true.
  final bool hideWhenUnfocus;

  final FLAutoCompleteItemBuilder<T> itemBuilder;
  /// complete widget, such as a TextField.
  final Widget child;

  FLAutoComplete({
    Key key,
    this.focusNode,
    this.onSelectedSuggestion,
    this.hideAfterSelection = true,
    this.hideWhenUnfocus = true,
    @required this.itemBuilder,
    @required this.child
  }) : assert(itemBuilder != null),
       assert(child != null),
       super(key: key);

  @override
  State<FLAutoComplete> createState() => FLAutoCompleteState();
}

class FLAutoCompleteState<T> extends State<FLAutoComplete> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry _suggestionsEntry;
  List<T> _suggestionList;
  bool _display = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_handleNodeUnfocus);
  }

  void _handleNodeUnfocus() {
    if (!widget.hideWhenUnfocus)
      return;

    if (widget.focusNode == null)
      return;

    if (!widget.focusNode.hasFocus) {
      hideAutoComplete();
    }
  }

  /// show suggestions overlay with data source.
  /// if suggestions is empty
  void updateSuggestionList(List<T> suggestions) {
    if (suggestions == null || suggestions.isEmpty) {
      hideAutoComplete();
      return;
    }

    _suggestionList = suggestions;
    if (_suggestionsEntry == null) {
      final Size childSize = (context.findRenderObject() as RenderBox).size;
      final width = childSize.width;
      final height = childSize.height;

      _suggestionsEntry = OverlayEntry(builder: (context) {
        return Positioned(
          width: width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0.0, height),
            child: SizedBox(
              width: width,
              child: Card(
                child: Column(
                  children: _suggestionList.map((T suggestion) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            child: widget.itemBuilder(context, suggestion),
                            onTap: () {
                              widget.onSelectedSuggestion?.call(suggestion);
                              if (widget.hideAfterSelection) {
                                hideAutoComplete();
                              }
                            },
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      });
      Overlay.of(context).insert(_suggestionsEntry);
      _display = true;
    } else {
      _suggestionsEntry.markNeedsBuild();
    }
  }

  void hideAutoComplete() {
    if (!_display)
      return;

    _suggestionsEntry.remove();
    _suggestionsEntry = null;
    _display = false;
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_handleNodeUnfocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(link: _layerLink, child: widget.child);
  }
}