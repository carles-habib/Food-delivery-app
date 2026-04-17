import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/colors.dart';

import '../dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({super.key,this.color = const Color(0xFF332d2b),
    required this.text,
    this.size=15,
    this.height=1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
          fontFamily: 'Roboto',
          color: color==0?AppColors.textColor:color,
          fontSize:  size==0?Dimensions.font20:size,
          height: height,
      ),

    );
  }
}
