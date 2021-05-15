// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call({required String id, String? name, String? email, String? image}) {
    return _User(
      id: id,
      name: name,
      email: email,
      image: image,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call({String id, String? name, String? email, String? image});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String? name, String? email, String? image});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? image = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User({required this.id, this.name, this.email, this.image});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? image;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required String id,
      String? name,
      String? email,
      String? image}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}

RecyclePoint _$RecyclePointFromJson(Map<String, dynamic> json) {
  return _RecyclePoint.fromJson(json);
}

/// @nodoc
class _$RecyclePointTearOff {
  const _$RecyclePointTearOff();

  _RecyclePoint call(
      {required String id,
      required String name,
      required Map<String, dynamic> position}) {
    return _RecyclePoint(
      id: id,
      name: name,
      position: position,
    );
  }

  RecyclePoint fromJson(Map<String, Object> json) {
    return RecyclePoint.fromJson(json);
  }
}

/// @nodoc
const $RecyclePoint = _$RecyclePointTearOff();

/// @nodoc
mixin _$RecyclePoint {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<String, dynamic> get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecyclePointCopyWith<RecyclePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecyclePointCopyWith<$Res> {
  factory $RecyclePointCopyWith(
          RecyclePoint value, $Res Function(RecyclePoint) then) =
      _$RecyclePointCopyWithImpl<$Res>;
  $Res call({String id, String name, Map<String, dynamic> position});
}

/// @nodoc
class _$RecyclePointCopyWithImpl<$Res> implements $RecyclePointCopyWith<$Res> {
  _$RecyclePointCopyWithImpl(this._value, this._then);

  final RecyclePoint _value;
  // ignore: unused_field
  final $Res Function(RecyclePoint) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$RecyclePointCopyWith<$Res>
    implements $RecyclePointCopyWith<$Res> {
  factory _$RecyclePointCopyWith(
          _RecyclePoint value, $Res Function(_RecyclePoint) then) =
      __$RecyclePointCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, Map<String, dynamic> position});
}

/// @nodoc
class __$RecyclePointCopyWithImpl<$Res> extends _$RecyclePointCopyWithImpl<$Res>
    implements _$RecyclePointCopyWith<$Res> {
  __$RecyclePointCopyWithImpl(
      _RecyclePoint _value, $Res Function(_RecyclePoint) _then)
      : super(_value, (v) => _then(v as _RecyclePoint));

  @override
  _RecyclePoint get _value => super._value as _RecyclePoint;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_RecyclePoint(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecyclePoint implements _RecyclePoint {
  _$_RecyclePoint(
      {required this.id, required this.name, required this.position});

  factory _$_RecyclePoint.fromJson(Map<String, dynamic> json) =>
      _$_$_RecyclePointFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Map<String, dynamic> position;

  @override
  String toString() {
    return 'RecyclePoint(id: $id, name: $name, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecyclePoint &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(position);

  @JsonKey(ignore: true)
  @override
  _$RecyclePointCopyWith<_RecyclePoint> get copyWith =>
      __$RecyclePointCopyWithImpl<_RecyclePoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RecyclePointToJson(this);
  }
}

abstract class _RecyclePoint implements RecyclePoint {
  factory _RecyclePoint(
      {required String id,
      required String name,
      required Map<String, dynamic> position}) = _$_RecyclePoint;

  factory _RecyclePoint.fromJson(Map<String, dynamic> json) =
      _$_RecyclePoint.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get position => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecyclePointCopyWith<_RecyclePoint> get copyWith =>
      throw _privateConstructorUsedError;
}
