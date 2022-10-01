import 'package:flutter/foundation.dart';
import 'package:lend_books/model/user.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkService();
  Future<List<User>> getUsersApi() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.usersEndPoint);
      final jsonData = response['users'] as List;
      List<User> userData =
          jsonData.map((tagJson) => User.fromJson(tagJson)).toList();
      print("UserData ${userData}");
      return userData;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
