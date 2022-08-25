import 'package:flutter/material.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';

AppBar appBarHome(BuildContext? context) => AppBar(
      backgroundColor: AppColors.bgColor,
      centerTitle: true,
      title: const Text(
        "Welcome",
        style: TextStyle(color: AppColors.mainTextColor),
      ),
      leading: context == null
          ? const Icon(
              Icons.settings,
              color: AppColors.secondaryColor,
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: AppLayout.getWidth(20),
                color: Colors.black,
              ),
            ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: AppLayout.getWidth(10)),
          child: const Icon(Icons.logout, color: AppColors.secondaryColor),
        ),
      ],
    );

AppBar appBarBack(BuildContext context) => AppBar(
      elevation: 0,
      backgroundColor: AppColors.bgColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: AppLayout.getWidth(20),
          color: Colors.black,
        ),
      ),
    );
