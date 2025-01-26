// This class maps the jason response.

class User {
  final int id;
  final String username;
  final String email;

  User({required this.id, required this.username, required this.email});

  // Factory constructor to convert JSon to User Obj

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

}



