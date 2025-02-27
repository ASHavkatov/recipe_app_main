import 'package:new_recipe_app/core/client.dart';
import 'package:new_recipe_app/features/singin/data/models/user_model.dart';

import '../../../../core/secure_storage.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;
  String? jwt;

  Future<void> login(String login, String password) async {
    final String token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredetails();
    await SecureStorage.saveCredentails(login: login, password: password);
    await SecureStorage.saveToken(token);
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredetails();
  }

  Future<bool> singUp({
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String phoneNumber,
    required DateTime dateOfBirth,
    required String password,
  }) async {
    final result = await client.singUp(
      UserModel(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        email: email,
        password: password,
        dateOfBirth: dateOfBirth,
        phoneNumber: phoneNumber,
      ),
    );
    return result;
  }

  Future<bool> refreshToken() async {
    var credetails = await SecureStorage.getCredetails();
    if (credetails == null || credetails['login'] == null || credetails['password'] == null) {
      return false;
    }
    jwt = await client.login(credetails['login']!, credetails['password']!);
    await SecureStorage.deleteToken();
    await SecureStorage.saveToken(jwt!);
    return true;
  }
}
