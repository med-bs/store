import 'package:flutter/material.dart';
import 'package:store/models/facture.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_info_list.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/search_widget.dart';
import 'package:store/widgets/title_widget.dart';

class AllBonLivraisonView extends StatefulWidget {
  const AllBonLivraisonView({Key? key}) : super(key: key);

  @override
  State<AllBonLivraisonView> createState() => _AllBonLivraisonViewState();
}

class _AllBonLivraisonViewState extends State<AllBonLivraisonView> {
  late List<Facture> factures = Facture.fromJsonList(facturesList);
  late List<Facture> facturesResult;

  int? sortColumnIndex;
  late bool isAscending;

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
      if (columnIndex == 1) {
        facturesResult.sort((facture1, facture2) => compareString(
            ascending, facture1.date, facture2.date));
      } else if (columnIndex == 2){
        facturesResult.sort((facture1, facture2) => compareString(
            ascending, facture1.to.societe, facture2.to.societe));
      }
    });
  }

  int compareString(bool ascending, String value1, String value2) {
    value1 = value1.toLowerCase();
    value2 = value2.toLowerCase();

    return ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }

  void updateList(String query) {
    setState(() {
      facturesResult = factures
          .where((facture) =>
          facture.to.societe.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onLangPress(Object arg) {
    Navigator.pushNamed(context, AppRoutes.livraison, arguments: arg);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    facturesResult = factures;
    isAscending = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(5),
            vertical: AppLayout.getHeight(5)),
        child: Column(
          children: [
            const TitleWidget(title: "Bon De Livraison"),
            SearchInputWidget(onChange: updateList, qrCodeAction: "Livraison",qr: false,),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: isAscending,
                        sortColumnIndex: sortColumnIndex,
                        columns: [
                          const DataColumn(
                              label: Text("N° Livraison",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: const Text("Date ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onSort: onSort),
                          DataColumn(
                              label: const Text("Société ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onSort: onSort),
                        ],
                        rows: facturesResult
                            .map(
                              (object) => DataRow(
                            cells: [
                              DataCell(Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(object.num),
                                      object.isVerified
                                          ? const Icon(
                                        Icons.verified_outlined,
                                        color: Colors.green,
                                      )
                                          : const Icon(Icons.not_interested,
                                          color: Colors.red),
                                    ],
                                  ))),
                              DataCell(Text(object.date)),
                              DataCell(Text(object.to.societe)),
                            ],
                            onLongPress: () => onLangPress(object),
                          ),
                        )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
