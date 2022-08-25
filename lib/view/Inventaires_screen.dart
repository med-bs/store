import 'package:flutter/material.dart';
import 'package:store/models/invontaire.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_info_list.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/search_widget.dart';
import 'package:store/widgets/title_widget.dart';

class AllInvontaireView extends StatefulWidget {
  const AllInvontaireView({Key? key}) : super(key: key);

  @override
  State<AllInvontaireView> createState() => _AllInvontaireViewState();
}

class _AllInvontaireViewState extends State<AllInvontaireView> {
  late List<Invontaire> invontaires = Invontaire.fromJsonList(invontairesList);
  late List<Invontaire> invontairesResult;

  int? sortColumnIndex;
  late bool isAscending;

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
      if (columnIndex == 1) {
        invontairesResult.sort((facture1, facture2) =>
            compareString(ascending, facture1.date, facture2.date));
      } else if (columnIndex == 2) {
        invontairesResult.sort((facture1, facture2) =>
            compareString(ascending, facture1.agent, facture2.agent));
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
      invontairesResult = invontaires
          .where((facture) =>
              facture.date.toLowerCase().contains(query.toLowerCase()) ||
              facture.agent.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onLangPress(Object arg) {
    Navigator.pushNamed(context, AppRoutes.invontaire, arguments: arg);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invontairesResult = invontaires;
    isAscending = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addInvontaire),
        tooltip: 'Add invontaire',
        backgroundColor: AppColors.bgColor,
        child: const Icon(
          Icons.add,
          color: AppColors.mainTextColor,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(5),
            vertical: AppLayout.getHeight(5)),
        child: Column(
          children: [
            const TitleWidget(title: "Invontaire"),
            SearchInputWidget(
              onChange: updateList,
              qrCodeAction: "inv",
              qr: false,
            ),
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
                              label: Text("N° Invontaire",
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
                              label: const Text("Agent ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onSort: onSort),
                        ],
                        rows: invontairesResult
                            .map(
                              (object) => DataRow(
                                cells: [
                                  DataCell(Center(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                  DataCell(Text(object.agent)),
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
