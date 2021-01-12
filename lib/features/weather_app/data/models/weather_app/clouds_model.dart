import 'package:flutter/foundation.dart';
import '../../../domain/entities/weather_app/clouds.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CloudsModel extends Clouds {
  CloudsModel({
    @required int all,
  }) : super(all: all);

  static CloudsModel fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CloudsModelToJson(this);
}
