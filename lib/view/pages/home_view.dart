import 'package:flutter/material.dart';
import 'package:lend_books/model/user.dart';
import 'package:lend_books/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String _title = "LendBooks";
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home_Page'),
          automaticallyImplyLeading: false,
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, homeViewModel, _) {
              switch (homeViewModel.userMain.status) {
                case Status.loading:
                  print("SK :: LOADING");
                  return LoadingWidget();
                case Status.error:
                  print("SK :: ERROR");
                  return MyErrorWidget(homeViewModel.userMain.message!);
                case Status.completed:
                  print("SK :: COMPLETED");
                  return _getUsersListView(homeViewModel.userMain.data?.users);
                default:
              }
              return Container();
            },
          ),
        ));
  }

  Widget _getUsersListView(List<User>? usersList) {
    return ListView.builder(
        itemCount: usersList?.length,
        itemBuilder: (context, position) {
          return _getMovieListItem(usersList![position]);
        });
  }

  Widget _getMovieListItem(User item) {
    return Card(
      child: ListTile(
        title: Text(item.firstName ?? "NA"),
      ),
    );
  }
}
