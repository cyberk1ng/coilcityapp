import 'package:flutter/material.dart';
import 'package:playground/login_page.dart';
import 'package:playground/products_feed_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductsfeedPage(),
              ),
            );
          },
          child: const Text('Products Feeds'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Text('Login'),
        ),
       
       
      ],),
    );
  }
}
