import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable(explicitToJson: true)
class Sys extends Equatable {
  Sys({
    this.country,
    this.sunrise,
    this.sunset,
  });

  final String country;
  final int sunrise;
  final int sunset;

  @override
  List<Object> get props => [country, sunrise, sunset];

    static Sys fromJson(Map<String, dynamic> json) =>
      _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);

}
