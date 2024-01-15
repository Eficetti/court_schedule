import 'fetchCourtAvailable.welltested_test.mocks.dart';
import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
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

  group('fetchCourtAvailable', () {
    test('should emit ReserveStatus.attempting and then ReserveStatus.success with courtList', () async {
      // Arrange
      final expectedCourtList = [
        Court(
          id: '1',
          name: 'A',
          address: 'Calle A',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Court(
          id: '2',
          name: 'B',
          address: 'Calle B',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Court(
          id: '3',
          name: 'C',
          address: 'Calle C',
          description: 'Cancha de futbol',
          image: 'https://picsum.photos/200/300',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      // Act
      reserveCubit.fetchCourtAvailable();

      // Assert
      await expectLater(
        reserveCubit.stream,
        emitsInOrder([
          ReserveState(status: ReserveStatus.attempting),
          ReserveState(status: ReserveStatus.success, courtList: expectedCourtList),
        ]),
      );
    });

    test('should rethrow when an exception occurs', () async {
      // Arrange
      when(mockLocalStorage.loadReserves()).thenThrow(Exception());

      // Act & Assert
      expect(() => reserveCubit.fetchCourtAvailable(), throwsException);
    });
  });
}
