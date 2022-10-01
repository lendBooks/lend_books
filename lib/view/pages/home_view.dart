import 'package:flutter/material.dart';
import 'package:lend_books/model/user.dart';
import 'package:lend_books/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/response/api_response.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _title = "LendBooks";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home_Page'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text("Inside homescreen"),
        ],
      ),
    );
  }
}
