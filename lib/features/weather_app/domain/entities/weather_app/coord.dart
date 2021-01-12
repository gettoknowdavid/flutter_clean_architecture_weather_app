import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'coord.g.dart';

@JsonSerializable(explicitToJson: true)
class Coord extends Equatable {
  Coord({
    this.lon,
    this.lat,
  });

  final double lon;
  final double lat;

  @override
  List<Object> get props => [lon, lat];

    static Coord fromJson(Map<String, dynamic> json) =>
      _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);

}
