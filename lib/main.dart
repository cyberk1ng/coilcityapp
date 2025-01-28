import 'package:flutter/material.dart';
import 'package:playground/auth/auth.dart';
import 'package:playground/components/my_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:playground/firebase_options.dart';
import 'package:playground/pages/cart_page.dart';
import 'package:playground/pages/profile_page.dart';
import 'package:playground/pages/wishlist_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: RootPage(),
      routes: {
        '/wishlist_page': (context) => const Wishlist(),
        '/profile_page': (context) => ProfilePage(),
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Container(
                margin: EdgeInsets.only(right: 20, bottom: 5),
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
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
          margin:
              EdgeInsets.only(left: 0.0, top: 22.0, bottom: 1.0, right: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 111,
                padding: EdgeInsets.only(top: 2),
                child: Image.asset(
                  'images/ccLogo2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      // calling the custom drawer component here
      drawer: MyDrawer(),
      body: AuthPage(),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        color: Colors.white, // Optional background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Color.fromARGB(
                    255,
                    92,
                    192,
                    182,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartPage(),
                  ),
                );
              },
              child: Icon(
                Icons.shopping_cart,
                color: Color.fromRGBO(223, 91, 76, 0.898),
                size: 30.0,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Color.fromARGB(
                    255,
                    92,
                    192,
                    182,
                  ),
                ),
              ),
              onPressed: () {},
              child: Icon(
                Icons.search,
                color: Color.fromRGBO(223, 91, 76, 0.898),
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
