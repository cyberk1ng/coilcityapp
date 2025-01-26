// controllers/user_controller.dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserController extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users => _users;
  bool get isLoading => _isLoading;

  // Trigger fetchUsers from UserService
  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners(); // Notify UI that loading started
    print("Loading users...");

    try {
      // Call the service method
      _users = await UserService.fetchUsers();
      print("Fetched Users: $_users");
    } catch (error) {
      print("Error fetching users: $error");
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify UI that loading finished
      print("Loading complete. Users length: ${_users.length}");
    }
  }
}



