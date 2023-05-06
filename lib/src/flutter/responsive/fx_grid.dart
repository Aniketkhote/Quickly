import 'package:flutter/material.dart';

class FxGridColumn extends StatelessWidget {
  const FxGridColumn({
    required this.child,
    required this.flex,
    required this.gutter,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final int flex;
  final double gutter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: gutter / 2),
        child: child,
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    int totalColumns = 12;
    final double screenWidth = MediaQuery.of(context).size.width;
    const double gutter = 16.0;

    for (int i = 0; i < breakpoints.length; i++) {
      if (screenWidth < breakpoints[i]) {
        totalColumns = i + 1;
        break;
      }
    }

    final List<FxGridColumn> visibleChildren = <FxGridColumn>[];
    for (int i = 0; i < children.length; i++) {
      if (showOn.contains(i) || (hideOn.isNotEmpty && !hideOn.contains(i))) {
        visibleChildren.add(children[i]);
      }
    }

    final List<FxGridColumn> columns = <FxGridColumn>[];
    for (int i = 0; i < totalColumns; i++) {
      int colSpan = (totalColumns / visibleChildren.length).floor();
      if (i < totalColumns % visibleChildren.length) {
        colSpan += 1;
      }
      columns.add(
        FxGridColumn(
          flex: colSpan,
          gutter: gutter,
          child: visibleChildren[i].child,
        ),
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: columns,
    );
  }
}
