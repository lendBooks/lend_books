import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Home"),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: Icon(Icons.my_library_books)),
              Container(child: Icon(Icons.search)),
              Container(child: Icon(Icons.recommend)),
              Container(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}

  Widget menu() {
    return Container(
      color: Colors.blueGrey,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.white70,
        tabs: [
          Tab(
            text: "My Library",
            icon: Icon(Icons.my_library_books),
          ),
          Tab(
            text: "Search Books",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Recommendation",
            icon: Icon(Icons.recommend),
          ),
          Tab(
            text: "Options",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
