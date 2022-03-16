import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/widgets/smallText.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData iconn;
  final Color color;
  final Color iconcolor;
  IconTextWidget(
      {required this.text,
      required this.iconn,
      required this.color,
      required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(
            iconn,
            color: iconcolor,
          ),
          const SizedBox(
            width: 5,
          ),
          smallText(
            text: text,color: color,
            size: 12,
          ),const SizedBox(width: 10,),
        ],
      ),
    );
  }
}
