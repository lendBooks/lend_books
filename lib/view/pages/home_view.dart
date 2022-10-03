import 'package:flutter/material.dart';
import 'package:lend_books/model/user.dart';
import 'package:lend_books/utils/routes/routes_name.dart';
import 'package:lend_books/view/pages/screen_arguments.dart';
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
  final String _title = "LendBooks";
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
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              tooltip: 'Filter the below lost',
              onPressed: () {
                // handle the press
                _showBottomSheet();
              },
            )
          ],
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

  Widget _getMovieListItem(User user) {
    return Card(
      child: ListTile(
        title: Text(user.firstName ?? "NA"),
        onTap: () {
          _sendDataToMovieDetailScreen(context, user);
        },
      ),
    );
  }

  void _sendDataToMovieDetailScreen(BuildContext context, User user) {
    Navigator.pushNamed(context, RoutesName.userDetails,
        arguments: ScreenArguments(user));
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20))), // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.3,
          minChildSize: 0.13,
          maxChildSize: 0.7,
          builder: (_, controller) {
            return Container(
              child: ListView.builder(
                controller: controller, // set this too
                itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
              ),
            );
          },
        );
      },
    );
  }
}

/**
 * Container(
              child: Column(children: [
                Text("Hi this is textView"),
              ],)
 */
