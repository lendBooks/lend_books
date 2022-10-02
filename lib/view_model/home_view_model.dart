import 'package:flutter/material.dart';
import 'package:lend_books/data/response/api_response.dart';
import 'package:lend_books/repository/home_repo_impl.dart';

import '../model/user.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<UsersMain> userMain = ApiResponse.loading();

  void _setUserMain(ApiResponse<UsersMain> response) {
    print("SK :: $response");
    userMain = response;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    _setUserMain(ApiResponse.loading());
    _myRepo
        .getUsersApi()
        .then((value) => _setUserMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setUserMain(ApiResponse.error(error.toString())));
  }
}
