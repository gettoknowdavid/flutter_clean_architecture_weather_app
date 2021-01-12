import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/sys.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sys_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SysModel extends Sys {
  SysModel({
    @required String country,
    @required int sunrise,
    @required int sunset,
  }):super(country: country, sunrise: sunrise, sunset: sunset);

  static SysModel fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SysModelToJson(this);
}
