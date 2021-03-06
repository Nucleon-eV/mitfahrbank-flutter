import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Login.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  @override
  void dispose() {
    _loginBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      _loginBloc.add(LoginButtonPressed(
        email: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        cubit: _loginBloc,
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          return Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-Mail Adresse',
                  ),
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Passwort',
                  ),
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    textColor: Colors.white,
                    onPressed:
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                    child: Text('Einsteigen'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: state is LoginLoading
                      ? LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme
                            .of(context)
                            .primaryColor),
                  )
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
