import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _title = "LendBooks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home_Page'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Text('Home Page with list'),
      ),
    );
  }
}
