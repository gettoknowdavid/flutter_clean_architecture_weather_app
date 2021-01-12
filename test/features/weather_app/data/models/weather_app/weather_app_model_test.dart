import 'dart:convert';

import 'package:flutter_clean_architecture_weather_app/core/utils/constants.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/models/weather_app/weather_app_model.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather_app.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../fixtures/fixture_reader.dart';

void main() {
  test('should be a subclass of WeatherApp entity', () async {
    expect(tWeatherAppModel, isA<WeatherApp>());
  });

  group('fromJson', () {
    test('should return valid model when the JSON string is given', () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('weather_app.json'));

      final result = WeatherAppModel.fromJson(jsonMap);

      expect(result, tWeatherAppModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing proper data',
      () async {
        final result = tWeatherAppModel.toJson();

        expect(result, expectedMap);
      },
    );
  });
}
