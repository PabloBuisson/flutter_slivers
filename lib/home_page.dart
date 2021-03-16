import 'package:flutter/material.dart';

import 'screens/sliver_appbar.dart';
import 'screens/sliver_grid.dart';
import 'screens/sliver_list.dart';
import 'screens/sliver_persistent_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of our slivers to explore
  List sliversScreens = [
    CustomSliverAppBar(),
    CustomSliverPersistentHeader(),
    CustomSliverList(),
    CustomSliverGrid(),
  ];
  // index of the item of the ListWheelScrollView
  // that is currently in the center of the wheel
  int indexScreen = 0;

  void goToSliverScreen() {
    if (indexScreen != null) {
      Navigator.pushNamed(context, sliversScreens[indexScreen].idScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: GestureDetector(
        onTap: goToSliverScreen,
        child: ListWheelScrollView.useDelegate(
          itemExtent: 100.0, // pixel height of each child
          diameterRatio: 1.5, // diameter of the wheel
          // magnification: 1.1, // loop effect on item at the center
          useMagnifier: true, // define whether to use magnifier at the centre item of our wheel
          onSelectedItemChanged: (index) {
            setState(() {
              indexScreen = index;
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: sliversScreens.length,
            builder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    sliversScreens[index].nameScreen,
                    textScaleFactor: 1.4,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
