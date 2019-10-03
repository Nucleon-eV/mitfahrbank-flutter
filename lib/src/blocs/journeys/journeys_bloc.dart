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
    }
  }

  Stream<JourneysState> _mapLoadJourneysAsDriverToState() async* {
    try {
      final journeys = await this.mitfahrbankRepository.getJourneysAsDriver();
      yield JourneysAsDriverLoaded(journeys);
    } catch (e) {
      debugPrint(e);
      yield JourneysNotLoaded();
    }
  }

  Stream<JourneysState> _mapLoadJourneysAsPassengerToState() async* {
    try {
      final journeys =
          await this.mitfahrbankRepository.getJourneysAsPassenger();
      yield JourneysAsPassengerLoaded(journeys);
    } catch (e) {
      debugPrint(e);
      yield JourneysNotLoaded();
    }
  }
}
