import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wind.g.dart';

@JsonSerializable(explicitToJson: true)
class Wind extends Equatable {
  Wind({
    this.speed,
    this.deg,
  });

  final double speed;
  final int deg;

  @override
  List<Object> get props => [speed, deg];

    static Wind fromJson(Map<String, dynamic> json) =>
      _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);

}
