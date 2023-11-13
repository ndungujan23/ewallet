import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final bool isAuthenticated;

  const User({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.isAuthenticated,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'isAuthenticated': isAuthenticated ? 1 : 0,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
      phoneNumber: map['phoneNumber'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      isAuthenticated: map['isAuthenticated'] == 1,
    );
  }

  @override
  List<Object> get props {
    return [
      username,
      email,
      password,
      firstName,
      lastName,
      phoneNumber,
      isAuthenticated,
    ];
  }

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    bool? isAuthenticated,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
