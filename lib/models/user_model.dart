import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String? id;
  final String email;
  final String userName;
  final String? firstName;
  final String? lastName;
  final String? profilePic;
  final String? phoneNumber;
  final num? totalExpense;
  final List<String>? friends;
  final List<String>? groups;
  final List<String>? transactions;
  final List<String>? fToken;
  final List<String>? token;

  const UserModel({
    this.id,
    required this.email,
    required this.userName,
    this.firstName,
    this.lastName,
    this.profilePic,
    this.phoneNumber,
    this.totalExpense,
    this.friends,
    this.groups,
    this.transactions,
    this.fToken,
    this.token,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? userName,
    String? firstName,
    String? lastName,
    String? profilePic,
    String? phoneNumber,
    num? totalExpense,
    List<String>? friends,
    List<String>? groups,
    List<String>? transactions,
    List<String>? fToken,
    List<String>? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      totalExpense: totalExpense ?? this.totalExpense,
      friends: friends ?? this.friends,
      groups: groups ?? this.groups,
      transactions: transactions ?? this.transactions,
      fToken: fToken ?? this.fToken,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'totalExpense': totalExpense,
      'friends': friends,
      'groups': groups,
      'transactions': transactions,
      'fToken': fToken,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['\$id'] as String,
      email: map['email'] as String,
      userName: map['userName'] as String,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      profilePic:
          map['profilePic'] != null ? map['profilePic'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      totalExpense:
          map['totalExpense'] != null ? map['totalExpense'] as num : null,
      friends: (map['friends'] as List).isNotEmpty
          ? List<String>.from((map['friends'] as List<String>))
          : [],
      groups: (map['groups'] as List).isNotEmpty
          ? List<String>.from((map['groups'] as List<String>))
          : [],
      transactions: (map['transactions'] as List).isNotEmpty
          ? List<String>.from((map['transactions'] as List<String>))
          : [],
      fToken: (map['fToken'] as List).isNotEmpty
          ? List<String>.from((map['fToken'] as List<String>))
          : [],
      token: (map['token'] as List).isNotEmpty
          ? List<String>.from((map['token'] as List<String>))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, userName: $userName, firstName: $firstName, lastName: $lastName, profilePic: $profilePic, phoneNumber: $phoneNumber, totalExpense: $totalExpense, friends: $friends, groups: $groups, transactions: $transactions, fToken: $fToken, token: $token)';
  }
}
