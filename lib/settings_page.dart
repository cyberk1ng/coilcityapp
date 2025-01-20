import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page!'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Enter Text: ${_controller.text}');
                    },
                    child: const Icon(Icons.person),
                  ),
                ],
              ),
              const Divider(),
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
                  ElevatedButton(
                    onPressed: () {
                      debugPrint('Enter Text: ${_controller.text}');
                    },
                    child: const Icon(Icons.remove_red_eye),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (bool? newBool) {}),
                  Text(
                    'Remeber Me',
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Login')),
                  ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
                ],
              ),
              Divider(),
              TextButton(onPressed: () {}, child: Text('Forgot Login?')),
            ],
          ),
        ),
      ),
    );
  }
}
