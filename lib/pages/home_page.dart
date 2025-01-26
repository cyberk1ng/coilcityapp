import 'package:flutter/material.dart';
import 'package:playground/auth/auth.dart';
import 'package:playground/pages/products_feed_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  builder: (context) => const AuthPage(),
                ),
              );
            },
            child: const Text('Login'),
          ),
         
         
         
        ],),
      ),
    );
  }
}

