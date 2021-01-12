import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_weather_app/core/utils/input_checker.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/usecases/search_weather.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/presentation/bloc/weather_app_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSearchWeather extends Mock implements SearchWeather {}

class MockInputChecker extends Mock implements InputChecker {}

void main() {
  WeatherAppBloc bloc;
  MockInputChecker mockInputChecker;
  MockSearchWeather mockSearchWeather;

  setUp(() {
    mockInputChecker = MockInputChecker();
    mockSearchWeather = MockSearchWeather();
    bloc = WeatherAppBloc(
      searchWeather: mockSearchWeather,
      inputChecker: mockInputChecker,
    );
  });

  test(
    'initialState should be WeatherNotLoaded',
    () {
      expect(bloc.state, equals(WeatherNotLoaded()));
    },
  );

  group(
    'GetWeatherApp',
    () {
      final tCity = 'Canada';

      test(
        'should call InputChecker to validate string',
        () async {
          when(mockInputChecker.checkInput(any)).thenReturn(Right(tCity));

          bloc.add(GetWeatherApp(tCity));

          await untilCalled(mockInputChecker.checkInput(any));

          verify(mockInputChecker.checkInput(tCity));
        },
      );

      test(
        'should emit [Error] when input is invalid',
        () async {
          when(mockInputChecker.checkInput(tCity))
              .thenReturn(Left(InvalidInputFailure()));

          final expectedList = [
            WeatherNotLoaded(),
            Error(message: INVALID_INPUT_FAILURE_MESSAGE),
          ];

          await expectLater(bloc.state, emitsInOrder(expectedList));

          bloc.add(GetWeatherApp(tCity));
        },
      );
    },
  );
}
