import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:store/models/article.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app-qrscan_action.dart';
import 'package:store/utils/app_info_list.dart';
import 'package:store/utils/app_layout.dart';

class QrcodeScan extends StatefulWidget {
  const QrcodeScan({Key? key}) : super(key: key);

  @override
  State<QrcodeScan> createState() => _QrcodeScanState();
}

class _QrcodeScanState extends State<QrcodeScan> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;
  String? result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Article? findArticleById(String? id) {
    Article? article;
    Article.fromJsonList(articlesList).forEach((element) {
      if (element.id == id) {
        article = element;
      }
    });
    return article;
  }

  void getResult(BuildContext context, String? id) {
    Article? article;
    String type = "article";
    setState(() {
      if (type == QrScanAction.article) {
        article = findArticleById(id);
        if (article != null) {
          result = id;
          Navigator.pushNamed(context, AppRoutes.article, arguments: article);
        } else {
          result = "$type not found\n$id";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //String type = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(
            bottom: AppLayout.getHeight(100),
            child: buildResult(),
          ),
          Positioned(
              top: AppLayout.getHeight(10), child: buildControllButtons())
        ],
      ),
    ));
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderWidth: AppLayout.getHeight(10),
          borderLength: AppLayout.getWidth(20),
          borderRadius: AppLayout.getWidth(10),
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  Widget buildResult() {
    return Container(
        padding: EdgeInsets.all(AppLayout.getWidth(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
          color: Colors.white24,
        ),
        child: Text(
          barcode != null ? 'Result : $result' : 'Scan a code!',
          maxLines: 10,
        ));
  }

  Widget buildControllButtons() => Container(
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
          color: Colors.white24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return const Icon(Icons.switch_camera);
                    } else {
                      return Container();
                    }
                  },
                )),
            /*IconButton(
                onPressed: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                icon: FutureBuilder<bool?>(
                  future: controller?.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return Icon(
                          snapshot.data! ? Icons.flash_on : Icons.flash_off);
                    } else {
                      return Container();
                    }
                  },
                )),*/
          ],
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          getResult(context, barcode.code);
        }));
  }
}
