import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel extends Weather {
  WeatherModel({
    @required int id,
    @required String main,
    @required String description,
    @required String icon,
  }) : super(id: id, main: main, description: description, icon: icon);

  static WeatherModel fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
