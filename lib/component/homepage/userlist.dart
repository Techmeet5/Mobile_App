import 'dart:convert';

class User {
  final String? username;
  final String? name;
  final String? email;
  const User({
    this.username,
    this.name,
    this.email,
  });

  User copyWith({
    String? username,
    String? name,
    String? email,
  }) {
    return User(
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username:map['username'],
      name:map['name'] ,
      email:map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(username: $username, name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.username == username &&
      other.name == name &&
      other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ name.hashCode ^ email.hashCode;
}
