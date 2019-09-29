import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Authentication.dart';
import '../../blocs/Login.dart';
import '../../resources/UserRepository.dart';
import '../helper/BodyScaffold.dart';
import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyScaffold(
        title: "Login",
        child: BlocProvider(
          builder: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}
