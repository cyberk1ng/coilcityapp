import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playground/components/my_textfield.dart';
import 'package:playground/helper/helper_function.dart';
import 'package:playground/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

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
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    //confirm pw match
    if (pwcontroller.text != confirmPwcontroller.text) {
      Navigator.pop(context);
      print("not a match");

      displayUserMessage("Passwords dont match", context);
    } else {
      //try to create a user
      try {
        //creating user here
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: pwcontroller.text,
        );

        //popping loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //popping loading circle

        //displaying error message to user
        displayUserMessage(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    onPressed: () {
                      registeUser;
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already hava an Account?",
                    ),
                    TextButton(
                      child: Text(
                        "Login Here",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                    )
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
