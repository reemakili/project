class BureauModel {
  final String? code;
  final String? design;
  final String? imagePath;
  final String? marque;
  final String? categ;
  final String? desc;
  final num? prixNormal;
  int quantity; // Ajout de la quantité

  BureauModel({
    required this.code,
    required this.design,
    required this.imagePath,
    required this.marque,
    required this.categ,
    required this.desc,
    required this.prixNormal,
    this.quantity = 1, // Valeur par défaut de la quantité
  });

  factory BureauModel.fromJson(Map<String, dynamic> json) => BureauModel(
    code: json["code"],
    design: json["design"],
    imagePath: json["img"],
    desc: json["desc"],
    marque: json["marque"],
    categ: json["categ"],
    prixNormal: json["prix_normal"],
    quantity: json["quantity"] ?? 1, // Valeur par défaut
  );

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "design": design,
      "img": imagePath,
      "desc": desc,
      "marque": marque,
      "categ": categ,
      "prix_normal": prixNormal,
      "quantity": quantity,
    };
  }
}
