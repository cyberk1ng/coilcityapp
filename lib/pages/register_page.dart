import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playground/components/my_textfield.dart';
import 'package:playground/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController confirmPwcontroller = TextEditingController();

  void registeUser() async {
    // firstly a loading circle
     

    //confirm pw match
    if (pwcontroller.text != confirmPwcontroller.text) {
      Navigator.pop(context);
      print("not a match");

      displayUserMessage("Passwords don't match!", context);
    } else {
      //try to create a user
      try {
        //creating user here
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: pwcontroller.text,
        );

        // here creating a user document and adding it to firestore

        createUserDoc(userCredential);

        //popping loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //popping loading circle

        //displaying error message to user
        displayUserMessage(e.code, context);
      }
    }
  }

  // creating a user document and collect them in firestone
  Future<void> createUserDoc(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernamecontroller.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/CCemptyLogo.png",
                        width: 150,
                      ),
                      Text(
                        "C O I L C I T Y",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                MyTextField(
                  obsureText: false,
                  controller: usernamecontroller,
                  hintText: "Username",
                ),
                const SizedBox(height: 10),
                MyTextField(
                  obsureText: false,
                  controller: emailcontroller,
                  hintText: "Email",
                ),
                const SizedBox(height: 10),
                MyTextField(
                  obsureText: true,
                  controller: pwcontroller,
                  hintText: "Password",
                ),
                const SizedBox(height: 10),
                MyTextField(
                  obsureText: true,
                  controller: confirmPwcontroller,
                  hintText: "Confirm Password",
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      registeUser();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already hava an Account?",
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          "Login Here",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
