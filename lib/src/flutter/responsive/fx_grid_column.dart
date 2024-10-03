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
  /// parameter is not provided, it will use the value from the next smaller breakpoint.
  ///
  /// The [xsOffset], [smOffset], [mdOffset], [lgOffset], and [xlOffset] parameters
  /// define the number of columns the current column should be offset by for different screen sizes.
  ///
  /// The [gutter] parameter specifies the spacing between columns in the grid.
  ///
  /// The [key] parameter is an optional key that can be used to identify and differentiate this widget.
  const FxGridColumn({
    required this.child,
    super.key,
    this.flex,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xsOffset,
    this.smOffset,
    this.mdOffset,
    this.lgOffset,
    this.xlOffset,
    this.gutter = 16.0,
  });

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

  /// The number of columns the column should be offset by for extra-small screens.
  final int? xsOffset;

  /// The number of columns the column should be offset by for small screens.
  final int? smOffset;

  /// The number of columns the column should be offset by for medium screens.
  final int? mdOffset;

  /// The number of columns the column should be offset by for large screens.
  final int? lgOffset;

  /// The number of columns the column should be offset by for extra-large screens.
  final int? xlOffset;

  /// The spacing between columns in the grid.
  final double gutter;

  @override
  Widget build(BuildContext context) {
    final int columnSpan = getColumnSpan(context);
    final int columnOffset = getColumnOffset(context);

    return Expanded(
      flex: flex ?? columnSpan,
      child: Padding(
        padding: EdgeInsets.only(
          left: gutter / 2 + (columnOffset * gutter),
          right: gutter / 2,
        ),
        child: child,
      ),
    );
  }

  /// Calculates the number of columns to span based on the screen width and breakpoints.
  int getColumnSpan(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) return xl ?? lg ?? md ?? sm ?? xs ?? 12;
    if (screenWidth >= 992) return lg ?? md ?? sm ?? xs ?? 12;
    if (screenWidth >= 768) return md ?? sm ?? xs ?? 12;
    if (screenWidth >= 576) return sm ?? xs ?? 12;
    return xs ?? 12;
  }

  /// Calculates the number of columns to offset based on the screen width and breakpoints.
  int getColumnOffset(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200)
      return xlOffset ?? lgOffset ?? mdOffset ?? smOffset ?? xsOffset ?? 0;
    if (screenWidth >= 992)
      return lgOffset ?? mdOffset ?? smOffset ?? xsOffset ?? 0;
    if (screenWidth >= 768) return mdOffset ?? smOffset ?? xsOffset ?? 0;
    if (screenWidth >= 576) return smOffset ?? xsOffset ?? 0;
    return xsOffset ?? 0;
  }
}
