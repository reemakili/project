import 'package:company_project/core/models/bureau_model.dart';
import 'package:company_project/core/models/cadeau_model.dart';
import 'package:company_project/core/models/jouet_model.dart';
import 'package:company_project/pages/bureau_see_all/bureauSeeAll.dart';
import 'package:company_project/pages/categ/Jouets/listJouet.dart';
import 'package:company_project/pages/categ/bagagerie/listbag.dart';
import 'package:company_project/pages/categ/cadeau/ListCadeau.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:company_project/Services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company_project/core/models/bag_model.dart';
import 'package:company_project/pages/pop_ups/detailsProduct_pop.dart';
import 'package:company_project/core/models/info_model.dart';
import '../widgets/categories.dart';
import '../widgets/drawer_widget.dart';
import '../../search_screen/pages/search_screen.dart';
import '../../product_details_screen/pages/product_screen_details.dart';
import 'package:company_project/pages/categ/info/listInfo.dart'; // Import de ListInfo

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> mm = [
    Image.asset("assets/images/promo2.jpg"),
    Image.asset("assets/images/promo3.png"),
    Image.asset("assets/images/promo1.jpg"),
    Image.asset("assets/images/promo4.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logoOff.png',
              height: 75,
              width: 70,
            ),
            Image.asset(
              'assets/images/logo2.png',
              height: 86,
              width: 80,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to SearchScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Nos catégories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DefaultTabController(
              length: 10,
              child: TabBar(
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(),
                padding: EdgeInsets.only(left: 5, top: 5),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-books-48.png"),
                    categoryTitle: "Livres",
                    navName: "listBook",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-office-100.png"),
                    categoryTitle: "Bureautique",
                    navName: "ListBureau",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-computer-48.png"),
                    categoryTitle: "Informatique",
                    navName: "ListInfo",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-papers-64 (1).png"),
                    categoryTitle: "Papeterie",
                    navName: "fsdf",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-parcel-box-ready-for-delivery-and-shipping-48.png"),
                    categoryTitle: "Emballage",
                    navName: ProductDetails.routeName,
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-toys-96.png"),
                    categoryTitle: "Jouets",
                    navName: "Fsdfsd",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-party-100.png"),
                    categoryTitle: "CadeauxetFêtes",
                    navName: "ListCadeau",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-bag-50.png"),
                    categoryTitle: "Bagagerie",
                    navName: "ListBag",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-art-64.png"),
                    categoryTitle: "Beaux-Arts",
                    navName: "ListArt",
                  ),
                  CategoriesWidget(
                    categoryIcon: Image.asset(
                        "assets/images/icons8-love-48.png"),
                    categoryTitle: "Loisirs",
                    navName: "ListLoisirs",
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Nos promotions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CarouselSlider.builder(
              itemCount: mm.length,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  child: mm[index],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Nos produits',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Informatique',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListInfo()),
                          );
                        },
                        child: Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot<InfoModel>>(
                    future: DBService().getSomeData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                            'Erreur : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<InfoModel> dataList = snapshot.data!.docs.map((
                            doc) => doc.data()).toList();
                        return Container(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsPopup(
                                              code: dataList[index].code!,
                                              design: dataList[index].design!,
                                              imagePath: dataList[index]
                                                  .imagePath!,
                                              desc: dataList[index].desc!,
                                              marque: dataList[index].marque!,
                                              prixNormal: dataList[index]
                                                  .prixNormal!,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 150,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              8),
                                          border: Border.all(
                                              color: Colors.blue, width: 1),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Expanded(
                                              child: Image.network(
                                                  dataList[index].imagePath!),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Text(
                                                  dataList[index].design!),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Text(
                                                  'Prix: ${dataList[index]
                                                      .prixNormal} TND'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            DBService().addToWishList(dataList[index],context);
                                            // Action lorsque l'icône favorite est cliquée
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child: IconButton(
                                          onPressed: () {
                                            DBService().addToCart(dataList[index],context);

                                            // Action lorsque l'icône du panier d'achat est cliquée
                                          },
                                          icon: Icon(Icons.shopping_cart),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Aucune donnée trouvée'));
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bagagerie',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListBag()),
                          );
                        },
                        child: Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot<BagModel>>(
                    future: DBService().getSomeBagData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                            'Erreur : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<BagModel> dataList = snapshot.data!.docs.map((
                            doc) => doc.data()).toList();
                        return Container(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                                dataList[index].imagePath!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(dataList[index].design!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Prix: ${dataList[index]
                                                .prixNormal.toString()} TND'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToWishList(dataList[index],context);
                                          // Action lorsque l'icône favorite est cliquée
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                        onPressed: (

                                            ) {
                                          DBService().addToCart(dataList[index],context);
                                          // Action lorsque l'icône du panier d'achat est cliquée
                                        },
                                        icon: Icon(Icons.shopping_cart),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Aucune donnée trouvée'));
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bureautiques',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BureauSeeAll()),
                          );
                        },
                        child: Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot<BureauModel>>(
                    future: DBService().getSomeBurData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                            'Erreur : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<BureauModel> dataList = snapshot.data!.docs.map((
                            doc) => doc.data()).toList();
                        return Container(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                                dataList[index].imagePath!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(dataList[index].design!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Prix: ${dataList[index]
                                                .prixNormal.toString()} TND'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToWishList(dataList[index],context);
                                          // Action lorsque l'icône favorite est cliquée
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToCart(dataList[index],context);
                                          // Action lorsque l'icône du panier d'achat est cliquée
                                        },
                                        icon: Icon(Icons.shopping_cart),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Aucune donnée trouvée'));
                      }
                    },
                  ),

                  //cadeau//
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadeaux et fetes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListCadeau()),
                          );
                        },
                        child: Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot<CadeauModel>>(
                    future: DBService().getSomeCadData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                            'Erreur : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<CadeauModel> dataList = snapshot.data!.docs.map((
                            doc) => doc.data()).toList();
                        return Container(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                                dataList[index].imagePath!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(dataList[index].design!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Prix: ${dataList[index]
                                                .prixNormal.toString()} TND'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToWishList(dataList[index],context);
                                          // Action lorsque l'icône favorite est cliquée
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToCart(dataList[index],context);
                                          // Action lorsque l'icône du panier d'achat est cliquée
                                        },
                                        icon: Icon(Icons.shopping_cart),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Aucune donnée trouvée'));
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jouets',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          color: Colors.indigo,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListJouet()),
                          );
                        },
                        child: Text(
                          'Voir tout',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder<QuerySnapshot<JouetModel>>(
                    future: DBService().getSomeToyData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(
                            'Erreur : ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<JouetModel> dataList = snapshot.data!.docs.map((
                            doc) => doc.data()).toList();
                        return Container(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 150,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            child: Image.network(
                                                dataList[index].imagePath!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(dataList[index].design!),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('Prix: ${dataList[index]
                                                .prixNormal.toString()} TND'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          DBService().addToWishList(dataList[index],context);
                                          // Action lorsque l'icône favorite est cliquée
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: IconButton(
                                        onPressed: (

                                            ) {
                                          DBService().addToCart(dataList[index],context);
                                          // Action lorsque l'icône du panier d'achat est cliquée
                                        },
                                        icon: Icon(Icons.shopping_cart),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('Aucune donnée trouvée'));
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showProductDetailsPopup(BuildContext context, JouetModel product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProductDetailsPopup(
          code: product.code!,
          design: product.design!,
          imagePath: product.imagePath!,
          desc: product.desc!,
          marque: product.marque!,
          prixNormal: product.prixNormal!,
        );
      },
    );
  }
}
