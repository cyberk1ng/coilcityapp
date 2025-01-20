import 'package:flutter/material.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({super.key});

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Battleship'),
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
                child: Text(
                  'This szn looks...',
                  style: TextStyle(color: Colors.white),
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
                  Icons.favorite,
                  color: Color.fromRGBO(212, 112, 100, 0.9),
                ),
              ],
            ),
            Column(
              children: [
                Text("This week sales is on"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
