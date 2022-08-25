import 'package:flutter/material.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/view/Inventaires_screen.dart';
import 'package:store/view/articles_screen.dart';
import 'package:store/view/factures_screen.dart';
import 'package:store/view/livraisons_screen.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int _selectedIndex = 0;
  int? indexArg;
  //verifier si on a recuperrer l'argument du route
  static bool argumentgeted = false;

  final List<Widget> _widgetoptions = <Widget>[
    const AllArticlesView(),
    const AllFacturesView(),
    const AllBonLivraisonView(),
    const AllInvontaireView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      indexArg = null;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    indexArg = ModalRoute.of(context)!.settings.arguments as int?;

    if (indexArg != null && !argumentgeted) {
      argumentgeted = true;
      _selectedIndex = indexArg!;
    }
    print(
        "arg  $indexArg !!!! select $_selectedIndex  selected $argumentgeted");
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: _widgetoptions[_selectedIndex],
        ),
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          centerTitle: true,
          title: const Text(
            "Welcome",
            style: TextStyle(color: AppColors.mainTextColor),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              argumentgeted=false;
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.bgColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          selectedItemColor: AppColors.secondaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.secondaryColor2,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
              label: "Article",
              activeIcon: Icon(Icons.archive),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: "Factures",
              activeIcon: Icon(Icons.article),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_outlined),
              label: "Bon de livreson",
              activeIcon: Icon(Icons.delivery_dining_outlined),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warehouse_outlined),
              label: "Entropot",
              activeIcon: Icon(Icons.warehouse),
            ),
          ],
        ),
      ),
    );
  }
}
