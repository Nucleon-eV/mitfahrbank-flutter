import 'package:Mitfahrbank/src/blocs/journeys/journeys_bloc.dart';
import 'package:Mitfahrbank/src/blocs/journeys/journeys_event.dart';
import 'package:Mitfahrbank/src/blocs/journeys/journeys_state.dart';
import 'package:Mitfahrbank/src/models/journey_model.dart';
import 'package:Mitfahrbank/src/resources/MitfahrbankRepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMitfahrbankRepository extends Mock implements MitfahrbankRepository {}

void main() {
  group('JourneysBloc', () {
    JourneysBloc journeysBloc;
    MockMitfahrbankRepository mitfahrbankRepository;

    setUp(() {
      mitfahrbankRepository = MockMitfahrbankRepository();
      journeysBloc = JourneysBloc(mitfahrbankRepository: mitfahrbankRepository);
    });

    tearDown(() {
      journeysBloc?.close();
    });

    test('initial state is JourneysLoading', () {
      expect(journeysBloc.initialState, JourneysLoading());
    });

    blocTest(
      'emits JourneysAsDriverLoaded when LoadJourneysAsDriver has journeys',
      build: () => journeysBloc,
      act: (bloc) {
        when(mitfahrbankRepository.getJourneysAsDriver())
            .thenAnswer((_) async => []);
        return bloc.add(LoadJourneysAsDriver());
      },
      expect: [
        JourneysLoading(),
        JourneysAsDriverLoaded(journeys: <Journey>[])
      ],
    );

    blocTest(
      'emits JourneysNotLoaded when LoadJourneysAsDriver fails to load journeys',
      build: () => journeysBloc,
      act: (bloc) {
        when(mitfahrbankRepository.getJourneysAsDriver())
            .thenThrow(Exception("Unable to get Journeys"));
        return bloc.add(LoadJourneysAsDriver());
      },
      expect: [JourneysLoading(), JourneysNotLoaded()],
    );

    blocTest(
      'emits JourneysAsPassengerLoaded when LoadJourneysAsPassenger has journeys',
      build: () => journeysBloc,
      act: (bloc) {
        return bloc.add(LoadJourneysAsPassenger());
      },
      // ignore: missing_required_param
      expect: [JourneysLoading(), JourneysAsPassengerLoaded()],
    );

    blocTest(
      'emits JourneysNotLoaded when LoadJourneysAsPassenger failes to load journeys',
      build: () => journeysBloc,
      act: (bloc) {
        when(mitfahrbankRepository.getJourneysAsPassenger())
            .thenThrow(Exception("Unable to get Journeys"));
        return bloc.add(LoadJourneysAsPassenger());
      },
      // ignore: missing_required_param
      expect: [JourneysLoading(), JourneysNotLoaded()],
    );

    blocTest(
      'emits JourneysNotLoaded when LoadJourneysAsPassenger failes to load active journeys',
      build: () => journeysBloc,
      act: (bloc) {
        when(mitfahrbankRepository.getActiveJourneys())
            .thenThrow(Exception("Unable to get Journeys"));
        return bloc.add(LoadJourneysAsPassenger());
      },
      // ignore: missing_required_param
      expect: [JourneysLoading(), JourneysNotLoaded()],
    );

    blocTest(
      'emits JourneyLoaded when LoadJourney finds journey',
      build: () => journeysBloc,
      act: (bloc) {
        return bloc.add(LoadJourney(0));
      },
      // ignore: missing_required_param
      expect: [JourneysLoading(), JourneyLoaded()],
    );

    blocTest(
      'emits JourneyLoaded when LoadJourney deosn\'t find journey',
      build: () => journeysBloc,
      act: (bloc) {
        when(mitfahrbankRepository.getJourney(0))
            .thenThrow(Exception("Unable to get Journey"));
        return bloc.add(LoadJourney(0));
      },
      // ignore: missing_required_param
      expect: [JourneysLoading(), JourneysNotLoaded()],
    );
  });
}
