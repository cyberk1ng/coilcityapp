import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final TextEditingController _controller = TextEditingController();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.teal,
              Color.fromRGBO(212, 112, 100, 0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          child: AppBar(
            title: Row(
              children: [Text('Login Page')],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  PreferredSize(
                    preferredSize: const Size.fromHeight(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 113, 113, 0.2),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(iconColor: Colors.teal),
                        onPressed: () {
                          // debugPrint('Enter Text: ${_controller.text}');
                        },
                        child: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  PreferredSize(
                    preferredSize: const Size.fromHeight(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(3, 113, 113, 0.2),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(iconColor: Colors.teal),
                        onPressed: () {},
                        child: const Icon(Icons.remove_red_eye),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isClicked,
                    onChanged: (bool? newBool) {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    checkColor: Colors.black,
                  ),
                  Text(
                    'Remeber Me',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      debugPrint("Login Button Clicked");
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(212, 112, 100, 0.9),
                    ),
                    onPressed: () {
                      debugPrint("Signed Button Clicked");
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Login?',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/coilproduct18.jpeg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
