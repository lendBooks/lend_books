import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details Page"),
      ),
      body: Center(
        child: Text(user.firstName!),
      ),
    );
  }
}
