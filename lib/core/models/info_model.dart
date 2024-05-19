import 'package:company_project/core/models/bureau_model.dart';

class InfoModel extends BureauModel {
  InfoModel({
    super.code, super.design,
    super.marque,
    super.imagePath,
    super.desc,
    super.prixNormal,
     super.categ});


  infoModel(Map<String, dynamic> json) {
    return InfoModel(
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