import 'dart:convert';
import 'dart:async';

import 'package:flutter_clean_architecture_weather_app/core/utils/constants.dart';
import 'package:flutter_clean_architecture_weather_app/core/database/weather_app_database.dart';
import 'package:flutter_clean_architecture_weather_app/core/error/exceptions.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/data/datasources/weather_app_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/src/api/finder.dart' as finder;
import 'package:matcher/matcher.dart' as matcher;

class MockDatabase extends Mock implements Future<Database> {
  final Database db = GetIt.I.get();
  final StoreRef store = intMapStoreFactory.store('__weather_app__');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WeatherAppDatabase.initialize();
  WeatherAppLocalDataSourceImplementation dataSource;
  MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource = WeatherAppLocalDataSourceImplementation(
      database: mockDatabase.db,
      store: mockDatabase.store,
    );
  });
  group('getLastWeatherApp', () {
    test(
      'should return WeatherApp from SembastDatabase when there is one in the database',
      () async {
        final _finder =
            await finder.Finder(sortOrders: [SortOrder('key', false)]);

        final snapshot =
            await mockDatabase.store.find(mockDatabase.db, finder: _finder);

        when(mockDatabase.store.find(mockDatabase.db, finder: _finder))
            .thenReturn(snapshot.map((e) => e.value).last);

        final result = await dataSource.getLastSearchedWeather();

        verify(mockDatabase.store.find(mockDatabase.db, finder: any));

        expect(result, matcher.equals(tWeatherAppModel));
      },
    );

    test(
      'should throw CacheException when there is no data in the store',
      () async {
        when(mockDatabase.store.find(mockDatabase.db)).thenReturn(null);

        final call = await dataSource.getLastSearchedWeather;

        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheWeatherApp', () {
    test(
      'should call SembastDatabase to store the data',
      () async {
        await dataSource.cacheSearchedWeather(tWeatherAppModel);

        final expectedJsonString = json.encode(tWeatherAppModel.toJson());

        verify(mockDatabase.store.add(mockDatabase.db, expectedJsonString));
      },
    );
  });
}
