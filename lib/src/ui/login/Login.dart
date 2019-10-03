import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Authentication.dart';
import '../../blocs/Login.dart';
import '../../resources/UserRepository.dart';
import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Login",
          style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            //fontWeight: FontWeight.bold,
            //fontSize: 30,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/map-01.png",
            fit: BoxFit.fill,
            height: (MediaQuery
                .of(context)
                .size
                .height / 4) - 20,
            width: MediaQuery
                .of(context)
                .size
                .width,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 130),
              child: Text(
                "Gutes tun",
                style: TextStyle(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.only(top: 185),
              child: BlocProvider(
                builder: (context) {
                  return LoginBloc(
                    authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context),
                    userRepository: userRepository,
                  );
                },
                child: LoginForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
