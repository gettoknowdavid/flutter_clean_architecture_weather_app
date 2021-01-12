import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture_weather_app/core/utils/input_checker.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather_app.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/usecases/search_weather.dart';

part 'weather_app_event.dart';
part 'weather_app_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server failure';
const String LOCAL_STORAGE_FAILURE_MESSAGE = 'Cannot load local storage';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The city is invalid';

class WeatherAppBloc extends Bloc<WeatherAppEvent, WeatherAppState> {
  WeatherAppBloc({
    @required this.searchWeather,
    @required this.inputChecker,
  })  : assert(searchWeather != null),
        assert(inputChecker != null),
        super(WeatherNotLoaded());

  final SearchWeather searchWeather;
  final InputChecker inputChecker;

  @override
  Stream<WeatherAppState> mapEventToState(
    WeatherAppEvent event,
  ) async* {
    if (event is GetWeatherApp) {
      final inputEither = inputChecker.checkInput(event.tCity);

      yield* inputEither.fold((l) async* {
        yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
      }, (r) {
        throw UnimplementedError();
      });
    }
  }
}
