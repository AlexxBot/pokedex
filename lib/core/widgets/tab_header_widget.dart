import 'package:flutter/material.dart';
import 'package:pokedex/core/widgets/text_widget.dart';

class TabHeaderWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const TabHeaderWidget({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: TextWidget(
        title,
        fontSize: 16,
        color: color,
      ),
    );
  }
}
