import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderPageState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Provide the size of the widget
}

class _HeaderPageState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            height: 100,
            child: Image.asset(
              'images/coilcityLogo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
