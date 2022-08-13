import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/button_widget.dart';
import 'package:store/widgets/errorwarning.dart';
import 'package:store/widgets/input_widget.dart';
import 'package:store/widgets/title_widget.dart';

class AddArticleView extends StatefulWidget {
  const AddArticleView({Key? key}) : super(key: key);

  @override
  State<AddArticleView> createState() => _AddArticleViewState();
}

class _AddArticleViewState extends State<AddArticleView> {
  String _intitule = "";
  String _designation = "";
  String _prix = "";

  void intitule(String value) {
    _intitule = value;
  }

  void designation(String value) {
    _designation = value;
  }

  void prix(String value) {
    _prix = value;
  }

  void onSubmit() {
    print("--------");
    print("in: $_intitule\n_desi::  $_designation !!!!\n paass :: $_prix !");
    print("--------");

    if (_prix == "3") {
      Message.inputErrorOrWarning(context, "prix", "iiiiii prix > 3");
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRoutes.homeBar, arguments: 0, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: appBarHome(context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TitleWidget(title: "Add Article"),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      InputWidget(label: "Intitulé", onChange: intitule),
                      InputWidget(label: "Désignation", onChange: designation),
                      InputWidget(
                          label: "prix", onChange: prix, isNumber: true),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ButtonWidget(
                    text: "Add",
                    textColor: AppColors.secondaryTextColor,
                    bgColor: AppColors.secondaryColor,
                    onPressed: onSubmit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
