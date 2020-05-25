import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  final List<Widget> children;

  const ScrollWidget({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
