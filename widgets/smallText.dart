import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';

class smallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  smallText({
    this.color = const Color(0xFFccc7c5), // default value cant be a variable,it should be a constant
    required this.text,
    this.size = 12,
    this.height = 1.2,
  }); //ellipses(....)

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
  
      style: TextStyle(color: color, fontSize: size, fontFamily: 'Roboto',height: height),
    );
  }
}
