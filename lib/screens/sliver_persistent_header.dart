import 'package:flutter/material.dart';

class CustomSliverPersistentHeader extends StatefulWidget {
  static final String id = 'sliver_persistent_header';
  static final String name = 'SliverPersistentHeader';

  get idScreen => CustomSliverPersistentHeader.id;
  get nameScreen => CustomSliverPersistentHeader.name;

  @override
  _CustomSliverPersistentHeaderState createState() => _CustomSliverPersistentHeaderState();
}

class _CustomSliverPersistentHeaderState extends State<CustomSliverPersistentHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sliver PersistentHeader"),),
    );
  }
}
