import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'isCourtAvailable.welltested_test.mocks.dart';

// Generate mocks for LocalStorage and Reserve
@GenerateMocks([LocalStorage, Reserve])
void main() {
  group('ReserveCubit', () {
    late ReserveCubit reserveCubit;
    late MockLocalStorage mockLocalStorage;
    late MockReserve mockReserve;

    setUp(() {
      mockLocalStorage = MockLocalStorage();
      mockReserve = MockReserve();
      reserveCubit = ReserveCubit(mockLocalStorage);
    });

    test(
        'isCourtAvailable should return false if there are 3 or more reserves in a single day',
        () {
      final reserveList = List<Reserve>.filled(3, mockReserve);
      when(mockReserve.reservedCourt).thenReturn(
        Court(
          id: '1',
          name: 'A',
          address: 'Calle A',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      when(mockReserve.date).thenReturn(DateTime.now());
      when(() => reserveCubit.state).thenReturn(
        ReserveState(reserveList: reserveList) as ReserveState Function(),
      );

      final result = reserveCubit.isCourtAvailable(mockReserve);

      expect(result, false);
    });

    test(
        'isCourtAvailable should return true if there are less than 3 reserves in a single day',
        () {
      final reserveList = List<Reserve>.filled(2, mockReserve);
      when(mockReserve.reservedCourt).thenReturn(
        Court(
          id: '1',
          name: 'A',
          address: 'Calle A',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      when(mockReserve.date).thenReturn(DateTime.now());
      when(() => reserveCubit.state).thenReturn(
        ReserveState(reserveList: reserveList) as ReserveState Function(),
      );

      final result = reserveCubit.isCourtAvailable(mockReserve);

      expect(result, true);
    });
  });
}
