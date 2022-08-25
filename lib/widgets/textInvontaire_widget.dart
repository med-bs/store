import 'package:flutter/material.dart';
import 'package:store/utils/app_layout.dart';

class InvontaireFormFiled extends StatelessWidget {
  final String initTexte;
  final bool editable;
  final bool isNumber;
  const InvontaireFormFiled(
      {Key? key,
      required this.initTexte,
      required this.editable, this.isNumber=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.getWidth(100),
      child: TextFormField(
        readOnly: editable,
        initialValue: initTexte,
        keyboardType: isNumber?TextInputType.number:TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            )),
      ),
    );
  }
}
