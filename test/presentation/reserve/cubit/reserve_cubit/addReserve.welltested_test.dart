import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'addReserve.welltested_test.mocks.dart';

// Generate mocks for LocalStorage
@GenerateMocks([LocalStorage])
void main() {
  group('ReserveCubit', () {
    late MockLocalStorage mockLocalStorage;
    late ReserveCubit reserveCubit;

    setUp(() {
      mockLocalStorage = MockLocalStorage();
      reserveCubit = ReserveCubit(mockLocalStorage);
    });

    test('addReserve should emit new state with updated reserve list',
        () async {
      // Arrange
      final reserve = Reserve(
        date: DateTime.now(),
        rainChance: 0.5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userReserve: 'User1',
        reservedCourt: Court(
          id: '1',
          name: 'A',
          address: 'Calle A',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      const initialState = ReserveState();
      final expectedState = initialState.copyWith(
        reserveList: [...initialState.reserveList, reserve],
      );

      when(mockLocalStorage.saveReserves(any)).thenAnswer(
        (_) async => Future.value(true),
      );

      // Act
      await reserveCubit.addReserve(reserve);

      // Assert
      await expectLater(reserveCubit.stream, emits(expectedState));
    });

    test('addReserve should call saveReserves on LocalStorage', () async {
      // Arrange
      final reserve = Reserve(
        date: DateTime.now(),
        rainChance: 0.5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userReserve: 'User1',
        reservedCourt: Court(
          id: '1',
          name: 'A',
          address: 'Calle A',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      when(mockLocalStorage.saveReserves(any)).thenAnswer(
        (_) async => Future.value(
          true,
        ),
      );

      // Act
      await reserveCubit.addReserve(reserve);

      // Assert
      verify(mockLocalStorage.saveReserves(any)).called(1);
    });
  });
}
