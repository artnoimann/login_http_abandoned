import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:unforgett/model/user_model.dart';

Future<UserAuthModel> sendEmailAuth(String email, String? auth_code) async {
  final response = await http.post(
    Uri.parse(' '),
    body: {'email': email, 'auth_code': auth_code},
    headers: {'customheader1': 'valueheader1'},
  );

  if (response.statusCode == 200) {
    final responseJson = UserAuthModel.fromJson(response.body);

    return responseJson;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
