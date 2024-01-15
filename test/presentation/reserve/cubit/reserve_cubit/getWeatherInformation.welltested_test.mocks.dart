// Mocks generated by Mockito 5.4.4 from annotations
// in court_scheduling/test/presentation/reserve/cubit/reserve_cubit/getWeatherInformation.welltested_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:court_scheduling/data/local/local_storage.dart' as _i4;
import 'package:court_scheduling/domain/entity/reserve/reserve.dart' as _i5;
import 'package:court_scheduling/domain/repository/weather_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i2.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<double?> getWeatherByCity(String? date) => (super.noSuchMethod(
        Invocation.method(
          #getWeatherByCity,
          [date],
        ),
        returnValue: _i3.Future<double?>.value(),
      ) as _i3.Future<double?>);
}

/// A class which mocks [LocalStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorage extends _i1.Mock implements _i4.LocalStorage {
  MockLocalStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> saveReserves(List<_i5.Reserve>? reservedCourts) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveReserves,
          [reservedCourts],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<List<_i5.Reserve>> loadReserves() => (super.noSuchMethod(
        Invocation.method(
          #loadReserves,
          [],
        ),
        returnValue: _i3.Future<List<_i5.Reserve>>.value(<_i5.Reserve>[]),
      ) as _i3.Future<List<_i5.Reserve>>);
}
