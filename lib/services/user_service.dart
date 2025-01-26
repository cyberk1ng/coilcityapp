// services/user_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  static const String apiUrl =
      "https://coilcity.com/api/index.php/v1/mini/getUser";

  // getting the users data from the API
  static Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // decodeing the json response
    final Map<String, dynamic> data = json.decode(response.body);

    // accessing the "data" key in the json response
    final List<dynamic> userList = data['data'];

    // converting here the list of dynamic returned objects to a list of user objects
    return userList.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception("Failed to fetch users");
  }
}

}
