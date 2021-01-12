import 'package:flutter/material.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../datasources/weather_app_local_data_source.dart';
import '../datasources/weather_app_remote_data_source.dart';
import '../../domain/entities/weather_app/weather_app.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/weather_app_repository.dart';

class WeatherAppRepositoryImplementation implements WeatherAppRepository {
  final WeatherAppRemoteDataSource remoteDataSource;
  final WeatherAppLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherAppRepositoryImplementation({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherApp>> searchWeather(String city) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeatherApp = await remoteDataSource.searchWeather(city);

        await localDataSource.cacheSearchedWeather(remoteWeatherApp);
        return Right(remoteWeatherApp);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getLastSearchedWeather();
        return Right(localWeather);
      } on CacheException {
        return Left(CacheFailure()); 
      }
    }
  }
}
