import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // firstly getting the logged in user

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page"),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading circle...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );

            // error
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          // data
          else if (snapshot.hasData) {
            // xtracting the data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Container(
              padding: EdgeInsets.all(10),
              child: Text(user!['username']),
            );
          } else {
            return Text("No Data");
          }
        },
      ),
    );
  }
} 
