import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/models/facture.dart';
import 'package:store/utils/app_layout.dart';

class LivraisonWidget extends StatelessWidget {
  final Facture facture;
  const LivraisonWidget({Key? key, required this.facture}) : super(key: key);

  List<DataRow> getDataRow(dynamic element) {
    List<DataRow> dataRow = [];
    element.toJson().forEach((key, value) {
      dataRow.add(DataRow(
        cells: [
          DataCell(Text("$key :")),
          DataCell(Text(value)),
        ],
      ));
    });
    return dataRow;
  }

  DataTable getDataTable(List<ArticleFacture> article) {
    List<DataRow> dataRow = [];
    for (var element in article) {
      dataRow.add(DataRow(
        cells: [
          DataCell(Text(element.intitule)),
          DataCell(Text(element.quantite.toString())),
          DataCell(Text(element.prix.toString())),
        ],
      ));
    }
    return DataTable(columns: const [
      DataColumn(label: Text("Articles name")),
      DataColumn(label: Text("Quantite")),
      DataColumn(label: Text("Prix")),
    ], rows: dataRow);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
      children: [
        Gap(AppLayout.getHeight(5)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text("Fom :")),
              DataColumn(label: Text("")),
            ],
            rows: getDataRow(facture.to),
          ),
        ),
        Gap(AppLayout.getHeight(5)),
        getDataTable(facture.articles)
      ],
    );
  }
}
