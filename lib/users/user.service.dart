import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:widgetbook_provider_exploration/users/user.model.dart';

class Success {
  int code;
  Object response;

  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;

  Failure({required this.code, required this.errorResponse});
}

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(code: 200, response: userModelsFromJson(response.body));
      }
      throw Exception('Failed to load users');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 100, errorResponse: e.toString());
    }
  }
}
