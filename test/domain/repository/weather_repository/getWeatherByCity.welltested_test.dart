import 'getWeatherByCity.welltested_test.mocks.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as testMock;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:court_scheduling/domain/repository/weather_repository.dart';

@GenerateMocks([http.Client])
void main() {
  group('WeatherRepository', () {
    final clientMock = MockClient();
    final weatherRepository = WeatherRepository();

    test('getWeatherByCity returns average rain chance when the API call is successful',
        () async {
      // Arrange
      final response = http.Response(
        json.encode({
          'list': [
            {
              'dt_txt': '2022-01-01 00:00:00',
              'rain': {'3h': 0.5},
            },
            {
              'dt_txt': '2022-01-01 03:00:00',
              'rain': {'3h': 0.7},
            },
          ],
        }),
        200,
      );
      when(clientMock.get(any)).thenAnswer((_) async => response);

      // Act
      final result = await weatherRepository.getWeatherByCity('2022-01-01');

      // Assert
      expect(result, 0.6);
    });

    test('getWeatherByCity returns null when the API call fails', () async {
      // Arrange
      final response = http.Response('Failed to load weather data', 500);
      when(clientMock.get(any)).thenAnswer((_) async => response);

      // Act
      final result = await weatherRepository.getWeatherByCity('2022-01-01');

      // Assert
      expect(result, null);
    });

    test('getWeatherByCity returns null when there is no rain forecast for the given date', () async {
      // Arrange
      final response = http.Response(
        json.encode({
          'list': [
            {
              'dt_txt': '2022-01-02 00:00:00',
              'rain': {'3h': 0.5},
            },
            {
              'dt_txt': '2022-01-02 03:00:00',
              'rain': {'3h': 0.7},
            },
          ],
        }),
        200,
      );
      when(clientMock.get(any)).thenAnswer((_) async => response);

      // Act
      final result = await weatherRepository.getWeatherByCity('2022-01-01');

      // Assert
      expect(result, null);
    });
  });
}