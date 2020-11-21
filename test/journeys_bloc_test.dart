import 'package:mitfahrbank/src/blocs/journeys/journeys_bloc.dart';
import 'package:mitfahrbank/src/blocs/journeys/journeys_event.dart';
import 'package:mitfahrbank/src/blocs/journeys/journeys_state.dart';
import 'package:mitfahrbank/src/models/journey_model.dart';
import 'package:mitfahrbank/src/resources/MitfahrbankRepository.dart';
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
      expect(journeysBloc.state, JourneysLoading());
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
      expect: [JourneysNotLoaded()],
    );

    blocTest(
      'emits JourneysAsPassengerLoaded when LoadJourneysAsPassenger has journeys',
      build: () => journeysBloc,
      act: (bloc) {
        return bloc.add(LoadJourneysAsPassenger());
      },
      // ignore: missing_required_param
      expect: [JourneysAsPassengerLoaded()],
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
      expect: [JourneysNotLoaded()],
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
      expect: [JourneysNotLoaded()],
    );

    blocTest(
      'emits JourneyLoaded when LoadJourney finds journey',
      build: () => journeysBloc,
      act: (bloc) {
        return bloc.add(LoadJourney(0));
      },
      // ignore: missing_required_param
      expect: [JourneyLoaded()],
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
      expect: [JourneysNotLoaded()],
    );
  });
}
