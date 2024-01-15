import 'getWeatherInformation.welltested_test.mocks.dart';
import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/repository/weather_repository.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([WeatherRepository, LocalStorage])
void main() {
  late ReserveCubit reserveCubit;
  late MockWeatherRepository mockWeatherRepository;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    mockLocalStorage = MockLocalStorage();

    reserveCubit = ReserveCubit(mockLocalStorage);
  });

  group('getWeatherInformation', () {
    test('should emit success state with rainChance when getWeatherByCity is successful', () async {
      // Arrange
      final date = '2022-01-01';
      final rainChance = 0.5;
      when(mockWeatherRepository.getWeatherByCity(date)).thenAnswer((_) async => rainChance);

      // Act
      reserveCubit.getWeatherInformation(date);

      // Assert
      await expectLater(
        reserveCubit.stream,
        emitsInOrder([
          ReserveState(status: ReserveStatus.attempting),
          ReserveState(status: ReserveStatus.successWeather, rainChance: rainChance),
        ]),
      );
    });

    test('should throw when getWeatherByCity fails', () async {
      // Arrange
      final date = '2022-01-01';
      when(mockWeatherRepository.getWeatherByCity(date)).thenThrow(Exception());

      // Act & Assert
      expect(() => reserveCubit.getWeatherInformation(date), throwsException);
    });
  });
}