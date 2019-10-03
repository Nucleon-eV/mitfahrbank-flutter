import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'blocs/Authentication.dart';
import 'resources/UserRepository.dart';
import 'ui/Home.dart';
import 'ui/LoadingIndicator.dart';
import 'ui/SplashPage.dart';
import 'ui/login/Login.dart';

class MitfahrbankApp extends StatefulWidget {
  final UserRepository userRepository;

  MitfahrbankApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  MitfahrbankAppState createState() => MitfahrbankAppState();
}

class MitfahrbankAppState extends State<MitfahrbankApp> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("de_DE");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: baseDarkTheme,
      theme: baseLightTheme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return Home();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: widget.userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return LoadingIndicator();
        },
      ),
    );
  }

  ThemeData get baseLightTheme => ThemeData(
    brightness: Brightness.light,
    primarySwatch: MaterialColor(
      4289317175,
      {
        50: Color(0xfff6faeb),
        100: Color(0xffeef4d7),
        200: Color(0xffdce9af),
        300: Color(0xffcbde87),
        400: Color(0xffbad45e),
        500: Color(0xffa9c936),
        600: Color(0xff87a12b),
        700: Color(0xff657821),
        800: Color(0xff435016),
        900: Color(0xff22280b)
      },
    ),
    primaryColor: Color(0xffA9C937),
  );

  ThemeData get baseDarkTheme => ThemeData(
    brightness: Brightness.dark,
    primarySwatch: MaterialColor(
      0xffA9C937,
      {
        50: Color(0xfff6faeb),
        100: Color(0xffeef4d7),
        200: Color(0xffdce9af),
        300: Color(0xffcbde87),
        400: Color(0xffbad45e),
        500: Color(0xffa9c936),
        600: Color(0xff87a12b),
        700: Color(0xff657821),
        800: Color(0xff435016),
        900: Color(0xff22280b)
      },
    ),
    primaryColor: Color(0xffA9C937),
  );
}
