import 'package:flutter/material.dart';

class ProductviewPage extends StatefulWidget {
  const ProductviewPage({super.key});

  @override
  State<ProductviewPage> createState() => _ProductviewPageState();
}

class _ProductviewPageState extends State<ProductviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product View Page'),
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
              child: const Center(
                child: Column(
                  children: [
                    Text(
                      'OutSide Ready',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "In Stock",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "€50.00",
                          style: TextStyle(
                            fontSize: 20,
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
                      Icons.shopping_cart,
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
          ],
        ),
      ),
    );
  }
}
