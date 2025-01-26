/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    // Use listen: false when accessing Provider in initState
    Future.microtask(() {
      Provider.of<UserController>(context, listen: false).loadUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: userController.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                final user = userController.users[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.email),
                );
              },
            ),
    );
  }
}
 */