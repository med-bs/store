import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/textInvontaire_widget.dart';
import 'package:store/widgets/text_widget.dart';

class InvontaireWidget extends StatelessWidget {
  final String valeur;
  final String label;
  final bool isValid;
  final bool isNumber;

  const InvontaireWidget({Key? key, required this.label, required this.valeur, required this.isValid, this.isNumber=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(text:"$label : $valeur"),
        Gap(AppLayout.getWidth(5)),
        TextWidget(text:"Niew :"),
        Gap(AppLayout.getWidth(5)),
        isValid ? TextWidget(text:valeur) : InvontaireFormFiled(initTexte: valeur,editable: isValid,isNumber: isNumber),
      ],
    );
  }
}
