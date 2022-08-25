import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/models/invontaire.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/input_widget.dart';
import 'package:store/widgets/invontaire_widget.dart';
import 'package:store/widgets/textInvontaire_widget.dart';
import 'package:store/widgets/text_widget.dart';
import 'package:store/widgets/title_widget.dart';

class InvontaireView extends StatefulWidget {
  const InvontaireView({Key? key}) : super(key: key);

  @override
  State<InvontaireView> createState() => _InvontaireViewState();
}

class _InvontaireViewState extends State<InvontaireView> {

  @override
  Widget build(BuildContext context) {
    Invontaire invontaire =
        ModalRoute.of(context)!.settings.arguments as Invontaire;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: appBarHome(context),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(5),
                vertical: AppLayout.getHeight(5)),
            child: Column(
              children: [
                TitleWidget(
                    title: "Invontaire${invontaire.num} ${invontaire.date}"),
                Flexible(child: ListView.builder(itemCount: invontaire.articles.length,itemBuilder: (context, index){
                  return Container(margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        invontaire.articles[index].isVerif
                            ? const Icon(
                          Icons.verified_outlined,
                          color: Colors.green,
                        )
                            : const Icon(Icons.not_interested,
                            color: Colors.red),
                        TextWidget(text:"Name : ${invontaire.articles[index].intitule}"),
                        InvontaireWidget(label: "Quantite", valeur: invontaire.articles[index].quantite.toString(), isValid: invontaire.articles[index].isVerif,isNumber: true,),
                        InvontaireWidget(label: "prix", valeur: invontaire.articles[index].prix.toString(), isValid: invontaire.articles[index].isVerif,isNumber: true,),
                        InvontaireWidget(label: "Depot", valeur: invontaire.articles[index].depot, isValid: invontaire.articles[index].isVerif),
                        InvontaireWidget(label: "Emplacement", valeur: invontaire.articles[index].emplacement, isValid: invontaire.articles[index].isVerif),
                      ],
                    ),
                  );
                })
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: invontaire.isVerified == true ?
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              primary: AppColors.bgColor
          ),
          onPressed: (){},
          child: const Text('Invontaire deja verifier',style: TextStyle(color: AppColors.mainTextColor),),
        )
            :
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              primary: AppColors.bgColor
          ),
          onPressed: ()=> {},
          child: const Text('Verifier',style: TextStyle(color: AppColors.mainTextColor),),
        ),
      ),
    );
  }
}
