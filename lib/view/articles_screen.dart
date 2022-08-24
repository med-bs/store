import 'package:flutter/material.dart';
import 'package:store/models/article.dart';
import 'package:store/routes/route.dart';
import 'package:store/utils/app_colors.dart';
import 'package:store/utils/app_info_list.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/search_widget.dart';
import 'package:store/widgets/title_widget.dart';

class AllArticlesView extends StatefulWidget {
  const AllArticlesView({Key? key}) : super(key: key);

  @override
  State<AllArticlesView> createState() => _AllArticlesViewState();
}

class _AllArticlesViewState extends State<AllArticlesView> {
  late List<Article> articles = Article.fromJsonList(articlesList);
  late List<Article> articlesResult;
  int? sortColumnIndex;
  late bool isAscending;

  void onTap({required String id, required String type}) {
    print("$type  $id");
  }

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
      if (columnIndex == 1) {
        articlesResult.sort((article1, article2) =>
            compareString(ascending, article1.intitule, article2.intitule));
      } else {
        articlesResult.sort((article1, article2) => ascending
            ? article1.prix.compareTo(article2.prix)
            : article2.prix.compareTo(article1.prix));
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
      articlesResult = articles
          .where((article) =>
              article.intitule.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onLangPress(Object arg) {
    Navigator.pushNamed(context, AppRoutes.article, arguments: arg);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    articlesResult = articles;
    isAscending = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addArticle),
        tooltip: 'Add article',
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
            const TitleWidget(title: "Articles"),
            SearchInputWidget(onChange: updateList, qrCodeAction: "Article"),
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
                          DataColumn(
                              label: Text("Intitulé ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onSort: onSort),
                          DataColumn(
                              label: Text("Categorie",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text("Prix ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              onSort: onSort),
                        ],
                        rows: articlesResult
                            .map(
                              (object) => DataRow(
                                cells: [
                                  DataCell(Text(object.intitule)),
                                  DataCell(Text(object.categorie)),
                                  DataCell(Text(object.prix.toString())),
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
