import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/button_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  void signUp(context) {
    Navigator.pushNamed(context, AppRoutes.signup);
  }

  void logIn(context) {
    Navigator.pushNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    Size size = AppLayout.getSize(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.bgColor,
            width: double.infinity,
            height: size.height -50,
            padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(30),
              vertical: AppLayout.getHeight(50),
            ),
            child: Column(
              // even space distribution
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    const Text(
                      "inventaire",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                Container(
                  height: size.height / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/welcome.png"),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    // the login button
                    ButtonWidget(
                        text: "Login",
                        textColor: AppColors.mainTextColor,
                        bgColor: AppColors.mainColor,
                        onPressed: () => logIn(context)),
                    // creating the signup button
                    Gap(AppLayout.getHeight(20)),
                    ButtonWidget(
                        text: "Sign up",
                        textColor: AppColors.secondaryTextColor,
                        bgColor: AppColors.secondaryColor,
                        onPressed: () => signUp(context)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
