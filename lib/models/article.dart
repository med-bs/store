class Article {
  String id;
  String intitule;
  String designation;
  String unite;
  double prix;
  String categorie;
  String date;

  Article(
      {required this.id,
      required this.intitule,
      required this.designation,
      required this.unite,
      required this.prix,
      required this.categorie,
      required this.date});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "intitulé": intitule,
      "désignation": designation,
      "unité": unite,
      "prix": prix.toString(),
      "catégorie": categorie,
      "date": date
    };
  }

  static Article fromJson(Map<String, dynamic> article) {
    return Article(
        id: article["id"],
        intitule: article["intitulé"],
        designation: article["désignation"],
        unite: article["unité"],
        prix: double.parse(article["prix"]),
        categorie: article["catégorie"],
        date: article["date"]);
  }

  static List<Article> fromJsonList(List<Map<String, dynamic>> articles) {
    List<Article> lArticles = [];
    for (var article in articles) {
      // sauter s'il ya une erreur dans un certain article
      try {
        lArticles.add(fromJson(article));
      } catch (e) {
        continue;
      }
    }
    return lArticles;
  }
}
