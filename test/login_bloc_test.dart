import 'package:mitfahrbank/src/blocs/Authentication.dart';
import 'package:mitfahrbank/src/blocs/Login.dart';
import 'package:mitfahrbank/src/resources/UserRepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('LoginBloc', () {
    LoginBloc loginBloc;
    AuthenticationBloc authenticationBloc;
    MockUserRepository userRepository;

    setUp(() {
      userRepository = MockUserRepository();
      authenticationBloc = AuthenticationBloc(userRepository: userRepository);
      loginBloc = LoginBloc(
          userRepository: userRepository,
          authenticationBloc: authenticationBloc);
    });

    tearDown(() {
      loginBloc?.close();
      authenticationBloc?.close();
    });

    test('initial state is LoginInitial', () {
      expect(loginBloc.state, LoginInitial());
    });

    blocTest(
      'emits LoginLoading when loginBloc LoginButtonPressed',
      build: () => loginBloc,
      // ignore: missing_required_param
      act: (bloc) => bloc.add(LoginButtonPressed()),
      expect: [LoginLoading(), LoginInitial()],
    );

    blocTest(
      'emits LoginLoading when loginBloc LoginButtonPressed and request failed',
      build: () => loginBloc,
      act: (bloc) {
        // ignore: missing_required_param
        when(userRepository.login()).thenThrow(Exception('Failed to login'));

        // ignore: missing_required_param
        return bloc.add(LoginButtonPressed());
      },
      expect: [
        LoginLoading(),
        LoginFailure(error: 'Exception: Failed to login')
      ],
    );
  });
}
