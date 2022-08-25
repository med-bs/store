import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:store/models/facture.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/livraison_widget.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../controllers/pdf_livraison_api.dart';

class BonLivraisonView extends StatefulWidget {
  const BonLivraisonView({Key? key}) : super(key: key);

  @override
  State<BonLivraisonView> createState() => _BonLivraisonViewState();
}

class _BonLivraisonViewState extends State<BonLivraisonView> {
  final keySignaturePad = GlobalKey<SfSignaturePadState>();

  void _clearSignaturePad(bool verif) {
    if(!verif){
      keySignaturePad.currentState!.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Facture facture = ModalRoute.of(context)!.settings.arguments as Facture;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: Text(facture.isVerified == true ? 'Livraison deja signer':'Signier le bon de livraison',
          style: const TextStyle(color: AppColors.mainTextColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: AppLayout.getWidth(20),
            color: Colors.black,
          ),
        ),
        actions:facture.isVerified == false ? [
          TextButton(
            onPressed: ()=>_clearSignaturePad(facture.isVerified),
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Text(
              'Clear',
              style: TextStyle(color: AppColors.mainTextColor),
            ),
          ),
        ]:null,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2),
            ),
            margin: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(10),
                vertical: AppLayout.getHeight(10)),
            child:facture.isVerified == true ? null : SfSignaturePad(
              key: keySignaturePad,
            ),
          ),
          const Divider(),
          Text(
            'Total: \$ ${facture.totals}\nDate: ${facture.date}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: LivraisonWidget(facture: facture)),
        ],
      ),
      bottomNavigationBar: facture.isVerified == true ?
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            primary: AppColors.bgColor
        ),
        onPressed: (){},
        child: const Text('View livraison',style: TextStyle(color: AppColors.mainTextColor),),
      )
          :
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            primary: AppColors.bgColor
        ),
        onPressed: ()=>onSubmit(facture),
        child: const Text('Submit',style: TextStyle(color: AppColors.mainTextColor),),
      ),
    );
  }

  Future onSubmit(Facture facture) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    final image = await keySignaturePad.currentState?.toImage();
    final imageSignature = await image!.toByteData(format: ImageByteFormat.png);
    final file = await PdfApi.generatePDF(
      facture: facture,
      imageSignature: imageSignature!,
    );
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (route) => false);
    await OpenFile.open(file.path);
  }
}
