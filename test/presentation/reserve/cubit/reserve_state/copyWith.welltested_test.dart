import 'copyWith.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';

@GenerateMocks([Reserve, Court])
void main() {
  group('ReserveState copyWith', () {
    final mockReserve = MockReserve();
    final mockCourt = MockCourt();
    final reserveList = [mockReserve];
    final courtList = [mockCourt];
    final reserveState = ReserveState(
      status: ReserveStatus.initial,
      reserve: mockReserve,
      reserveList: reserveList,
      courtList: courtList,
      failure: 'Failure',
      rainChance: 0.5,
    );

    test('should change status when copyWith is called', () {
      final result = reserveState.copyWith(status: ReserveStatus.success);
      expect(result.status, equals(ReserveStatus.success));
    });

    test('should change reserve when copyWith is called', () {
      final newReserve = MockReserve();
      final result = reserveState.copyWith(reserve: newReserve);
      expect(result.reserve, equals(newReserve));
    });

    test('should change reserveList when copyWith is called', () {
      final newReserveList = [MockReserve()];
      final result = reserveState.copyWith(reserveList: newReserveList);
      expect(result.reserveList, equals(newReserveList));
    });

    test('should change courtList when copyWith is called', () {
      final newCourtList = [MockCourt()];
      final result = reserveState.copyWith(courtList: newCourtList);
      expect(result.courtList, equals(newCourtList));
    });

    test('should change failure when copyWith is called', () {
      final result = reserveState.copyWith(failure: 'New Failure');
      expect(result.failure, equals('New Failure'));
    });

    test('should change rainChance when copyWith is called', () {
      final result = reserveState.copyWith(rainChance: 0.7);
      expect(result.rainChance, equals(0.7));
    });

    test('should not change any value when copyWith is called without any parameter', () {
      final result = reserveState.copyWith();
      expect(result, equals(reserveState));
    });
  });
}