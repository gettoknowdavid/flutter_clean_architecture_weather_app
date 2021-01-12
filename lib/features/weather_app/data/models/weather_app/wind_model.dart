import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WindModel extends Wind {
  WindModel({
    @required double speed,
    @required int deg,
  }) : super(speed: speed, deg: deg);

  static WindModel fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
