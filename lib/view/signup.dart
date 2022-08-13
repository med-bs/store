import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/button_widget.dart';
import 'package:store/widgets/input_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _comPassword = "";

  void name(String value) {
    _name = value;
  }

  void email(String value) {
    _email = value;
  }

  void password(String value) {
    _password = value;
  }

  void comPassword(String value) {
    _comPassword = value;
  }

  void logIn(context) {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  void signup(context) {
    print("--------");
    print(
        "name: $_name\n_email::  $_email !!!!\n paass :: $_password !! \n confirme = ${_password == _comPassword}");
    print("--------");
    Navigator.pushNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    Size size = AppLayout.getSize(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.bgColor,
        appBar: appBarBack(context),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(40)),
            height: size.height - AppLayout.getHeight(50),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const Text(
                      "Create an account, It's free ",
                      style: TextStyle(
                          fontSize: 15, color: AppColors.mainTextColor),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    InputWidget(label: "Full name", onChange: name),
                    InputWidget(label: "Email", onChange: email),
                    InputWidget(
                        label: "Password",
                        onChange: password,
                        isPassword: true),
                    InputWidget(
                        label: "Confirm Password ",
                        onChange: comPassword,
                        isPassword: true),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ButtonWidget(
                    text: "Sign up",
                    textColor: AppColors.secondaryTextColor,
                    bgColor: AppColors.secondaryColor,
                    onPressed: () => signup(context),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    InkWell(
                      onTap: () => logIn(context),
                      child: const Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    )
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
