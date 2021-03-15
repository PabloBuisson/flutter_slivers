import 'package:flutter/material.dart';

import 'delegate_sub_header.dart';

class SliverSubHeader extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const SliverSubHeader(
      {Key key, @required this.text, @required this.backgroundColor})
      : assert(text != null),
        assert(backgroundColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: DelegateSubHeader(
        minHeight: 60,
        maxHeight: 90,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context)),
                Text(
                  text,
                  textScaleFactor: 1.3,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
