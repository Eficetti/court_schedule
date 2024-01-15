import 'fetchReserves.welltested_test.mocks.dart';
import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([LocalStorage])
void main() {
  late ReserveCubit reserveCubit;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    reserveCubit = ReserveCubit(mockLocalStorage);
  });

  group('fetchReserves', () {
    test('should emit ReserveStatus.attempting and then ReserveStatus.success when fetchReserves is successful', () async {
      // Arrange
      when(mockLocalStorage.loadReserves()).thenAnswer((_) async {
        return <Reserve>[];
      });

      // Act
      reserveCubit.fetchReserves();

      // Assert
      await expectLater(
        reserveCubit.stream,
        emitsInOrder([
          ReserveState(status: ReserveStatus.attempting),
          ReserveState(status: ReserveStatus.success, reserveList: <Reserve>[]),
        ]),
      );
    });

    test('should throw when fetchReserves fails', () async {
      // Arrange
      when(mockLocalStorage.loadReserves()).thenThrow(Exception());

      // Act & Assert
      expect(() => reserveCubit.fetchReserves(), throwsException);
    });
  });
}