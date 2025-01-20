import 'package:flutter/material.dart';
import 'package:playground/learn_flutter.dart';
import 'package:playground/settings_page.dart';

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
                builder: (context) => const LearnFlutter(),
              ),
            );
          },
          child: const Text('Products'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Settings(),
              ),
            );
          },
          child: const Text('Login'),
        ),
      ]),
    );
  }
}
