import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather_app/weather_app.dart';

import '../repositories/weather_app_repository.dart';

class SearchWeather implements UseCase<WeatherApp, Params>{
  final WeatherAppRepository repository;

  SearchWeather(this.repository);

  @override
  Future<Either<Failure, WeatherApp>> call(Params params) async {
    return await repository.searchWeather(params.city);
  }
}

class Params extends Equatable {
  Params({@required this.city});

  final String city;


  @override
  List<Object> get props => [city];
}