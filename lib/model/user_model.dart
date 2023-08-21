// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAuthModel {
  String email;
  String? id;
  String? session;
  String? authCode;
  String? error;
  String status;
  String balance;

  UserAuthModel({
    required this.email,
    this.id,
    this.session,
    this.authCode,
    this.error,
    required this.status,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
      'session': session,
      'authCode': authCode,
      'error': error,
      'status': status,
      'balance': balance,
    };
  }

  factory UserAuthModel.fromMap(Map<String, dynamic> map) {
    return UserAuthModel(
      email: map['email'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      session: map['session'] != null ? map['session'] as String : null,
      authCode: map['authCode'] != null ? map['authCode'] as String : null,
      error: map['error'] != null ? map['error'] as String : null,
      status: map['status'] as String,
      balance: map['balance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuthModel.fromJson(String source) =>
      UserAuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserAuthModel copyWith({
    String? email,
    String? id,
    String? session,
    String? authCode,
    String? error,
    String? status,
    String? balance,
  }) {
    return UserAuthModel(
      email: email ?? this.email,
      id: id ?? this.id,
      session: session ?? this.session,
      authCode: authCode ?? this.authCode,
      error: error ?? this.error,
      status: status ?? this.status,
      balance: balance ?? this.balance,
    );
  }
}
