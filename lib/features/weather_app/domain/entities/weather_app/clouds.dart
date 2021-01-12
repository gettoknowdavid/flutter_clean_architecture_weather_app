import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds.g.dart';

@JsonSerializable(explicitToJson: true)
class Clouds extends Equatable {
  Clouds({
    this.all,
  });

  final int all;

  @override
  List<Object> get props => [all];

    static Clouds fromJson(Map<String, dynamic> json) =>
      _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);

}
