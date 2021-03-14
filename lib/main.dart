import 'package:flutter/material.dart';

import 'home_page.dart';
import 'screens/sliver_appbar.dart';
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
        primarySwatch: Colors.blue,
      ),
      routes: {
        CustomSliverAppBar.id: (context) => CustomSliverAppBar(),
        CustomSliverPersistentHeader.id: (context) =>
            CustomSliverPersistentHeader(),
      },
      home: HomePage(),
    );
  }
}
