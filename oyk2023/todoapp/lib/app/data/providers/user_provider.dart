import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'http://127.0.0.1:8000/';
  }

  Future<User?> getUser(int id) async {
    final response = await get('users/$id');
    return response.body;
  }

  Future<List<User>?> getUsers() async {
    final response = await get('users/');
    if (!response.isOk || response.body == null) {
      print(
          "Failed to obtain data from API. Status code: ${response.statusCode}");
      return null;
    }
    return response.body;
  }

  Future<Response<User>> postUser(User user) async =>
      await post('users/', user);
}
