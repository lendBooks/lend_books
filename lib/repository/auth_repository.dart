import 'package:lend_books/data/network/BaseApiServices.dart';
import 'package:lend_books/data/network/NetworkApiService.dart';
import 'package:lend_books/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.loginEndPoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
