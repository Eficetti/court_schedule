// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'court.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Court _$CourtFromJson(Map<String, dynamic> json) {
  return _Court.fromJson(json);
}

/// @nodoc
mixin _$Court {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourtCopyWith<Court> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourtCopyWith<$Res> {
  factory $CourtCopyWith(Court value, $Res Function(Court) then) =
      _$CourtCopyWithImpl<$Res, Court>;
  @useResult
  $Res call(
      {String name,
      String address,
      String description,
      String image,
      DateTime createdAt,
      DateTime updatedAt,
      String? id});
}

/// @nodoc
class _$CourtCopyWithImpl<$Res, $Val extends Court>
    implements $CourtCopyWith<$Res> {
  _$CourtCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? description = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourtImplCopyWith<$Res> implements $CourtCopyWith<$Res> {
  factory _$$CourtImplCopyWith(
          _$CourtImpl value, $Res Function(_$CourtImpl) then) =
      __$$CourtImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      String description,
      String image,
      DateTime createdAt,
      DateTime updatedAt,
      String? id});
}

/// @nodoc
class __$$CourtImplCopyWithImpl<$Res>
    extends _$CourtCopyWithImpl<$Res, _$CourtImpl>
    implements _$$CourtImplCopyWith<$Res> {
  __$$CourtImplCopyWithImpl(
      _$CourtImpl _value, $Res Function(_$CourtImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? description = null,
    Object? image = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = freezed,
  }) {
    return _then(_$CourtImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourtImpl extends _Court {
  const _$CourtImpl(
      {required this.name,
      required this.address,
      required this.description,
      required this.image,
      required this.createdAt,
      required this.updatedAt,
      this.id})
      : super._();

  factory _$CourtImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourtImplFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final String description;
  @override
  final String image;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? id;

  @override
  String toString() {
    return 'Court(name: $name, address: $address, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourtImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, address, description, image, createdAt, updatedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourtImplCopyWith<_$CourtImpl> get copyWith =>
      __$$CourtImplCopyWithImpl<_$CourtImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourtImplToJson(
      this,
    );
  }
}

abstract class _Court extends Court {
  const factory _Court(
      {required final String name,
      required final String address,
      required final String description,
      required final String image,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? id}) = _$CourtImpl;
  const _Court._() : super._();

  factory _Court.fromJson(Map<String, dynamic> json) = _$CourtImpl.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  String get description;
  @override
  String get image;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$CourtImplCopyWith<_$CourtImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
