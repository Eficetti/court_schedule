import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reserve.freezed.dart';
part 'reserve.g.dart';

@freezed
class Reserve with _$Reserve {
  ///
  const factory Reserve({
    required DateTime date,
    required double rainChance,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String userReserve,
    required Court reservedCourt,
    String? id,
  }) = _Reserve;

  factory Reserve.fromJson(Map<String, dynamic> json) =>
      _$ReserveFromJson(json);

  ///
  const Reserve._();
}
