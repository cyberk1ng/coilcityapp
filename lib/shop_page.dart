import 'package:flutter/material.dart';
import 'package:playground/data/constant.dart';
import 'package:playground/product_view_page.dart';
//import 'package:playground/widgets/header_widget.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<bool> _isLiked = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 80),
        child: AppBar(),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 2, right: 2, bottom: 2),
        padding: EdgeInsets.all(4),
        child: GridView.builder(
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
                                builder: (context) => const ProductviewPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "OutSide Ready",
                        style: KTextStyle.textStyleforcc
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          margin: EdgeInsets.only(bottom: 5, right: 12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(212, 112, 100, 0.9),
                              width: 2.0,
                              strokeAlign: BorderSide.strokeAlignCenter,
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
    );
  }
}
