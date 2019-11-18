import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent(this.title, {Key key})
      : assert(title != null),
        super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 34),
      child:
          Text(title.toUpperCase(), style: Theme.of(context).textTheme.title),
    );
  }
}
