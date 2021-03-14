import 'package:flutter/material.dart';

import 'screens/sliver_appbar.dart';
import 'screens/sliver_persistent_header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of our slivers to explore
  final List sliversScreens = [
    CustomSliverAppBar(),
    CustomSliverPersistentHeader(),
  ];
  // index of the item of the ListWheelScrollView
  // that is currently in the center of the wheel
  int indexScreen;

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
          useMagnifier:
          true, // define whether to use magnifier at the centre item of our wheel
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
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  sliversScreens[index].nameScreen,
                  textScaleFactor: 1.3,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}