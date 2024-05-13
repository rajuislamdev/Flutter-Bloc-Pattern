// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc_practice/config/app_constants.dart';
import 'package:bloc_practice/models/user_model.dart';
import 'package:bloc_practice/utils/api_client.dart';
import 'package:http/http.dart';

class UserRepository {
  static Future<List<User>> fetchUsers() async {
    Response response = await ApiClient.get(apiUrl: AppConstants.users);
    List<dynamic> data = await jsonDecode(response.body);
    List<User> usersList = data.map((user) => User.fromMap(user)).toList();
    return usersList;
  }
}
