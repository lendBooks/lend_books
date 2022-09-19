import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lend_books/repository/auth_repository.dart';
import 'package:lend_books/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = false;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((value) => {
              print("I am inside login api : ${value}"),
              setLoading(false),
              Navigator.pushNamed(context, RoutesName.home),
              if (kDebugMode) {print(value.toString())}
            })
        .onError((error, stackTrace) => {
              setLoading(false),
              if (kDebugMode) {print(error.toString())}
            });
  }
}
