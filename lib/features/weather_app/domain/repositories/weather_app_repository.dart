import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/weather_app/weather_app.dart';

abstract class WeatherAppRepository {
  Future<Either<Failure, WeatherApp>> searchWeather(String city);
}