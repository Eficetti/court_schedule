import 'package:freezed_annotation/freezed_annotation.dart';

part 'court.freezed.dart';
part 'court.g.dart';

@freezed
class Court with _$Court {
  ///
  const factory Court({
    required String name,
    required String address,
    required String description,
    required String image,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? id,
  }) = _Court;

  ///
  const Court._();

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}
