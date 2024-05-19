import 'package:company_project/core/models/bureau_model.dart';

class BagModel extends BureauModel{
 // String? quantityyy;
  BagModel({
    //this.quantityyy,
    super.code, super.design,
    super.marque,
    super.imagePath,
    super.desc,
    super.prixNormal,
     super.categ});
   // Ajout de la quantité

  bagModel(Map<String, dynamic> json) {
    return BagModel(
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
