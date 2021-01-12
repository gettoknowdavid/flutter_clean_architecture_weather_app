import 'dart:convert';

import 'package:flutter_clean_architecture_weather_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/datasources/weather_app_client.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/datasources/weather_app_remote_data_source.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/models/weather_app/weather_app_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements WeatherAppClient {}

void main() {
  WeatherAppRemoteDataSourceImplementation dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = WeatherAppRemoteDataSourceImplementation(
      client: mockHttpClient,
    );
  });

  void setUpMockHttpClientSuccess() {
    // when(mockHttpClient.get(any)).thenAnswer(
    //     (_) async => http.Response(fixture('weather_app.json'), 200));

    when(mockHttpClient.searchWeather(any, any)).thenAnswer(
      (_) async => WeatherAppModel.fromJson(
        json.decode(fixture('weather_app.json')),
      ),
    );
  }

  void setUpMockHttpClientFailure() {
    // when(mockHttpClient.get(any))
    //     .thenAnswer((_) async => http.Response('Something went wrong', 404));

    when(mockHttpClient.searchWeather(any, any)).thenAnswer(
      (_) async => null,
    );
  }

  group('getWeatherAppFromApi', () {
    final tCity = 'Canada';
    final tAppId = '409242565b6d2d46b0ae7bbe8c06ac25';

    final tWeatherAppModel = WeatherAppModel.fromJson(
      json.decode(fixture('weather_app.json')),
    );
    test(
      '''should perform a get request on a url, 
      with city being the city variable''',
      () async {
        setUpMockHttpClientSuccess();

        await dataSource.searchWeather(tCity);

        // verify(mockHttpClient.get(
        //   '$baseUrl/data/2.5/weather?q=$tCity&appid=$tAppId',
        // ));

        verify(mockHttpClient.searchWeather(tCity, tAppId));
      },
    );

    test(
      'should return WeatherAppModel when the Response code is successful',
      () async {
        setUpMockHttpClientSuccess();

        final result = await dataSource.searchWeather(tCity);

        expect(result, equals(tWeatherAppModel));
      },
    );

    test(
      'should throw ServerException when the Response is not succesful',
      () async {
        setUpMockHttpClientFailure();

        final call = await dataSource.searchWeather;

        expect(() => call(tCity), throwsA(isA<ServerException>()));
      },
    );
  });
}
