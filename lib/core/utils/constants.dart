import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/clouds.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/coord.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/main.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/sys.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather_app.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/wind.dart';

import '../../features/weather_app/data/models/weather_app/clouds_model.dart';
import '../../features/weather_app/data/models/weather_app/coord_model.dart';
import '../../features/weather_app/data/models/weather_app/main_model.dart';
import '../../features/weather_app/data/models/weather_app/sys_model.dart';
import '../../features/weather_app/data/models/weather_app/weather_app_model.dart';
import '../../features/weather_app/data/models/weather_app/weather_model.dart';
import '../../features/weather_app/data/models/weather_app/wind_model.dart';

final tWeatherAppModel = WeatherAppModel(
  coord: CoordModel(
    lon: 1.1,
    lat: 1.1,
  ),
  weather: [
    WeatherModel(
      id: 1,
      main: 'Test main',
      description: 'Test description',
      icon: 'Test icon',
    )
  ],
  base: 'Test base',
  main: MainModel(
    temp: 1.1,
    feelsLike: 1.1,
    tempMin: 1.1,
    tempMax: 1.1,
    pressure: 1,
    humidity: 1,
    seaLevel: 1,
    grndLevel: 1,
  ),
  visibility: 1,
  wind: WindModel(
    speed: 1.1,
    deg: 1,
  ),
  clouds: CloudsModel(all: 1),
  dt: 1,
  sys: SysModel(
    country: 'Test country',
    sunrise: 1,
    sunset: 1,
  ),
  timezone: 1,
  id: 1,
  name: 'Test name',
  cod: 1,
);


final tWeatherApp = WeatherApp(
  coord: Coord(
    lon: 1.1,
    lat: 1.1,
  ),
  weather: [
    Weather(
      id: 1,
      main: 'Test main',
      description: 'Test description',
      icon: 'Test icon',
    )
  ],
  base: 'Test base',
  main: Main(
    temp: 1.1,
    feelsLike: 1.1,
    tempMin: 1.1,
    tempMax: 1.1,
    pressure: 1,
    humidity: 1,
    seaLevel: 1,
    grndLevel: 1,
  ),
  visibility: 1,
  wind: Wind(
    speed: 1.1,
    deg: 1,
  ),
  clouds: Clouds(all: 1),
  dt: 1,
  sys: Sys(
    country: 'Test country',
    sunrise: 1,
    sunset: 1,
  ),
  timezone: 1,
  id: 1,
  name: 'Test name',
  cod: 1,
);
