import 'package:flutter/foundation.dart';
import 'package:lend_books/model/user.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkService();
  Future<UsersMain> getUsersApi() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.usersEndPoint);
      final jsonData = UsersMain.fromJson(response);
      return jsonData;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
