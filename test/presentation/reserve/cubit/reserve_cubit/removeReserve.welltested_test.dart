import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'removeReserve.welltested_test.mocks.dart';

// Generate mocks for the LocalStorage class
@GenerateMocks([LocalStorage])
void main() {
  group('ReserveCubit', () {
    late ReserveCubit reserveCubit;
    late MockLocalStorage mockLocalStorage;

    setUp(() {
      // Initialize the mock repository and the cubit
      mockLocalStorage = MockLocalStorage();
      reserveCubit = ReserveCubit(mockLocalStorage);
    });

    test('removeReserve should update the state and call saveReserves', () async {
      // Create a reserve to be removed
      final reserve = Reserve(
        date: DateTime.now(),
        rainChance: 0.5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userReserve: 'User',
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

      // Set the initial state of the cubit
      reserveCubit.emit(ReserveState(reserveList: [reserve]));

      // Call the function to be tested
      await reserveCubit.removeReserve(reserve);

      // Verify that the state has been updated
      expect(reserveCubit.state.reserveList, isEmpty);

      // Verify that the function calls the saveReserves method with the updated list
      verify(mockLocalStorage.saveReserves([])).called(1);
    });

    test('removeReserve should throw an exception if it fails', () async {
      // Create a reserve to be removed
      final reserve = Reserve(
        date: DateTime.now(),
        rainChance: 0.5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userReserve: 'User',
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

      // Set the initial state of the cubit
      reserveCubit.emit(ReserveState(reserveList: [reserve]));

      // Make the saveReserves method throw an exception
      when(mockLocalStorage.saveReserves(any)).thenThrow(Exception());

      // Verify that the function throws an exception
      expect(() => reserveCubit.removeReserve(reserve), throwsException);
    });
  });
}
