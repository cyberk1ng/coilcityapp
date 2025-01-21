import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String baseUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(7),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 0,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(color: Colors.transparent),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 150,
                        child: Column(
                          children: [
                            Icon(Icons.favorite_border),
                            Image.asset("images/coilproduct10.jpeg"),
                            Text("Product name"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("€50"),
                                Icon(Icons.shopping_cart),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  /* Icon(Icons.favorite_border),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Column(
                      children: [
                        Image.asset("images/coilproduct10.jpeg"),
                      ],

                      
                    ),
                  ),
                  Text("PRoduct 2"),
                  Row(
                    children: [
                      Text("€50"),
                      Icon(Icons.shopping_cart),
                    ],
                  ) */
                ],
              ),
              // Adjust based on your API
            );
          },
        ),
      ),
    );
  }
}
