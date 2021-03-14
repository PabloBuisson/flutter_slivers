import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatefulWidget {
  static final String id = 'sliver_appbar';
  static final String name = 'SliverAppBar';

  get idScreen => CustomSliverAppBar.id;
  get nameScreen => CustomSliverAppBar.name;

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliver AppBar"),),
    );
  }
}
