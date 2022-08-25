import 'package:flutter/material.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getWidth(15),horizontal: AppLayout.getHeight(15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
          color: Colors.white
      ),
      child:


          Text(text,style:  TextStyle(fontSize: AppLayout.getWidth(16) ,color: AppColors.mainTextColor, fontWeight: FontWeight.w500),)

    );
  }
}
