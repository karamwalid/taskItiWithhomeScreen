import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/product_model.dart';
import 'package:flutter_application_1/views/screens/description.dart';

class Body2 extends StatefulWidget {
  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  /////////////////
  late PageController _pageController;
  List<products> productsList = [];
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  ////////////////////
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  ///////////////////
  void didChangeDependencies() {
    super.didChangeDependencies();
    fillingDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Find your product",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                itemCount: productsList.length,
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(productsList[index]),
        );
      },
    );
  }

  Widget carouselCard(products product) {
    return Column(
      children: [
        Hero(
          tag: product.name,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DescriptionPage(
                  myProduct: product,
                );
              }));
            },
            child: Container(
              height: 370,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(product.photoLink), fit: BoxFit.fill),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black26,
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            product.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${product.price} \$ ",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Future fillingDataList() async {
    var data = await FirebaseFirestore.instance
        .collection("MainScreen")
        .doc("home Products")
        .collection("products")
        .get();
    setState(() {
      productsList =
          List.from(data.docs.map((doc) => products.fromFirebase(doc)));
    });
  }
}
