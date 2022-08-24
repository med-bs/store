import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/home_icon_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigation(int arg){
      Navigator.pushNamed(context, AppRoutes.homeBar,arguments: arg);
    }
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
                 HomeIcon(icon: Icons.article, text: "Factures",onTap:()=>navigation(1),),
                  HomeIcon(icon: Icons.archive_outlined, text: "Articles",onTap: ()=>navigation(0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(icon: Icons.article_outlined, text: "Bon de livreson",onTap: ()=>navigation(2)),
                  HomeIcon(icon: Icons.warehouse_outlined, text: "Entrepôt",onTap: ()=>navigation(3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(setIndex: (index) {
        setState(() {
          currentIndex = index;
        });
      },),
      mainScreen: HomeScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      slideWidth: 200,
      menuBackgroundColor: Colors.deepPurple,
    );
  }

}

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, this.title = "Home"}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void navigation(int arg){
      Navigator.pushNamed(context, AppRoutes.homeBar,arguments: arg);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: DrawerWidget(),
      ),
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
                  HomeIcon(icon: Icons.article, text: "Factures",onTap:()=>navigation(1),),
                  HomeIcon(icon: Icons.archive_outlined, text: "Articles",onTap: ()=>navigation(0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeIcon(icon: Icons.article_outlined, text: "Bon de livreson",onTap: ()=>navigation(2)),
                  HomeIcon(icon: Icons.warehouse_outlined, text: "Entrepôt",onTap: ()=>navigation(3)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawerList(Icons.home, "Home", 0),
          drawerList(Icons.person, "Profile", 1),
          drawerList(Icons.logout, "Deconection", 2),
        ],
      ),
    );
  }

  Widget drawerList(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
        switch(index){
          case 0:{
            Navigator.pushNamed(context, AppRoutes.home);
            break;
          }
          case 1:{
            Navigator.pushNamed(context, AppRoutes.profile);
            break;
          }
          case 2:{
            print("deconextion");
            break;
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 12,),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: Icon(Icons.menu),
    );
  }
}



