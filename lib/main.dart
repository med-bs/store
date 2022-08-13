import 'package:flutter/material.dart';
import 'package:store/routes/route.dart';
import 'package:store/view/add_article_screen.dart';
import 'package:store/view/home.dart';
import 'package:store/view/home_bar.dart';
import 'package:store/view/login.dart';
import 'package:store/view/object_screen.dart';
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
        AppRoutes.home: (context) => const HomeView(),
        AppRoutes.homeBar: (context) => const HomeBar(),
        AppRoutes.object: (context) => const ObjectView(),
        AppRoutes.scanObject:(context)=>const QrcodeScan(),
        AppRoutes.addArticle:(context)=>const AddArticleView(),
      },
    ),
  );
}
