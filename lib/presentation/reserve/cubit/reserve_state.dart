import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:welltested_annotation/welltested_annotation.dart';

/// The status of the Product related API calls.
enum ReserveStatus {
  /// The first state when its instanced.
  initial,

  /// The state is trying to make the API call.
  attempting,

  /// The API return a 200 (ok).
  success,

  /// The API return a unsuccessfully response code.
  failure,

  successWeather;

  bool get isInitial => this == ReserveStatus.initial;
  bool get isAttempting => this == ReserveStatus.attempting;
  bool get isSuccess => this == ReserveStatus.success;
  bool get isFailure => this == ReserveStatus.failure;
  bool get isSuccessWeather => this == ReserveStatus.successWeather;
}

@Welltested()
class ReserveState {
  const ReserveState({
    this.status = ReserveStatus.initial,
    this.reserveList = const [],
    this.courtList = const [],
    this.rainChance = 0,
    this.reserve,
    this.failure,
  });

  final ReserveStatus status;
  final Reserve? reserve;
  final List<Reserve> reserveList;
  final List<Court> courtList;
  final String? failure;
  final double rainChance;

  ReserveState copyWith({
    ReserveStatus? status,
    Reserve? reserve,
    List<Reserve>? reserveList,
    List<Court>? courtList,
    String? failure,
    double? rainChance,
  }) {
    return ReserveState(
      status: status ?? this.status,
      reserve: reserve ?? this.reserve,
      reserveList: reserveList ?? this.reserveList,
      courtList: courtList ?? this.courtList,
      failure: failure ?? this.failure,
      rainChance: rainChance ?? this.rainChance,
    );
  }
}
