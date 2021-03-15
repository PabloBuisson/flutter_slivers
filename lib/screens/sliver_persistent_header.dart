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
              pinned: true,
              floating: true,
              delegate:
                  DelegatePersistentHeader(minExtent: 100.0, maxExtent: 250.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('item $index'),
                );
              },
              childCount: 5,
            ),
          ),

          /// lets you scroll the CustomScrollView freely in the vertical axis
          /// as you fill the space with an empty container
          SliverFillRemaining(
            child: Container(
              color: Colors.teal,
              child: Center(
                child: Text(
                  'I fill the remaining space !',
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
