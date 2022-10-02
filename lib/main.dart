import 'package:flutter/material.dart';
import 'package:lend_books/utils/routes/routes.dart';
import 'package:lend_books/utils/routes/routes_name.dart';
import 'package:lend_books/view_model/auth_view_model.dart';
import 'package:lend_books/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => HomeViewModel())
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: RoutesName.login,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
