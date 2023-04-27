class User {

  final String username;
  final String email;
  final bool isEnabled;

  User({required this.username, required this.email, required this.isEnabled});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      isEnabled: json['state'] == 'enable',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'state': isEnabled ? 'enable' : 'disable',
    };
  }
}