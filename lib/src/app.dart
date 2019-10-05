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
              builder: (context) {
                return JourneysBloc(
                    mitfahrbankRepository: mitfahrbankRepository)
                  ..dispatch(LoadJourneysAsPassenger());
              },
              child: Home(
                mitfahrbankRepository: mitfahrbankRepository,
              ),
            );
          }
          if (state is AuthenticationUnauthenticated) {
            debugPrint("event: LoggedOut2");
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
