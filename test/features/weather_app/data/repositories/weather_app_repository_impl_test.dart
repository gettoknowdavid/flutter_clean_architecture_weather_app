import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_weather_app/core/utils/constants.dart';
import 'package:flutter_clean_architecture_weather_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_weather_app/core/error/failures.dart';
import 'package:flutter_clean_architecture_weather_app/core/network/network_info.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/datasources/weather_app_local_data_source.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/datasources/weather_app_remote_data_source.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/repositories/weather_app_repository_impl.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements WeatherAppRemoteDataSource {}

class MockLocalDataSource extends Mock implements WeatherAppLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  WeatherAppRepositoryImplementation repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = WeatherAppRepositoryImplementation(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('searchWeatherl', () {
    final tCity = 'Canada';
    final WeatherApp tWeatherApp = tWeatherAppModel;

    test(
      'should check if the device is online',
      () async {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

        await repository.searchWeather(tCity);

        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.searchWeather(any)).thenAnswer(
            (_) async => tWeatherAppModel,
          );

          final result = await repository.searchWeather(tCity);

          verify(mockRemoteDataSource.searchWeather(tCity));

          expect(result, equals(Right(tWeatherApp)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is succesful',
        () async {
          when(mockRemoteDataSource.searchWeather(any)).thenAnswer(
            (_) async => tWeatherAppModel,
          );

          await repository.searchWeather(tCity);

          verify(mockRemoteDataSource.searchWeather(tCity));
          verify(mockLocalDataSource.cacheSearchedWeather(tWeatherAppModel));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccesful',
        () async {
          when(mockRemoteDataSource.searchWeather(any))
              .thenThrow(ServerException());
          final result = await repository.searchWeather(tCity);

          verify(mockRemoteDataSource.searchWeather(tCity));
          verifyZeroInteractions(mockLocalDataSource);

          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          when(mockLocalDataSource.getLastSearchedWeather()).thenAnswer(
            (_) async => tWeatherAppModel,
          );

          final result = await repository.searchWeather(tCity);

          verifyZeroInteractions(mockRemoteDataSource);

          verify(mockLocalDataSource.getLastSearchedWeather());

          expect(result, equals(Right(tWeatherApp)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          when(mockLocalDataSource.getLastSearchedWeather())
            ..thenThrow(CacheException());

          final result = await repository.searchWeather(tCity);

          verifyZeroInteractions(mockRemoteDataSource);

          verify(mockLocalDataSource.getLastSearchedWeather());

          expect(result, equals(Left(CacheFailure())));
        },
      );
    });
  });
}
