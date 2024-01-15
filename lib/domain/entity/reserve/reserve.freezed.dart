// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reserve.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reserve _$ReserveFromJson(Map<String, dynamic> json) {
  return _Reserve.fromJson(json);
}

/// @nodoc
mixin _$Reserve {
  DateTime get date => throw _privateConstructorUsedError;
  double get rainChance => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get userReserve => throw _privateConstructorUsedError;
  Court get reservedCourt => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReserveCopyWith<Reserve> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReserveCopyWith<$Res> {
  factory $ReserveCopyWith(Reserve value, $Res Function(Reserve) then) =
      _$ReserveCopyWithImpl<$Res, Reserve>;
  @useResult
  $Res call(
      {DateTime date,
      double rainChance,
      DateTime createdAt,
      DateTime updatedAt,
      String userReserve,
      Court reservedCourt,
      String? id});

  $CourtCopyWith<$Res> get reservedCourt;
}

/// @nodoc
class _$ReserveCopyWithImpl<$Res, $Val extends Reserve>
    implements $ReserveCopyWith<$Res> {
  _$ReserveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rainChance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userReserve = null,
    Object? reservedCourt = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rainChance: null == rainChance
          ? _value.rainChance
          : rainChance // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userReserve: null == userReserve
          ? _value.userReserve
          : userReserve // ignore: cast_nullable_to_non_nullable
              as String,
      reservedCourt: null == reservedCourt
          ? _value.reservedCourt
          : reservedCourt // ignore: cast_nullable_to_non_nullable
              as Court,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourtCopyWith<$Res> get reservedCourt {
    return $CourtCopyWith<$Res>(_value.reservedCourt, (value) {
      return _then(_value.copyWith(reservedCourt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReserveImplCopyWith<$Res> implements $ReserveCopyWith<$Res> {
  factory _$$ReserveImplCopyWith(
          _$ReserveImpl value, $Res Function(_$ReserveImpl) then) =
      __$$ReserveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double rainChance,
      DateTime createdAt,
      DateTime updatedAt,
      String userReserve,
      Court reservedCourt,
      String? id});

  @override
  $CourtCopyWith<$Res> get reservedCourt;
}

/// @nodoc
class __$$ReserveImplCopyWithImpl<$Res>
    extends _$ReserveCopyWithImpl<$Res, _$ReserveImpl>
    implements _$$ReserveImplCopyWith<$Res> {
  __$$ReserveImplCopyWithImpl(
      _$ReserveImpl _value, $Res Function(_$ReserveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? rainChance = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userReserve = null,
    Object? reservedCourt = null,
    Object? id = freezed,
  }) {
    return _then(_$ReserveImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rainChance: null == rainChance
          ? _value.rainChance
          : rainChance // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userReserve: null == userReserve
          ? _value.userReserve
          : userReserve // ignore: cast_nullable_to_non_nullable
              as String,
      reservedCourt: null == reservedCourt
          ? _value.reservedCourt
          : reservedCourt // ignore: cast_nullable_to_non_nullable
              as Court,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReserveImpl extends _Reserve {
  const _$ReserveImpl(
      {required this.date,
      required this.rainChance,
      required this.createdAt,
      required this.updatedAt,
      required this.userReserve,
      required this.reservedCourt,
      this.id})
      : super._();

  factory _$ReserveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReserveImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double rainChance;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String userReserve;
  @override
  final Court reservedCourt;
  @override
  final String? id;

  @override
  String toString() {
    return 'Reserve(date: $date, rainChance: $rainChance, createdAt: $createdAt, updatedAt: $updatedAt, userReserve: $userReserve, reservedCourt: $reservedCourt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReserveImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rainChance, rainChance) ||
                other.rainChance == rainChance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userReserve, userReserve) ||
                other.userReserve == userReserve) &&
            (identical(other.reservedCourt, reservedCourt) ||
                other.reservedCourt == reservedCourt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, rainChance, createdAt,
      updatedAt, userReserve, reservedCourt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReserveImplCopyWith<_$ReserveImpl> get copyWith =>
      __$$ReserveImplCopyWithImpl<_$ReserveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReserveImplToJson(
      this,
    );
  }
}

abstract class _Reserve extends Reserve {
  const factory _Reserve(
      {required final DateTime date,
      required final double rainChance,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String userReserve,
      required final Court reservedCourt,
      final String? id}) = _$ReserveImpl;
  const _Reserve._() : super._();

  factory _Reserve.fromJson(Map<String, dynamic> json) = _$ReserveImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get rainChance;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get userReserve;
  @override
  Court get reservedCourt;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ReserveImplCopyWith<_$ReserveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
