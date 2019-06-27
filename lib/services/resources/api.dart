import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_retry/http_retry.dart';

import '../../models/user.dart';
import '../../models/user_data.dart';
import '../../models/users_list.dart';

class Api {

  var client = RetryClient(Client(), retries: 3, when: (BaseResponse response) {
    return response.statusCode == 408;
  });

  final _baseUrl = "https://reqres.in/api/users";

  Future<UsersList> getAvailableUsers(int pageNumber) async {

    final response = await client.get("$_baseUrl/?page=$pageNumber");
    if (response.statusCode == 200) {
      return UsersList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load users list');
    }

  }


  Future<UserData> getUserDetailsInfo(int userId) async {
    final response = await client.get("$_baseUrl/$userId");
    if (response.statusCode == 200) {
      return UserData.fromJson(json.decode(response.body));

    } else {
      throw Exception('Failed to load user data');
    }
  }

}