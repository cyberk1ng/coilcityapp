import 'package:flutter/material.dart';
import 'package:playground/data/constant.dart';
import 'package:playground/pages/wishlist_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage("images/CCemptyLogo.png"),
                        backgroundColor: Colors.white,
                      ),
                    ),
                   
                   
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text(
                    'H O M E',
                    style: KTextStyle.drawerTextStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text(
                    'S E T T I N G S',
                    style: KTextStyle.drawerTextStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text(
                    'F A V O R I T E',
                    style: KTextStyle.drawerTextStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Wishlist(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.collections_bookmark, color: Colors.white),
                  title: Text(
                    'C O L L E C T I O N',
                    style: KTextStyle.drawerTextStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                   
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 50.0),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'L O G O U T',
                style: KTextStyle.drawerTextStyle,
              ),
              onTap: () {
                Navigator.pop(context);
                logout();
              },
            ),
          )
        ],
      ),
    );
  }
}
