import 'package:flutter/material.dart';
import 'package:quickly/src/flutter/responsive/fx_grid_column.dart';

/// A responsive grid layout widget that arranges its children in a row.
///
/// This widget creates a responsive grid layout where children are laid out horizontally.
/// The number of columns in the grid is determined based on the screen width and the provided breakpoints.
/// The grid supports hiding or showing specific columns using the `hideOn` and `showOn` properties.
class FxGrid extends StatelessWidget {
  /// Constructs an `FxGrid` widget.
  ///
  /// [children] A list of `FxGridColumn` widgets representing the columns in the grid.
  /// [breakpoints] A list of screen widths at which the number of columns changes. Defaults to [576, 768, 992, 1200].
  /// [hideOn] A list of column indices to hide. Defaults to an empty list.
  /// [showOn] A list of column indices to show, regardless of other conditions. Defaults to an empty list.
  /// [mainAxisAlignment] Determines how the columns are aligned horizontally. Defaults to MainAxisAlignment.start.
  /// [crossAxisAlignment] Determines how the columns are aligned vertically. Defaults to CrossAxisAlignment.start.
  const FxGrid({
    required this.children,
    super.key,
    this.breakpoints = const [576, 768, 992, 1200],
    this.hideOn = const [],
    this.showOn = const [],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  /// The list of `FxGridColumn` widgets representing the columns in the grid.
  final List<FxGridColumn> children;

  /// The list of screen widths at which the number of columns changes.
  final List<int> breakpoints;

  /// The list of column indices to hide.
  final List<int> hideOn;

  /// The list of column indices to show, regardless of other conditions.
  final List<int> showOn;

  /// How the columns are aligned horizontally.
  final MainAxisAlignment mainAxisAlignment;

  /// How the columns are aligned vertically.
  final CrossAxisAlignment crossAxisAlignment;

  /// The default gutter value used in the layout.
  static const double defaultGutter = 16;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final totalColumns = _calculateTotalColumns(screenWidth);
    final visibleChildren = _filterVisibleChildren();

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _calculateColumns(totalColumns, visibleChildren),
    );
  }

  /// Calculates the total number of columns based on the screen width.
  int _calculateTotalColumns(double screenWidth) {
    for (int i = 0; i < breakpoints.length; i++) {
      if (screenWidth < breakpoints[i]) {
        return i + 1;
      }
    }
    return 12; // Default to 12 columns for larger screens
  }

  /// Filters the visible children based on the `showOn` and `hideOn` parameters.
  List<FxGridColumn> _filterVisibleChildren() {
    return children
        .asMap()
        .entries
        .where((entry) {
          final index = entry.key;
          return showOn.contains(index) ||
              (hideOn.isEmpty || !hideOn.contains(index));
        })
        .map((entry) => entry.value)
        .toList();
  }

  /// Calculates the columns to be rendered in the grid.
  List<FxGridColumn> _calculateColumns(
      int totalColumns, List<FxGridColumn> visibleChildren) {
    if (visibleChildren.isEmpty) return [];

    return List.generate(totalColumns, (index) {
      final column = visibleChildren[index % visibleChildren.length];
      return FxGridColumn(
        child: column.child,
        flex: column.flex ?? _calculateFlex(column, totalColumns),
        gutter: column.gutter,
      );
    });
  }

  /// Calculates the flex factor for a column based on its properties and the total number of columns.
  int _calculateFlex(FxGridColumn column, int totalColumns) {
    // Implement logic to calculate flex based on xs, sm, md, lg, xl properties
    // This is a placeholder and should be replaced with actual logic
    return 1;
  }
}
