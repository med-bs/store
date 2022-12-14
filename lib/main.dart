import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/routes/route.dart';
import 'package:store/view/add_article_screen.dart';
import 'package:store/view/add_invontaire_sceeen.dart';
import 'package:store/view/facture_screen.dart';
import 'package:store/view/home.dart';
import 'package:store/view/home_bar.dart';
import 'package:store/view/invontaire_screen.dart';
import 'package:store/view/livraison_screen.dart';
import 'package:store/view/login.dart';
import 'package:store/view/article_screen.dart';
import 'package:store/view/profile_screen.dart';
import 'package:store/view/qr_code_search_screen.dart';
import 'package:store/view/signup.dart';
import 'package:store/view/welcome.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (context) => const WelcomePage(),
        AppRoutes.login:(context) => const LoginPage(),
        AppRoutes.signup:(context) => const SignupPage(),
        AppRoutes.home: (context) => const Home(),
        AppRoutes.homeBar: (context) => const HomeBar(),
        AppRoutes.invontaire:(context)=>const InvontaireView(),
        AppRoutes.addInvontaire:(context)=>const AddInvontairView(),
        AppRoutes.article: (context) => const ArticleView(),
        AppRoutes.facture: (context) => const FactureView(),
        AppRoutes.livraison:(context)=>const BonLivraisonView(),
        AppRoutes.scanObject:(context)=>const QrcodeScan(),
        AppRoutes.addArticle:(context)=>const AddArticleView(),
        AppRoutes.profile:(context)=>const ProfileView(),
      },
    ),
  );
}
