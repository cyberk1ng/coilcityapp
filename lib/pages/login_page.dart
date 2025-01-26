import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:playground/components/my_textfield.dart';
import 'package:playground/helper/helper_function.dart';
import 'package:playground/pages/register_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  void login () async {
    // showing the loading circle first

    showDialog(context: context, builder: (context) =>  Center(
      child: CircularProgressIndicator(),
    ),);

    //try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: pwcontroller.text,);

      if(context.mounted) Navigator.pop(context);
    }

    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayUserMessage(e.code, context);
    }
  }


  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  bool isClicked = false;

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
                  controller: emailcontroller,
                  hintText: "username",
                ),
                const SizedBox(height: 10),
                MyTextField(
                  obsureText: true,
                  controller: pwcontroller,
                  hintText: "password",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        "Forgott Password?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                    ),
                    TextButton(
                      child: Text(
                        "Register Here",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
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
