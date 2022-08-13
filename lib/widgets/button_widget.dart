import 'package:flutter/material.dart';
import 'package:store/utils/app_layout.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final VoidCallback onPressed;
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.bgColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: AppLayout.getHeight(60),
      onPressed: onPressed,
      color: bgColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: textColor),
          borderRadius: BorderRadius.circular(AppLayout.getWidth(50))),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}
