part of 'weather_app_bloc.dart';

abstract class WeatherAppEvent extends Equatable {
  const WeatherAppEvent();
}


class GetWeatherApp extends WeatherAppEvent {
  final String tCity;

  GetWeatherApp(this.tCity);

  @override
  List<Object> get props => [tCity];
}
