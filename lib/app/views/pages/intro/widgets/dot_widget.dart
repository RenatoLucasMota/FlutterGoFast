import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/consts/colors_consts.dart';


class Dot extends StatelessWidget {
  final int index;
  final bool isActive;

  const Dot({Key key, this.isActive, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isActive ? Theme.of(context).primaryColor : ColorsConst.grey400,
        ),
        height: 6,
        width: 6,
      ),
    );
  }
}