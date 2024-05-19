import 'package:company_project/core/models/bureau_model.dart';

class JouetModel extends BureauModel {
  JouetModel({
    String? code,
    String? design,
    String? imagePath,
    String? marque,
    String? desc,
    num? prixNormal,
    String? categ,
  }) : super(
    code: code,
    design: design,
    imagePath: imagePath,
    marque: marque,
    desc: desc,
    prixNormal: prixNormal,
    categ: categ,
  );

  // Constructeur à partir d'un objet JSON
  factory JouetModel.fromJson(Map<String, dynamic> json) {
    return JouetModel(
      code: json["code"],
      design: json["design"],
      imagePath: json["img"],
      desc: json["desc"],
      marque: json["marque"],
      prixNormal: json["prix_normal"],
      categ: json["categ"],
    );
  }

}
