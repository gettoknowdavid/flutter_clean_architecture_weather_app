// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAppModel _$WeatherAppModelFromJson(Map<String, dynamic> json) {
  return WeatherAppModel(
    coord: json['coord'] == null
        ? null
        : CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    base: json['base'] as String,
    main: json['main'] == null
        ? null
        : MainModel.fromJson(json['main'] as Map<String, dynamic>),
    visibility: json['visibility'] as int,
    wind: json['wind'] == null
        ? null
        : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
    clouds: json['clouds'] == null
        ? null
        : CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    sys: json['sys'] == null
        ? null
        : SysModel.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    id: json['id'] as int,
    name: json['name'] as String,
    cod: json['cod'] as int,
  );
}

Map<String, dynamic> _$WeatherAppModelToJson(WeatherAppModel instance) =>
    <String, dynamic>{
      'coord': instance.coord?.toJson(),
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'base': instance.base,
      'main': instance.main?.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind?.toJson(),
      'clouds': instance.clouds?.toJson(),
      'dt': instance.dt,
      'sys': instance.sys?.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
