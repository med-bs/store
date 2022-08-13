import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/home_icon_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      appBar:appBarHome(null),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(50), horizontal: AppLayout.getWidth(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 HomeIcon(icon: Icons.article, text: "Factures",onTap: ()=>Navigator.pushNamed(context, AppRoutes.homeBar,arguments: 1),),
                  HomeIcon(icon: Icons.archive_outlined, text: "Articles",onTap: ()=>Navigator.pushNamed(context, AppRoutes.homeBar,arguments: 0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(icon: Icons.article_outlined, text: "Bon de livreson",onTap: ()=>Navigator.pushNamed(context, AppRoutes.homeBar,arguments: 2)),
                  HomeIcon(icon: Icons.warehouse_outlined, text: "Entrepôt",onTap: ()=>Navigator.pushNamed(context, AppRoutes.homeBar,arguments: 3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
