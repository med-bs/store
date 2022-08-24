class Facture {
  String num;
  double totals;
  String date;
  bool isVerified;

  List<ArticleFacture> articles;
  FromFacture from;
  ToFacture to;

  Facture(
      {required this.num,
      required this.totals,
      required this.date,
      required this.articles,
      required this.from,
      required this.to,
      required this.isVerified});

 Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "num": num,
      "date":date,
      "from":from.toJson(),
      "to":to.toJson(),
      "articles":ArticleFacture.toJsonList(articles),
      "totals":totals,
      "isverified":isVerified
    };
 }

  static Facture fromJson(Map<String, dynamic> facture) {
    return Facture(
        num: facture["num"].toString(),
        totals: double.parse(facture["totals"].toString()),
        date: facture["date"],
        articles: ArticleFacture.fromJsonList(facture["articles"]),
        from: FromFacture.fromJson(facture["from"]),
        to: ToFacture.fromJson(facture["to"]),
    isVerified: facture["isverified"]);
  }

  static List<Facture> fromJsonList(List<Map<String, dynamic>> factures) {
    List<Facture> lFacture = [];
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

class FromFacture {
  String agent;
  String vehicule;
  FromFacture({required this.agent, required this.vehicule});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "agent": agent,
      "vehicle": vehicule,
    };
  }

  static FromFacture fromJson(Map<String, dynamic> from) {
    return FromFacture(agent: from["agent"], vehicule: from["vehicle"]);
  }
}

class ToFacture {
  String societe;
  String lieu;
  String telephone;
  String email;
  ToFacture(
      {required this.societe,
      required this.lieu,
      required this.email,
      required this.telephone});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "societe": societe,
      "lieu": lieu,
      "telephone": telephone,
      "email": email,
    };
  }

  static ToFacture fromJson(Map<String, dynamic> to) {
    return ToFacture(
        societe: to["societe"],
        lieu: to["lieu"],
        email: to["email"],
        telephone: to["telephone"]);
  }
}

class ArticleFacture {
  String id;
  String intitule;
  double prix;
  int quantite;

  ArticleFacture(
      {required this.id,
      required this.intitule,
      required this.prix,
      required this.quantite});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "intitule": intitule,
      "quantite": quantite,
      "prix": prix,
      "id": id
    };
  }

  static ArticleFacture fromJson(Map<String, dynamic> article) {
    return ArticleFacture(
        id: article["id"],
        intitule: article["intitule"],
        prix: double.parse(article["prix"].toString()),
        quantite: int.parse(article["quantite"].toString()));
  }



  static List<ArticleFacture> fromJsonList(
      List<Map<String, dynamic>> articles) {
    List<ArticleFacture> lArticles = [];
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


  static List<Map<String, dynamic>> toJsonList(
      List<ArticleFacture> articles) {
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
