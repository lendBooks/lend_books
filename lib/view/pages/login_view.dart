import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lend_books/utils/routes/routes_name.dart';
import 'package:lend_books/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../res/components/round_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _radiusController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lend Books'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: 'Email', prefixIcon: Icon(Icons.email)),
          ),
          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                );
              }),
          SizedBox(
            height: height * 0.02,
          ),
          RoundButton(
              title: 'Login',
              onPress: () {
                Map data = {
                  "email": "eve.holt@reqres.in",
                  "password": "cityslicka",
                };
                authViewModel.loginApi(data, context);
                print('Api is hit');
              }),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.signUp);
            },
            child: const Text("Don't have account? Sign Up!"),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                body: Center(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: 'Enter Name'),
                    ),
                    TextFormField(
                      controller: _radiusController,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(hintText: 'Enter Radius'),
                    ),
                  ],
                )),
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: true,
                btnOkOnPress: () {
                  Navigator.pushNamed(context, RoutesName.home);
                },
              ).show();
            },
            child: const Text("Continue as guest"),
          )
        ],
      )),
    );
  }
}
