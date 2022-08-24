import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:store/models/article.dart';
import 'package:store/utils/app_layout.dart';
import 'package:store/widgets/appbar_widget.dart';
import 'package:store/widgets/title_widget.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)!.settings.arguments as Article;

    List<DataRow> getDataRow(Article article) {
      List<DataRow> dataRow = [];
      article.toJson().forEach((key, value) {
        dataRow.add(DataRow(
          cells: [
            DataCell(Text(key)),
            DataCell(Text(value)),
          ],
        ));
      });
      return dataRow;
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBarHome(context),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getWidth(5),
              vertical: AppLayout.getHeight(5)),
          child: Column(
            children: [
              TitleWidget(title: article.runtimeType.toString()),
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text("")),
                            DataColumn(label: Text("")),
                          ],
                          rows: getDataRow(article),
                        ),
                      ),
                    ),
                    Gap(AppLayout.getHeight(10)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppLayout.getHeight(10),
                          horizontal: AppLayout.getWidth(10)),
                      child: Center(
                        child: QrImage(
                          data: article.id,
                          version: QrVersions.auto,
                          size: AppLayout.getWidth(200),
                          gapless: false,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
