import 'package:company_project/core/models/bag_model.dart';
import 'package:company_project/core/models/bureau_model.dart';
import 'package:company_project/core/models/cadeau_model.dart';
import 'package:company_project/core/models/info_model.dart';
import 'package:company_project/core/models/jouet_model.dart';
import 'package:company_project/pages/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  void registerClient(String nom, String prenom, String email, String password,
      BuildContext context) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance.collection('users').add({
        'nom': nom,
        'prenom': prenom,
        'email': email,
      }).then((docRef) {
        print(
            "Utilisateur enregistré avec succès dans Firestore avec l'ID: ${docRef
                .id}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LayoutView()),
        );
      }).catchError((error) {
        print(
            "Erreur lors de l'enregistrement de l'utilisateur dans Firestore: $error");
      });
    }).onError((error, stackTrace) {
      print("Erreur lors de la création du compte: ${error.toString()}");
    });
  }

   registerEntreprise(String nom,
      String email,
      String addLoc,
      String password,
      String registre,
      String matricule,) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance.collection('entreprise').add({
        'nom': nom,
        'email': email,
        'addLoc': addLoc,
        'matricule': matricule,
        'registre': registre,
      }).then((docRef) {
        print(
            "Entreprise enregistrée avec succès dans Firestore avec l'ID: ${docRef
                .id}");
      }).catchError((error) {
        print(
            "Erreur lors de l'enregistrement de l'entreprise dans Firestore: $error");
      });
    }).onError((error, stackTrace) {
      print("Erreur lors de la création du compte: ${error.toString()}");
    });
  }





















  Future<QuerySnapshot<InfoModel>> getData() async {
    var collectionRef =
    FirebaseFirestore.instance.collection("info").withConverter<InfoModel>(
      fromFirestore: (snapshot, options) =>
          InfoModel().infoModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.get();
  }

  Future<QuerySnapshot<InfoModel>> getSomeData() async {
    var collectionRef = FirebaseFirestore.instance.collection("info")
        .withConverter<InfoModel>(
      fromFirestore: (snapshot, options) =>
          InfoModel().infoModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.limit(3).get(); // Limite à seulement 3 produits
  }


  Future<QuerySnapshot<BagModel>> getBagData() async {
    var collectionRef =
    FirebaseFirestore.instance.collection("bagagerie").withConverter<BagModel>(
      fromFirestore: (snapshot, options) =>
          BagModel().bagModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.get();
  }

  Future<QuerySnapshot<BagModel>> getSomeBagData() async {
    var collectionRef = FirebaseFirestore.instance.collection("bagagerie")
        .withConverter<BagModel>(
      fromFirestore: (snapshot, options) =>
          BagModel().bagModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.limit(3).get(); // Limite à seulement 3 produits
  }


  Future<QuerySnapshot<BureauModel>> getBurData() async {
    var collectionRef =
    FirebaseFirestore.instance.collection("bureau").withConverter<BureauModel>(
      fromFirestore: (snapshot, options) =>
          BureauModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );

    return await collectionRef.get();
  }

  Future<QuerySnapshot<BureauModel>> getSomeBurData() async {
    var collectionRef = FirebaseFirestore.instance.collection("bureau")
        .withConverter<BureauModel>(
      fromFirestore: (snapshot, options) =>
          BureauModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.limit(3).get(); // Limite à seulement 3 produits
  }


  Future<List<BureauModel>> getProductsByCategory(String category) async {
      var querySnapshot = FirebaseFirestore.instance
          .collection('bureau').withConverter<BureauModel>(
        fromFirestore: (snapshot, options) =>
            BureauModel.fromJson(snapshot.data()!),
        toFirestore: (model, options) => model.toJson(),
      ).where('categ', isEqualTo: category);
      var data1 = await querySnapshot.get();
      var data = data1.docs
          .map((doc) => doc.data()).toList();
      return data;
  }



  Future<List<JouetModel>> getToyByCategory(String category) async {
    var querySnapshot = FirebaseFirestore.instance
        .collection('jouets').withConverter<JouetModel>(
      fromFirestore: (snapshot, options) =>
          JouetModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    ).where('categ', isEqualTo: category);
    var data1 = await querySnapshot.get();
    var data = data1.docs
        .map((doc) => doc.data()).toList();
    return data;
  }

//cadeau
  Future<QuerySnapshot<CadeauModel>> getSomeCadData() async {
    var collectionRef = FirebaseFirestore.instance.collection("cadeau")
        .withConverter<CadeauModel>(
      fromFirestore: (snapshot, options) =>
          CadeauModel().cadeauModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.limit(3).get(); // Limite à seulement 3 produits
  }



  Future<QuerySnapshot<CadeauModel>> getCadData() async {
    var collectionRef =
    FirebaseFirestore.instance.collection("cadeau").withConverter<CadeauModel>(
      fromFirestore: (snapshot, options) =>
          CadeauModel().cadeauModel(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.get();
  }




  Future<QuerySnapshot<JouetModel>> getSomeToyData() async {
    var collectionRef = FirebaseFirestore.instance.collection("jouets")
        .withConverter<JouetModel>(
      fromFirestore: (snapshot, options) =>
          JouetModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.limit(3).get(); // Limite à seulement 3 produits
  }


  Future<QuerySnapshot<JouetModel>> getToyData() async {
    var collectionRef =
    FirebaseFirestore.instance.collection("jouets").withConverter<JouetModel>(
      fromFirestore: (snapshot, options) =>
          JouetModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return await collectionRef.get();
  }









  // Fonction générique pour ajouter le model Bureau à la collection "Cart"
  Future<void> addToCart(BureauModel model, BuildContext context) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection("Cart").withConverter<BureauModel>(
        fromFirestore: (snapshot, options) => BureauModel.fromJson(snapshot.data()!),
        toFirestore: (model, options) => model.toJson(),
      );
      var data = collectionRef.doc();
      await data.set(model);
      _showSnackBar(context, 'Ajouté avec succès au panier');
    } catch (error) {
      _showSnackBar(context, 'Erreur d\'ajout');
    }
  }

  Stream<QuerySnapshot<BureauModel>> streamGetData() {
    var collectionRef = FirebaseFirestore.instance.collection("Cart").withConverter<BureauModel>(
      fromFirestore: (snapshot, options) => BureauModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return collectionRef.snapshots();
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }


  Future<void> addToWishList(BureauModel model, BuildContext context) async {
    try {
      var collectionRef = FirebaseFirestore.instance.collection("wishList").withConverter<BureauModel>(
        fromFirestore: (snapshot, options) => BureauModel.fromJson(snapshot.data()!),
        toFirestore: (model, options) => model.toJson(),
      );
      var data = collectionRef.doc();
      await data.set(model);
      _showSnackBar(context, 'Ajouté avec succès au favoris');
    } catch (error) {
      _showSnackBar(context, 'Erreur d\'ajout au favoris');
    }
  }

  Stream<QuerySnapshot<BureauModel>> streamGetFavData() {
    var collectionRef = FirebaseFirestore.instance.collection("wishList").withConverter<BureauModel>(
      fromFirestore: (snapshot, options) => BureauModel.fromJson(snapshot.data()!),
      toFirestore: (model, options) => model.toJson(),
    );
    return collectionRef.snapshots();
  }

  void _showSnackBarFav(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _clearCart() async {
    var collection = FirebaseFirestore.instance.collection('Cart');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }



}






