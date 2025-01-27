import 'package:flutter/material.dart';
import 'package:playground/components/products_sizes.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final List<String> _itemsSizes = ["S", "M", "L", "X", "XL"];

  final List<String> _selectedSize = List.generate(5, (index) => "S");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     
     // drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "WishList",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                margin: EdgeInsets.only(right: 300, top: 20),
                child: Text(
                  "2 Articles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  ...List.generate(
                    2,
                    (index) {
                      return Card(
                        elevation: 4.0,
                        shadowColor: Colors.black,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(9),
                              child: Image.asset(
                                "images/coilproduct13.jpeg",
                                fit: BoxFit.contain,
                                height: 110,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(9),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "OutSide Ready",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "50,99 €",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ProductsSizes(
                                        items: _itemsSizes,
                                        selectedSize: _selectedSize[index],
                                        onChanged: (newSize) {
                                          setState(
                                            () {
                                              _selectedSize[index] = newSize;
                                            },
                                          );
                                        },
                                        underlineColor: Colors.teal,
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 50),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 56, bottom: 60),
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 56,
                                      bottom: 8,
                                    ),
                                    child: Icon(
                                      Icons.add_shopping_cart_outlined,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
