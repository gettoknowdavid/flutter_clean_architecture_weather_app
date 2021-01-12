import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/weather_app.dart';
import 'clouds_model.dart';
import 'coord_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_app_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherAppModel extends WeatherApp {
  WeatherAppModel({
    @required CoordModel coord,
    @required List<WeatherModel> weather,
    @required String base,
    @required MainModel main,
    @required int visibility,
    @required WindModel wind,
    @required CloudsModel clouds,
    @required int dt,
    @required SysModel sys,
    @required int timezone,
    @required int id,
    @required String name,
    @required int cod,
  }) : super(
          coord: coord,
          weather: weather,
          base: base,
          main: main,
          visibility: visibility,
          wind: wind,
          clouds: clouds,
          dt: dt,
          sys: sys,
          timezone: timezone,
          id: id,
          name: name,
          cod: cod,
        );

  static WeatherAppModel fromJson(Map<String, dynamic> json) =>
      _$WeatherAppModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WeatherAppModelToJson(this);
}
