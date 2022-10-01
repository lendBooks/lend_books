import 'package:flutter/material.dart';
import 'package:lend_books/data/response/api_response.dart';
import 'package:lend_books/repository/home_repository.dart';

import '../model/user.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  bool _loading = false;
  bool get loading => _loading;

  late User _user;
  ApiResponse _apiResponse = ApiResponse.loading();

  ApiResponse get response {
    return _apiResponse;
  }

  User get user {
    return _user;
  }

  setLoading(bool value) {
    _loading = false;
    notifyListeners();
  }

  Future<void> fetchUserApi(BuildContext context) async {
    print("I am here");
    try {
      List<User> userList = await _myRepo.getUsersApi();
      _apiResponse = ApiResponse.completed(userList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }

  void setSelectedUser(User user) {
    _user = user;
    notifyListeners();
  }
}
