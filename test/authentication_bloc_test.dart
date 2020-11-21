import 'package:mitfahrbank/src/blocs/Authentication.dart';
import 'package:mitfahrbank/src/resources/UserRepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('AuthenticationBloc', () {
    AuthenticationBloc authenticationBloc;
    MockUserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
      authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    });

    tearDown(() {
      authenticationBloc?.close();
    });

    test('initial state is AuthenticationUninitialized', () {
      expect(authenticationBloc.state, AuthenticationUninitialized());
    });

    blocTest(
      'emits AuthenticationAuthenticated when AppStarted and has token',
      build: () => authenticationBloc,
      act: (bloc) {
        when(userRepository.hasToken()).thenAnswer((_) async => true);

        return bloc.add(AppStarted());
      },
      expect: [AuthenticationAuthenticated()],
    );

    blocTest(
      'emits AuthenticationUnauthenticated when AppStarted and doesn\'t have token',
      build: () => authenticationBloc,
      act: (bloc) {
        when(userRepository.hasToken()).thenAnswer((_) async => false);

        return bloc.add(AppStarted());
      },
      expect: [AuthenticationUnauthenticated()],
    );

    blocTest(
      'emits AuthenticationAuthenticated when LoggedIn',
      build: () => authenticationBloc,
      act: (bloc) {
        // ignore: missing_required_param
        return bloc.add(LoggedIn());
      },
      expect: [
        AuthenticationLoading(),
        AuthenticationAuthenticated()
      ],
    );

    blocTest(
      'emits AuthenticationUnauthenticated when LoggedOut',
      build: () => authenticationBloc,
      act: (bloc) {
        // ignore: missing_required_param
        return bloc.add(LoggedOut());
      },
      expect: [
        AuthenticationLoading(),
        AuthenticationUnauthenticated()
      ],
    );
  });
}
