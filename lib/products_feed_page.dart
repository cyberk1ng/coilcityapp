import 'package:flutter/material.dart';

class ProductsfeedPage extends StatefulWidget {
  const ProductsfeedPage({super.key});

  @override
  State<ProductsfeedPage> createState() => _ProductsfeedPageState();
}

class _ProductsfeedPageState extends State<ProductsfeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products Feeds"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.teal, // Border color
                      width: 5.0, // Border width
                    ),
                    bottom: BorderSide(
                      color: Colors.teal, // Border color
                      width: 1.0, // Border width
                    ),
                    left: BorderSide(
                      color: Colors.teal, // Border color
                      width: 1.0, // Border width
                    ),
                    right: BorderSide(
                      color: Colors.teal, // Border color
                      width: 1.0, // Border width
                    ),

                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.more_horiz,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 2.0,
                              strokeAlign: BorderSide.strokeAlignCenter,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 50,
                          child: Image.asset(
                            "images/CCemptyLogo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            "Coil City@ New_products",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            "3 sec ago",
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(9),
                      margin: EdgeInsets.only(left: 19, right: 10),
                      child: Text(
                          "Check out this new All Season Jacket... you like?"),
                    ),
                    Container(
                      padding: EdgeInsets.all(9),
                      child: Image.asset(
                        "images/coilproduct13.jpeg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.teal,
                            size: 30,
                          ),
                          Icon(
                            Icons.mode_comment_outlined,
                            color: Colors.teal,
                            size: 30,
                          ),
                          Icon(
                            Icons.bookmark_add_outlined,
                            color: Colors.teal,
                            size: 30,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
