import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';

class HomeIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const HomeIcon({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * .35,
        height: size.height * .3,
        margin: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15)),
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(15),
            vertical: AppLayout.getHeight(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 29,color: AppColors.secondaryTextColor),
            ),
            Gap(AppLayout.getWidth(10)),
            Icon(icon,size: size.width/5,color: AppColors.secondaryTextColor,),
          ],
        ),
      ),
    );
  }
}
