// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    name: json['name'] as String?,
    email: json['email'] as String?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
    };

_$_RecyclePoint _$_$_RecyclePointFromJson(Map<String, dynamic> json) {
  return _$_RecyclePoint(
    id: json['id'] as String,
    name: json['name'] as String,
    position: json['position'] as Map<String, dynamic>,
    materials:
        (json['materials'] as List<dynamic>).map((e) => e as String).toList(),
    adres: json['adres'] as String,
  );
}

Map<String, dynamic> _$_$_RecyclePointToJson(_$_RecyclePoint instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'materials': instance.materials,
      'adres': instance.adres,
    };
