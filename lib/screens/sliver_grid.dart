import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  static final String id = 'sliver_grid';
  static final String name = 'SliverGrid';

  get idScreen => CustomSliverGrid.id;
  get nameScreen => CustomSliverGrid.name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliverGrid'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            // builds the children
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
            // specify how the items are displayed (grid’s layout)
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns
              mainAxisSpacing: 15, // space between rows
              crossAxisSpacing: 15, // space between columns
              childAspectRatio: 2.0,
            ),
          ),
          // Padding widget doesn’t take slivers
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0, // maxWidth of item
              mainAxisSpacing: 10.0, // space between rows
              crossAxisSpacing: 10.0, // space between columns
              childAspectRatio: 4.0,
            ),
          ),
          // define explicit list of widgets, not on demand
          // display the children depending on a fixed number of cross-axis tiles
          // (!) SliverGrid.count isn’t the most efficient way to render a SliverGrid,
          // as it requires building the widget list in advance.
          // Using the default SliverGrid constructor is considered more efficient.
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ],
          ),
          // define explicit list of widgets, not on demand
          // similar to SliverFixedExtentList
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          SliverGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
            children: <Widget>[
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
              Container(color: Colors.pink),
              Container(color: Colors.indigo),
              Container(color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
