import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/utils/app_layout.dart';

class Message {
  static void inputErrorOrWarning(
      BuildContext context, String filed, String filedErrorOrWarning) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.all(AppLayout.getHeight(50)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red.withOpacity(.5),
        content: Container(
          padding: EdgeInsets.all(AppLayout.getHeight(10)),
          height: AppLayout.getHeight(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getWidth(25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$filed :",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Gap(AppLayout.getHeight(10)),
              Text(
                filedErrorOrWarning,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )));
  }
}
