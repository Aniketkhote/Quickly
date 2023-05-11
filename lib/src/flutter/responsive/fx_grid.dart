import 'package:flutter/material.dart';

class FxGridColumn extends StatelessWidget {
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

  final Widget child;
  final int? flex;
  final int? xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final int? offset;
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

class FxGrid extends StatelessWidget {
  const FxGrid({
    required this.children,
    this.breakpoints = const <int>[576, 768, 992, 1200],
    this.hideOn = const <int>[],
    this.showOn = const <int>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  final List<FxGridColumn> children;
  final List<int> breakpoints;
  final List<int> hideOn;
  final List<int> showOn;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  static const double defaultGutter = 16.0;

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

  List<FxGridColumn> filterVisibleChildren() {
    final List<FxGridColumn> visibleChildren = <FxGridColumn>[];

    for (int i = 0; i < children.length; i++) {
      if (showOn.contains(i) || (hideOn.isNotEmpty && !hideOn.contains(i))) {
        visibleChildren.add(children[i]);
      }
    }

    return visibleChildren;
  }

  List<FxGridColumn> calculateColumns(
      int totalColumns, List<FxGridColumn> visibleChildren) {
    final List<FxGridColumn> columns = <FxGridColumn>[];

    for (int i = 0; i < totalColumns; i++) {
      final FxGridColumn column = visibleChildren[i % visibleChildren.length];
      columns.add(column);
    }

    return columns;
  }
}
