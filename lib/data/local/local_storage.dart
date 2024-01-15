import 'dart:convert';

import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welltested_annotation/welltested_annotation.dart';

abstract class LocalStorage {
  Future<bool> saveReserves(
    List<Reserve> reservedCourts,
  );

  Future<List<Reserve>> loadReserves();
}

@Welltested()
class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  final SharedPreferences _sharedPref;

  final key = 'reserves';

  @override
  @override
  Future<List<Reserve>> loadReserves() async {
    try {
      final jsonList = _sharedPref.getStringList(key) ?? [];
      return jsonList
          .map((e) => Reserve.fromJson(jsonDecode(e) as Map<String, dynamic>))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> saveReserves(
    List<Reserve> reservedCourts,
  ) async {

    final existingReserves = await loadReserves();

    final updatedReserves = [...existingReserves, ...reservedCourts];

    final jsonList =
        updatedReserves.map((e) => jsonEncode(e.toJson())).toList();

    return _sharedPref.setStringList(key, jsonList);
  }
}
