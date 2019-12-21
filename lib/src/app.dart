import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/Authentication.dart';
import 'blocs/journeys/journeys_bloc.dart';
import 'blocs/journeys/journeys_event.dart';
import 'resources/MitfahrbankRepository.dart';
import 'resources/UserRepository.dart';
import 'resources/http/MitfahrbankAPI/MitfahrbankClient.dart';
import 'ui/Home.dart';
import 'ui/LoadingIndicator.dart';
import 'ui/SplashPage.dart';
import 'ui/login/Login.dart';

class MitfahrbankApp extends StatelessWidget {
  final UserRepository userRepository;

  MitfahrbankApp({Key key, @required this.userRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MitfahrbankRepository mitfahrbankRepository =
    MitfahrbankRepository(MitfahrbankClient(userRepository));

    return MaterialApp(
      title: 'Mitfahrbank',
      darkTheme: baseDarkTheme,
      theme: baseLightTheme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return BlocProvider<JourneysBloc>(
              create: (context) {
                return JourneysBloc(
                    mitfahrbankRepository: mitfahrbankRepository)
                  ..add(LoadJourneysAsPassenger());
              },
              child: Home(
                mitfahrbankRepository: mitfahrbankRepository,
              ),
            );
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }

  ThemeData get baseLightTheme => ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Color(0xffA9C937),
      brightness: Brightness.light,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
    cursorColor: Color(0xffA9C937),
    hintColor: Color(0xffA9C937),
    primaryIconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    iconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xffA9C937),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffA9C937),
        ),
      ),
    ),
    accentColor: Color(0xffA9C937),
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
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.grey),
      color: Color(0xffA9C937),
      textTheme: TextTheme(
        title: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      brightness: Brightness.dark,
    ),
    cursorColor: Color(0xffA9C937),
    hintColor: Color(0xffA9C937),
    primaryIconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    iconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xffA9C937),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xffA9C937),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffA9C937),
        ),
      ),
    ),
    accentColor: Color(0xffA9C937),
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
