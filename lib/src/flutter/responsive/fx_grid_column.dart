import 'package:flutter/material.dart';

/// A widget that represents a column in a responsive grid layout.
///
/// This widget is used to define the properties of a column within a grid layout,
/// such as its flex factor, breakpoints, offsets, and gutter spacing.
class FxGridColumn extends StatelessWidget {
  /// Constructs an `FxGridColumn` widget.
  ///
  /// The [child] parameter is the widget to be placed within the column.
  /// The [flex] parameter determines the flex factor of the column. If not provided,
  /// the flex factor is calculated based on the screen width and the defined breakpoints.
  ///
  /// The [xs], [sm], [md], [lg], and [xl] parameters define the number of columns
  /// the current column should span for different screen sizes. If a specific
  /// parameter is not provided, the default is 12 columns.
  ///
  /// The [offset] parameter defines the number of columns the current column should be offset by.
  ///
  /// The [gutter] parameter specifies the spacing between columns in the grid.
  ///
  /// The [key] parameter is an optional key that can be used to identify and differentiate this widget.
  const FxGridColumn({
    required this.child,
    this.flex,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.offset,
    this.gutter,
    Key? key,
  }) : super(key: key);

  /// The widget to be placed within the column.
  final Widget child;

  /// The flex factor of the column.
  final int? flex;

  /// The number of columns the column should span for extra-small screens (less than 576px).
  final int? xs;

  /// The number of columns the column should span for small screens (576px to 767px).
  final int? sm;

  /// The number of columns the column should span for medium screens (768px to 991px).
  final int? md;

  /// The number of columns the column should span for large screens (992px to 1199px).
  final int? lg;

  /// The number of columns the column should span for extra-large screens (1200px and above).
  final int? xl;

  /// The number of columns the column should be offset by.
  final int? offset;

  /// The spacing between columns in the grid.
  final double? gutter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? getColumnFlex(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: gutter! / 2),
        child: child,
      ),
    );
  }

  /// Calculates the flex factor for the column based on the screen width and breakpoints.
  int getColumnFlex(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200 && xl != null) {
      return xl!;
    } else if (screenWidth >= 992 && lg != null) {
      return lg!;
    } else if (screenWidth >= 768 && md != null) {
      return md!;
    } else if (screenWidth >= 576 && sm != null) {
      return sm!;
    } else {
      return xs ?? 12;
    }
  }
}
