import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/clouds.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/coord.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/main.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/sys.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/weather_app.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/entities/weather_app/wind.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/repositories/weather_app_repository.dart';
import 'package:flutter_clean_architecture_weather_app/features/weather_app/domain/usecases/search_weather.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockWeatherAppRepository extends Mock implements WeatherAppRepository {}

void main() {
  SearchWeather useCase;
  MockWeatherAppRepository mockWeatherAppRepository;

  setUp(() {
    mockWeatherAppRepository = MockWeatherAppRepository();
    useCase = SearchWeather(mockWeatherAppRepository);
  });

  final tCity = 'Canada';
  final tWeatherApp = WeatherApp(
    base: 'base',
    clouds: Clouds(all: 1),
    cod: 1,
    coord: Coord(lat: 23.1, lon: 40.2),
    dt: 1,
    id: 1,
    main: Main(
      feelsLike: 20.1,
      grndLevel: 1,
      humidity: 1,
      pressure: 1,
      seaLevel: 1,
      temp: 29.1,
      tempMax: 31.1,
      tempMin: 20.1,
    ),
    name: 'name',
    sys: Sys(country: 'country', sunrise: 2, sunset: 2),
    timezone: 1,
    visibility: 1,
    weather: [
      Weather(description: 'description', icon: 'icon', id: 1, main: 'main')
    ],
    wind: Wind(deg: 1, speed: 20.1),
  );
  test('should get weather for the city from the repository', () async {
    when(mockWeatherAppRepository.searchWeather(any))
        .thenAnswer((_) async => Right(tWeatherApp));

    final result = await useCase(Params(city: tCity));

    expect(result, Right(tWeatherApp));

    verify(mockWeatherAppRepository.searchWeather(tCity));

    verifyNoMoreInteractions(mockWeatherAppRepository);
  });
}
