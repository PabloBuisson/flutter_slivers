import 'package:flutter/material.dart';

class CustomSliverToBoxAdapter extends StatelessWidget {
  static final String id = 'sliver_to_box_adapter';
  static final String name = 'SliverToBoxAdapter';

  get idScreen => CustomSliverToBoxAdapter.id;
  get nameScreen => CustomSliverToBoxAdapter.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverToBoxAdapter'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter converts boxes to slivers
          // Allows RenderBox objects in CustomScrollView
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  'Header',
                  textScaleFactor: 1.3,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.deepPurple[100 * (index % 9)],
                  child: Text('Deep purple $index'),
                );
              },
              childCount: 9,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.deepPurple[900],
              child: Center(
                child: Text(
                  'Footer',
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
