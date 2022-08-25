import 'package:flutter/material.dart';
import 'package:store/models/invontaire.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_info_list.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/button_widget.dart';
import 'package:store/widgets/errorwarning.dart';
import 'package:store/widgets/input_widget.dart';
import 'package:store/widgets/invontaire_widget.dart';
import 'package:store/widgets/search_widget.dart';
import 'package:store/widgets/text_widget.dart';
import 'package:store/widgets/title_widget.dart';

class AddInvontairView extends StatefulWidget {
  const AddInvontairView({Key? key}) : super(key: key);

  @override
  State<AddInvontairView> createState() => _AddInvontairViewState();
}

class _AddInvontairViewState extends State<AddInvontairView>{
  List<ArticleInvontaire> allArticle = Invontaire.fromJson(invontairesList[4]).articles;
  late List<ArticleInvontaire> articleResult;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    articleResult =allArticle;
  }

  void updateList(String query) {
    setState(() {
      articleResult = allArticle
          .where((article) =>
          article.intitule.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onSubmit() {
    print("--------");
    print("--------");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: appBarHome(context),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TitleWidget(title: "Add Invontaire"),
                SearchInputWidget(onChange: updateList, qrCodeAction: "Article"),
                Flexible(child: ListView.builder(itemCount: articleResult.length,itemBuilder: (context, index){
                  return Container(margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        TextWidget(text:"Name : ${ articleResult[index].intitule}"),
                        InvontaireWidget(label: "Quantite", valeur:  articleResult[index].quantite.toString(), isValid:  false,isNumber: true,),
                        InvontaireWidget(label: "prix", valeur:  articleResult[index].prix.toString(), isValid: false,isNumber: true,),
                        InvontaireWidget(label: "Depot", valeur:  articleResult[index].depot, isValid:  false),
                        InvontaireWidget(label: "Emplacement", valeur:  articleResult[index].emplacement, isValid: false),
                      ],
                    ),
                  );
                })
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
