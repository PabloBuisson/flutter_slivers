import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  static final String id = 'sliver_appbar';
  static final String name = 'SliverAppBar';

  get idScreen => CustomSliverAppBar.id;
  get nameScreen => CustomSliverAppBar.name;

  @override
  Widget build(BuildContext context) {
    /// 1) Every sliver SHOULD be placed in a CustomScrollView
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: Icon(Icons.chevron_left),
            // title: Text('Fixed title'), // will be override by flexibleSpace.title
            actions: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            ],
            // pinned: true, // pinned to the top, like a regular appBar
            floating: true, // become visible when the user scroll UP
            // floating: false => only visible when the user scrolls to the TOP
            // snap: true,
            // stretch: true,
            expandedHeight: 150.0, // maxHeight (when appBar is on TOP)
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar'), // only visible on TOP
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9)],
                  child: Text('item $index'),
                );
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
