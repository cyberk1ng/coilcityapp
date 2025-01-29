import 'package:flutter/material.dart';
import 'package:playground/components/product_qty.dart';
import 'package:playground/components/products_sizes.dart';
import 'package:playground/pages/shop_products.dart';

class ProductviewPage extends StatefulWidget {
  const ProductviewPage({super.key});

  @override
  State<ProductviewPage> createState() => _ProductviewPageState();
}

class _ProductviewPageState extends State<ProductviewPage> {
  final List<String> _availableSizes = ["S", "M", "L", "XL", "2XL"];
  String _selectedSize = "M";

  int _selectedQty = 1;
  final int _maxQty = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/coilproduct10.jpeg'),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.teal,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.teal,
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 160),
                      child: Text(
                        'OutSide Ready',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            ProductsSizes(
                              items: _availableSizes,
                              selectedSize: _selectedSize,
                              onChanged: (newSize) {
                                setState(
                                  () {
                                    _selectedSize = newSize;
                                  },
                                );
                              },
                              underlineColor: Colors.white,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 20.0,
                              child: VerticalDivider(
                                thickness: 2,
                              ),
                            ),
                            ProductQty(
                              selectedQty: _selectedQty,
                              onChanged: (newQty) {
                                setState(() {
                                  _selectedQty = newQty;
                                });
                              },
                              maxQty: _maxQty,
                              underlineColor: Colors.white,
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "€50.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint("Cart Button Clicked");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Color.fromRGBO(212, 112, 100, 0.9),
                    ),
                  ),
                ),
                Divider(),
                Icon(
                  Icons.share,
                  color: Color.fromRGBO(212, 112, 100, 0.9),
                ),
              ],
            ),
            Divider(
              height: 30,
              thickness: 3,
              color: Colors.teal,
            ),

          ShopProducts(),
          ],
        ),
      ),
    );
  }
}
