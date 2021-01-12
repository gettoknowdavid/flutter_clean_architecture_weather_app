import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/coord.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coord_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CoordModel extends Coord {
  CoordModel({
    @required double lon,
    @required double lat,
  }) : super(lon: lon, lat: lat);

  static CoordModel fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CoordModelToJson(this);
}
