import 'package:flutter/material.dart';

class CustomSliverList extends StatelessWidget {
  static final String id = 'sliver_list';
  static final String name = 'SliverList';

  get idScreen => CustomSliverList.id;
  get nameScreen => CustomSliverList.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverList'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // define explicit list of widgets
          // returns a sliver that displays a linear list of children,
          // all with the same extent, width or height, depending on the main axis
          // (!) SliverFixedExtentList is highly more efficient than SliverList
          // as it doesn’t need to calculate the extent of its children dynamically
          SliverFixedExtentList(
            itemExtent: 50, // set the same width/height for the items
            // equivalent to ListView
            // (!) SliverChildListDelegate requires building all the widgets in advance
            // which isn’t efficient and reduces the benefit of building children lazily
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.red[400],
                alignment: Alignment.center,
                child: Text('red 4'),
              ),
              Container(
                color: Colors.red[300],
                alignment: Alignment.center,
                child: Text('red 3'),
              ),
              Container(
                color: Colors.red[200],
                alignment: Alignment.center,
                child: Text('red 2'),
              ),
            ]),
          ),
          // define explicit list of widgets
          // returns a sliver that displays a linear list of children,
          // with maybe a different extent.
          // It's better to use SliverListExtentList as possible,
          // and only resort to SliverList if you need to support children of
          // varying or dynamic extents.
          SliverList(
            // build widgets on demand, as you scroll
            // better (performance wise) for long lists
            // equivalent to ListView.builder
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text('orange $index'),
                );
              },
              childCount: 9,
            ),
          ),
          // Better choice = SliverFixedExtentList + SliverChildBuilderDelegate
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('teal $index'),
                );
              },
              childCount: 9,
            ),
          ),
        ],
      ),
    );
  }
}
