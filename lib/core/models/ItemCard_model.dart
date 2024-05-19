class MenuItem {
  final String design;
  final String prixNormal;
  final String imgPath;
  int quantity;

  MenuItem({required this.design, required this.prixNormal, required this.imgPath, this.quantity = 1});

  // Méthode pour convertir un document Firestore en MenuItem
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      design: json['design'],
      prixNormal: json['prixNormal'],
      imgPath: json['imgPath'],
      quantity: json['quantity'] ?? 1,
    );
  }

  // Méthode pour convertir un MenuItem en format Firestore
  Map<String, dynamic> toJson() {
    return {
      'design': design,
      'prixNormal': prixNormal,
      'imgPath': imgPath,
      'quantity': quantity,
    };
  }
}
