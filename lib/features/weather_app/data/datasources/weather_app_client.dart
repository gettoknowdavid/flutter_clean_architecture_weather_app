
import 'package:dio/dio.dart';
import '../models/weather_app/weather_app_model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_app_client.g.dart';

@RestApi(baseUrl: 'http://api.openweathermap.org')
abstract class WeatherAppClient {
  factory WeatherAppClient(Dio dio, {String baseUrl}) = _WeatherAppClient;

  @GET('/data/2.5/weather?')
  Future<WeatherAppModel> searchWeather(
    @Query('q') String q,
    @Query('appid') String appid,
  );
}