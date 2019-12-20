import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../resources/MitfahrbankRepository.dart';
import 'journeys_event.dart';
import 'journeys_state.dart';

class JourneysBloc extends Bloc<JourneysEvent, JourneysState> {
  final MitfahrbankRepository mitfahrbankRepository;

  JourneysBloc({@required this.mitfahrbankRepository});

  @override
  JourneysState get initialState => JourneysLoading();

  @override
  Stream<JourneysState> mapEventToState(JourneysEvent event) async* {
    if (event is LoadJourneysAsDriver) {
      yield* _mapLoadJourneysAsDriverToState();
    } else if (event is LoadJourneysAsPassenger) {
      yield* _mapLoadJourneysAsPassengerToState();
    } else if (event is LoadJourney) {
      yield* _mapLoadJourneyToState(event.id);
    }
  }

  Stream<JourneysState> _mapLoadJourneysAsDriverToState() async* {
    try {
      final journeys = await this.mitfahrbankRepository.getJourneysAsDriver();

      yield JourneysAsDriverLoaded(
        journeys: journeys,
      );
      return;
    } catch (e) {
      debugPrint(e.toString());
      yield JourneysNotLoaded();
      return;
    }
  }

  Stream<JourneysState> _mapLoadJourneysAsPassengerToState() async* {
    try {
      final journeys =
          await this.mitfahrbankRepository.getJourneysAsPassenger();
      final activeJourneys =
      await this.mitfahrbankRepository.getActiveJourneys();

      yield JourneysAsPassengerLoaded(
        journeys: journeys,
        activeJourney: activeJourneys,
      );
    } catch (e) {
      debugPrint(e.toString());
      yield JourneysNotLoaded();
    }
  }

  Stream<JourneysState> _mapLoadJourneyToState(int id) async* {
    try {
      final journey = await this.mitfahrbankRepository.getJourney(id);
      yield JourneyLoaded(journey: journey);
    } catch (e) {
      debugPrint(e.toString());
      yield JourneysNotLoaded();
    }
  }
}
