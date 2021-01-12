
import 'package:flutter/foundation.dart';
import '../../../../core/error/exceptions.dart';
import 'package:sembast/sembast.dart';

import '../models/weather_app/weather_app_model.dart';

abstract class WeatherAppLocalDataSource {
  /// Gets the cached [WeatherAppModel] which was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<WeatherAppModel> getLastSearchedWeather();

  Future<void> cacheSearchedWeather(WeatherAppModel weatherToCache);
}

class WeatherAppLocalDataSourceImplementation
    implements WeatherAppLocalDataSource {
  Database database;
  StoreRef<int, Map<String, dynamic>> store;

  WeatherAppLocalDataSourceImplementation({
    @required this.database,
    @required this.store,
  });

  @override
  Future<void> cacheSearchedWeather(WeatherAppModel weatherToCache) async {
    await store.add(await database, weatherToCache.toJson());
  }

  @override
  Future<WeatherAppModel> getLastSearchedWeather() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final snapshot = await store.find(await database, finder: finder);

    return snapshot.map((snapshot) {
      final weatherAppModel = WeatherAppModel.fromJson(snapshot.value);
      print(weatherAppModel);
      return weatherAppModel;
    }).last;
  }
}
