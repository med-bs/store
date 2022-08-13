import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/button_widget.dart';
import 'package:store/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void signUp(context) {
    Navigator.pushNamed(context, AppRoutes.home);
  }

  void logIn(context) {
    print("--------");
    print("_email::  $_email !!!!\n paass :: $_password !!");
    print("--------");
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
  }

  String _email = "";
  String _password = "";

  void password(String value) {
    setState(() {
      _password = value;
    });
  }

  void email(String value) {
    setState(() {
      _email = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.bgColor,
        appBar: appBarBack(context),
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height - AppLayout.getHeight(100),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainTextColor),
                        ),
                        Gap(AppLayout.getHeight(20)),
                        const Text(
                          "Login to your account",
                          style: TextStyle(
                              fontSize: 15, color: AppColors.mainTextColor),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(40)),
                      child: Column(
                        children: <Widget>[
                          InputWidget(
                            label: "Email",
                            onChange: email,
                          ),
                          InputWidget(
                              label: "Password",
                              onChange: password,
                              isPassword: true),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppLayout.getWidth(40)),
                      child: Container(
                        padding: const EdgeInsets.only(top: 3, left: 3),
                        child: ButtonWidget(
                          text: "Login",
                          textColor: AppColors.secondaryTextColor,
                          bgColor: AppColors.secondaryColor,
                          onPressed: () => logIn(context),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        InkWell(
                          onTap: () => signUp(context),
                          child: const Text(
                            " Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: AppLayout.getHeight(200)),
                      height: AppLayout.getHeight(150),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
