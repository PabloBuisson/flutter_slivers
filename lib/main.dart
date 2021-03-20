import 'package:flutter/material.dart';
import 'package:flutterslivers/screens/sliver_grid.dart';
import 'package:flutterslivers/screens/sliver_to_box_adapter.dart';

import 'home_page.dart';
import 'screens/sliver_appbar.dart';
import 'screens/sliver_list.dart';
import 'screens/sliver_persistent_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo about Slivers',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        backgroundColor: Colors.white,
      ),
      routes: {
        CustomSliverAppBar.id: (context) => CustomSliverAppBar(),
        CustomSliverPersistentHeader.id: (context) =>
            CustomSliverPersistentHeader(),
        CustomSliverList.id: (context) => CustomSliverList(),
        CustomSliverGrid.id: (context) => CustomSliverGrid(),
        CustomSliverToBoxAdapter.id: (context) => CustomSliverToBoxAdapter(),
      },
      home: HomePage(),
    );
  }
}
