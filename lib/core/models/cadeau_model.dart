import 'package:company_project/core/models/bureau_model.dart';

class CadeauModel extends BureauModel {
  CadeauModel(
      { super.code, super.design,
       super.marque,
       super.imagePath,
       super.desc,
       super.prixNormal,
      super.categ});

  cadeauModel(Map<String,dynamic> json) {
    return CadeauModel(
        code: json["code"],
        design: json["design"],
        imagePath: json["img"],
        desc: json["desc"],
        marque: json["marque"],
        categ: json["categ"],
        prixNormal: json["prix_normal"]
    );
  }
}
