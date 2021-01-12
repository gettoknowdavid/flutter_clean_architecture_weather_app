part of 'weather_app_bloc.dart';

abstract class WeatherAppState extends Equatable {
  const WeatherAppState();

  @override
  List<Object> get props => [];
}

class WeatherNotLoaded extends WeatherAppState {}

class WeatherLoading extends WeatherAppState {}

class WeatherLoaded extends WeatherAppState {
  final WeatherApp weatherApp;

  WeatherLoaded({@required this.weatherApp});

  @override
  List<Object> get props => [weatherApp];
}

class Error extends WeatherAppState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
