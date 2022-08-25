class Invontaire {
  String num;
  String agent;
  String date;
  bool isVerified;

  List<ArticleInvontaire> articles;

  Invontaire(
      {required this.num,
        required this.agent,
      required this.date,
      required this.articles,
      required this.isVerified});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "num": num,
      "agent":agent,
      "date": date,
      "articles": ArticleInvontaire.toJsonList(articles),
      "isverified": isVerified
    };
  }

  static Invontaire fromJson(Map<String, dynamic> invontaire) {
    return Invontaire(
      agent: invontaire["agent"],
        num: invontaire["num"].toString(),
        date: invontaire["date"],
        articles: ArticleInvontaire.fromJsonList(invontaire["articles"]),
        isVerified: invontaire["isverified"]);
  }

  static List<Invontaire> fromJsonList(List<Map<String, dynamic>> factures) {
    List<Invontaire> lFacture = [];
    for (var facture in factures) {
      // sauter s'il ya une erreur dans un certain article
      try {
        lFacture.add(fromJson(facture));
      } catch (e) {
        print(e);
        continue;
      }
    }
    return lFacture;
  }
}

class ArticleInvontaire {
  String id;
  String intitule;
  double prix;
  int quantite;
  String depot;
  bool isVerif;
  String emplacement;

  ArticleInvontaire(
      {required this.id,
        required this.isVerif,
      required this.intitule,
      required this.prix,
      required this.quantite,
      required this.depot,
      required this.emplacement});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "intitule": intitule,
      "isverified": isVerif,
      "quantite": quantite,
      "depot": depot,
      "emplacement": emplacement,
      "prix": prix,
      "id": id
    };
  }

  static ArticleInvontaire fromJson(Map<String, dynamic> article) {
    return ArticleInvontaire(
        id: article["id"],
        isVerif: article["isverified"],
        intitule: article["intitule"],
        prix: double.parse(article["prix"].toString()),
        quantite: int.parse(article["quantite"].toString()),
        emplacement: article["emplacement"],
        depot: article["depot"]);
  }

  static List<ArticleInvontaire> fromJsonList(
      List<Map<String, dynamic>> articles) {
    List<ArticleInvontaire> lArticles = [];
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

  static List<Map<String, dynamic>> toJsonList(List<ArticleInvontaire> articles) {
    List<Map<String, dynamic>> lArticles = [];
    for (var article in articles) {
      // sauter s'il ya une erreur dans un certain article
      try {
        lArticles.add(article.toJson());
      } catch (e) {
        continue;
      }
    }
    return lArticles;
  }
}
