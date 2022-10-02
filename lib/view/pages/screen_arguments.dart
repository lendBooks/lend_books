import '../../model/user.dart';

class ScreenArguments {
  final User _user;

  ScreenArguments(this._user);

  User get args => _user;
}
