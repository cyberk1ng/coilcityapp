import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final List<String> _items = ["S", "M", "L", "X", "XL"];

  final List<int?> _selectedQty = List.generate(10, (index) => 1);
  final List<String> _selectedSize = List.generate(5, (index) => "S");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
                  "WishList",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
                ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Container(
                margin: EdgeInsets.only(right: 300, top: 20),
                child: Text(
                  "2 Articles",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
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
                                      Container(
                                        child: DropdownButton<String>(
                                          value: _selectedSize[index],
                                          items: _items.map(
                                            (String item) {
                                              return DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(item),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedSize[index] = newValue!;
                                            });
                                          },
                                          icon: Icon(Icons.arrow_drop_down),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.teal, // Underline color
                                          ),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        height: 20.0,
                                        child: VerticalDivider(),
                                      ),
                                      Container(
                                        child: DropdownButton(
                                          value: _selectedQty[index],
                                          items: List.generate(
                                            5,
                                            (index) => DropdownMenuItem<int>(
                                              value: index + 1,
                                              child: Text("${index + 1}"),
                                            ),
                                          ),
                                          onChanged: (int? newValue) {
                                            setState(
                                              () {
                                                _selectedQty[index] = newValue;
                                              },
                                            );
                                          },
                                          icon: Icon(Icons.arrow_drop_down),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.teal, // Underline color
                                          ),
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
                                    margin: EdgeInsets.only(left: 56, bottom: 60),
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 56, bottom: 8,),
                                    child: Icon(Icons.add_shopping_cart_outlined,),
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
