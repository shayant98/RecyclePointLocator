import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    required String id,
    String? name,
    String? email,
    String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class RecyclePoint with _$RecyclePoint {
  factory RecyclePoint({
    required String id,
    required String name,
    required Map<String, dynamic> position,
    required List<String> materials,
    required String adres,
  }) = _RecyclePoint;

  factory RecyclePoint.fromJson(Map<String, dynamic> json) => _$RecyclePointFromJson(json);
}
