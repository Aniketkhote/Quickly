import "package:flutter/material.dart";
import "package:quickly/src/flutter/responsive/fx_grid_column.dart";

/// A responsive grid layout widget that arranges its children in a row.
///
/// This widget is used to create a responsive grid layout where children are laid out horizontally.
/// The number of columns in the grid is determined based on the screen width and the provided breakpoints.
/// The grid supports hiding or showing specific columns using the `hideOn` and `showOn` properties.
class FxGrid extends StatelessWidget {
  /// Constructs an `FxGrid` widget.
  ///
  /// The [children] parameter is a list of `FxGridColumn` widgets that represent the columns in the grid.
  /// The [breakpoints] parameter is a list of screen widths at which the number of columns in the grid changes.
  /// The [hideOn] parameter is a list of column indices to hide.
  /// The [showOn] parameter is a list of column indices to show, regardless of other conditions.
  /// The [mainAxisAlignment] parameter determines how the columns are aligned horizontally.
  /// The [crossAxisAlignment] parameter determines how the columns are aligned vertically.
  /// The [key] parameter is an optional key that can be used to identify and differentiate this widget.
  const FxGrid({
    required this.children,
    super.key,
    this.breakpoints = const <int>[576, 768, 992, 1200],
    this.hideOn = const <int>[],
    this.showOn = const <int>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  /// The list of `FxGridColumn` widgets that represent the columns in the grid.
  final List<FxGridColumn> children;

  /// The list of screen widths at which the number of columns in the grid changes.
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final int totalColumns = calculateTotalColumns(screenWidth);

    final List<FxGridColumn> visibleChildren = filterVisibleChildren();

    final List<FxGridColumn> columns =
        calculateColumns(totalColumns, visibleChildren);

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: columns,
    );
  }

  /// Calculates the total number of columns in the grid based on the screen width.
  ///
  /// The [screenWidth] parameter represents the width of the screen.
  /// The total number of columns is determined by comparing the screen width with the provided breakpoints.
  /// Returns the total number of columns.
  int calculateTotalColumns(double screenWidth) {
    int totalColumns = 12;

    for (int i = 0; i < breakpoints.length; i++) {
      if (screenWidth < breakpoints[i]) {
        totalColumns = i + 1;
        break;
      }
    }

    return totalColumns;
  }

  /// Filters the visible children based on the `showOn` and `hideOn` parameters.
  ///
  /// Returns a list of `FxGridColumn` widgets that should be visible in the grid.
  List<FxGridColumn> filterVisibleChildren() {
    final List<FxGridColumn> visibleChildren = <FxGridColumn>[];

    for (int i = 0; i < children.length; i++) {
      if (showOn.contains(i) || (hideOn.isNotEmpty && !hideOn.contains(i))) {
        visibleChildren.add(children[i]);
      }
    }

    return visibleChildren;
  }

  /// Calculates the columns to be rendered in the grid based on the total number of columns and the visible children.
  ///
  /// The [totalColumns] parameter represents the total number of columns in the grid.
  /// The [visibleChildren] parameter is a list of `FxGridColumn` widgets that should be visible.
  /// Returns a list of `FxGridColumn` widgets representing the calculated columns.
  List<FxGridColumn> calculateColumns(
    int totalColumns,
    List<FxGridColumn> visibleChildren,
  ) {
    final List<FxGridColumn> columns = <FxGridColumn>[];

    for (int i = 0; i < totalColumns; i++) {
      final FxGridColumn column = visibleChildren[i % visibleChildren.length];
      columns.add(column);
    }

    return columns;
  }
}
