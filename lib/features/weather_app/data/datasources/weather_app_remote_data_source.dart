
import 'package:flutter/foundation.dart';
import '../../../../core/error/exceptions.dart';
import 'weather_app_client.dart';

import '../models/weather_app/weather_app_model.dart';

abstract class WeatherAppRemoteDataSource {
  /// Calls the http://api.openweathermap.org endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<WeatherAppModel> searchWeather(String city);
}

class WeatherAppRemoteDataSourceImplementation
    implements WeatherAppRemoteDataSource {
  WeatherAppRemoteDataSourceImplementation({@required this.client});

  WeatherAppClient client;

  final baseUrl = 'http://http://api.openweathermap.org';
  final tCity = 'Canada';
  final tAppId = '409242565b6d2d46b0ae7bbe8c06ac25';

  @override
  // ignore: missing_return
  Future<WeatherAppModel> searchWeather(String city) async {
    final response = await client.searchWeather(city, tAppId);
    if (response != null) {
      return response;
    } else {
      throw ServerException();
    }
  }
  // Future<WeatherAppModel> searchWeather(String city) async {
  //   final response =
  //       await client.get('$baseUrl/data/2.5/weather?q=$tCity&appid=$tAppId');
  //   if (response.statusCode == 200) {
  //     return WeatherAppModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }

}
