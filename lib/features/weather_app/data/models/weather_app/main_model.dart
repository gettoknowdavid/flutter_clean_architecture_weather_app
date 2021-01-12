import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/main.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MainModel extends Main {
  MainModel({
    @required double temp,
    @required double feelsLike,
    @required double tempMin,
    @required double tempMax,
    @required int pressure,
    @required int humidity,
    @required int seaLevel,
    @required int grndLevel,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          pressure: pressure,
          humidity: humidity,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
        );

  static MainModel fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
