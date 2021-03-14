import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DelegatePersistentHeader implements SliverPersistentHeaderDelegate {
  DelegatePersistentHeader({
    @required this.minExtent,
    @required this.maxExtent,
  });
  // minWidth of the header (on scroll)
  final double minExtent; // property to override
  // maxWidth of the header (shown by default)
  final double maxExtent; // property to override

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1615568057392-8f933710de76?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white
                            .withOpacity(titleOpacity(shrinkOffset)),
                      ),
                      onPressed: () => Navigator.pop(context)),
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white
                            .withOpacity(titleOpacity(shrinkOffset)),
                      ),
                      onPressed: () {}),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 120.0,),
              Text(
                'Sliver PersistentHeader',
                textScaleFactor: 1.5,
                style: TextStyle(
                  color: Colors.white.withOpacity(titleOpacity(shrinkOffset)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider get vsync => null;
}
