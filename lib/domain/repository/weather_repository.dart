// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:welltested_annotation/welltested_annotation.dart';

@Welltested()
class WeatherRepository {
  Future<double?> getWeatherByCity(String date) async {
    final apiUrl = Uri.parse(
      'http://api.openweathermap.org/data/2.5/forecast?q=CORDOBA,Argentina&appid=d610f567c28f1d2151a05a8681367d8d',
    );

    try {
      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final rainForecasts = (data['list'] as List).where(
          (forecast) => forecast['dt_txt'].toString().startsWith(date),
        );

        if (rainForecasts.isNotEmpty) {
          final rainChances = <double>[];

          for (final forecast in rainForecasts) {
            final rain = forecast['rain'] != null ? forecast['rain']['3h'] : 0;
            rainChances.add(double.tryParse(rain.toString()) ?? 0);
          }

          final averageRainChance =
              rainChances.fold(0.0, (prev, curr) => prev + curr) /
                  rainChances.length;

          return averageRainChance;
        }
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
