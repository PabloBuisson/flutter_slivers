import 'package:flutter/material.dart';
import 'dart:math';

class DelegateSubHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  DelegateSubHeader({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;
  // smallest size to allow the header to reach,
  // when it shrinks at the start of the viewport

  @override
  double get maxExtent => max(maxHeight, minHeight);
  // size of the header when it is not shrinking at the top of the viewport

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(DelegateSubHeader oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}