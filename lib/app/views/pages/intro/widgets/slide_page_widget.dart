import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/core/consts/colors_consts.dart';


class SlidePageWidget extends StatelessWidget {
  final String text;
  final String asset;

  const SlidePageWidget({Key key, this.text = '', this.asset = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: ColorsConst.grey600, fontSize: 18),
        ),
        Container(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              asset,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
        )
      ],
    );
  }
}
