import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/pages/product_view_page.dart';
import 'package:playground/providers/products_provider.dart';

class ProductsfeedPage extends ConsumerStatefulWidget {
  const ProductsfeedPage({super.key});

  @override
  ConsumerState<ProductsfeedPage> createState() => _ProductsfeedPageState();
}

class _ProductsfeedPageState extends ConsumerState<ProductsfeedPage> {

  void logout(){
    FirebaseAuth.instance.signOut();
  }


//  final List<bool> _isLikedPost = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    final productFeed = ref.watch(productfeedProvider);
    return Scaffold(
        
        body: ListView.builder(
          
          itemCount: productFeed.length,
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
                child: Padding(
                  padding: const EdgeInsets.all(.0),
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
                            margin: EdgeInsets.only(left: 15),
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
                            padding: EdgeInsets.only(right: 100),
                            child: Text(
                              "Coil City@ New_products",
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                        child: GestureDetector(
                          child: Image.asset(
                             productFeed[index].image,
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
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                               /*  setState(() {
                                  _isLikedPost[index] = !_isLikedPost[index];
                                }); */
                              },
                              child: Icon(
                                Icons.favorite_border
                               /*  _isLikedPost[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isLikedPost[index]
                                    ? Color.fromRGBO(212, 112, 100, 0.9)
                                    : Colors.teal,
                                size: 30, */
                              ),
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
              ),
            );
          },
        ));
  }
}
