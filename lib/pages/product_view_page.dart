import 'package:flutter/material.dart';
import 'package:playground/components/product_qty.dart';
import 'package:playground/components/products_sizes.dart';
import 'package:playground/data/constant.dart';

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

  final List<bool> _isLiked = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
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
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  child: GridView.builder(
                    // shrinking the GridView to take only as much height as needed
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 1.0,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 8, top: 3),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isLiked[index] = !_isLiked[index];
                                      });
                                    },
                                    child: Icon(
                                      _isLiked[index]
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: _isLiked[index]
                                          ? Color.fromRGBO(212, 112, 100, 0.9)
                                          : Colors.teal,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "images/coilproduct10.jpeg",
                                      fit: BoxFit.contain,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductviewPage(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text("OutSide Ready",
                                    style: KTextStyle.textStyleforcc),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 12),
                                    child: Text(
                                      "50,99 €",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    margin:
                                        EdgeInsets.only(bottom: 5, right: 12),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            Color.fromRGBO(212, 112, 100, 0.9),
                                        width: 2.0,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.shopping_bag,
                                      color: Colors.teal,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
