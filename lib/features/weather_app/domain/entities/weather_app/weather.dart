import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';
@JsonSerializable(explicitToJson: true)
class Weather extends Equatable {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  final int id;
  final String main;
  final String description;
  final String icon;

  @override
  List<Object> get props => [id, main, description, icon];

    static Weather fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

}
