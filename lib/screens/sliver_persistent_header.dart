import 'package:flutter/material.dart';
import 'package:flutterslivers/widgets/delegate_header.dart';
import 'package:flutterslivers/widgets/sliver_sub_header.dart';

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
          // Under the hood, SliverAppBar is a SliverPersistentHeader
          // Normal SliverPersistentHeader, with delegate
          SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate:
                  DelegateHeader(minExtent: 30.0, maxExtent: 250.0)),
          // Custom SliverPersistentHeader
          SliverSubHeader(text: 'SliverSubPersistentHeader', backgroundColor: Colors.black),
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

          // lets you scroll the CustomScrollView freely in the vertical axis
          // as you fill the space with an empty container
          SliverFillRemaining(
            child: Container(
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SliverFillRemaining',
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'I fill the remaining space !',
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
