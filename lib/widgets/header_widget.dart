import 'package:flutter/material.dart';
import 'package:playground/pages/cart_page.dart';
import 'package:playground/pages/wishlist_page.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderPageState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Provide the size of the widget
}

class _HeaderPageState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Set a specific height
      width: 50,
      decoration: BoxDecoration(
        //This here is to set the mix color of header using the LinearGradient Widg.
        gradient: LinearGradient(
          colors: [
            Colors.teal,
            Color.fromRGBO(212, 112, 100, 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.only(left: 0.0, top: 22.0, bottom: 1.0, right: 0.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              width: 111,
              padding: EdgeInsets.only(top: 2),
              child: Image.asset(
                'images/ccLogo2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Wishlist(),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            width: double.infinity,
                            child: AlertDialog(
                              title: Text("Profile"),
                              content: Text("Settings"),
                              actions: [
                                FilledButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("x"))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
