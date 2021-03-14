import 'package:flutter/material.dart';
import 'package:flutterslivers/widgets/delegate_persistent_header.dart';

class CustomSliverPersistentHeader extends StatelessWidget {
  static final String id = 'sliver_persistent_header';
  static final String name = 'SliverPersistentHeader';

  get idScreen => CustomSliverPersistentHeader.id;
  get nameScreen => CustomSliverPersistentHeader.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// Under the hood, SliverAppBar is a SliverPersistentHeader
          SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate:
                  DelegatePersistentHeader(minExtent: 150.0, maxExtent: 250.0)),
          SliverFillRemaining(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
