import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow textOverFlow;
  BigText(
      {this.color=const Color(0xFF332d2b),              // default value cant be a variable,it should be a constant
      required this.text,
      this.size = 20,
      this.textOverFlow = TextOverflow.ellipsis});        //ellipses(....)

  @override
  Widget build(BuildContext context) {
    return Text(
      text,maxLines: 1,
      overflow: textOverFlow,
      style: TextStyle(color: color, fontSize: size,fontFamily: 'Roboto',fontWeight: FontWeight.w700),
    );
  }
}
