import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mitfahrbank/src/models/journey_model.dart';
import 'package:tuple/tuple.dart';

import '../../../resources/MitfahrbankRepository.dart';
import '../../../resources/http/MitfahrbankAPI/MitfahrbankClient.dart';
import 'start_journey_event.dart';
import 'start_journey_state.dart';

class StartJourneyBloc extends Bloc<StartJourneyEvent, StartJourneyState> {
  final MitfahrbankRepository mitfahrbankRepository;

  StartJourneyBloc({this.mitfahrbankRepository});

  @override
  StartJourneyState get initialState => MitfahrbaenkeLoading();

  @override
  Stream<StartJourneyState> mapEventToState(event) async* {
    if (event is GotLocation) {
      yield MitfahrbaenkeLoading();
      Tuple2<Map<int, String>, Map<String, DropdownMenuItem<String>>>
          startbaenkeRaw;
      Map<String, DropdownMenuItem<String>> startbaenke;
      try {
        startbaenkeRaw = await mitfahrbankRepository.findStartByCoordinates(
            event.lat, event.lon);
      } on HTTPException catch (e) {
        yield HTTPError(errorMessage: e.cause);
        return;
      }
      startbaenke = startbaenkeRaw.item2;
      Map<int, Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>>
          destinationsByStart =
          Map<int, Tuple2<Map<int, String>, List<DropdownMenuItem<String>>>>();

      for (String k in startbaenke.keys) {
        Tuple2<Map<int, String>, List<DropdownMenuItem<String>>> destionations;
        try {
          destionations =
              await mitfahrbankRepository.findDestinationsByStart(k);
        } on HTTPException catch (e) {
          yield HTTPError(errorMessage: e.cause);
          continue;
        }
        destinationsByStart[int.parse(k)] = destionations;
      }
      yield MitfahrbaenkeLoaded(
        startMitfahrbaenke: startbaenke.values.toList(),
        destinationMitfahrbaenke: destinationsByStart,
        nameList: startbaenkeRaw.item1,
      );
      return;
    }

    if (event is StartButtonPressed) {
      yield MitfahrbaenkeLoading();
      JourneyStartPOST payload = JourneyStartPOST(
        event.destinationID,
        event.startID,
        event.comment,
      );
      await mitfahrbankRepository.startJourney(payload);
      yield JourneyStarted();
      return;
    }
    yield MitfahrbaenkeLoading();
  }
}
