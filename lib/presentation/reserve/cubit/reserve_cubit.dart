import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/domain/repository/weather_repository.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welltested_annotation/welltested_annotation.dart';

@Welltested()
class ReserveCubit extends Cubit<ReserveState> {
  ReserveCubit(this.localStorage) : super(const ReserveState());

  final _weatherRepository = WeatherRepository();

  final LocalStorage localStorage;

  Future<void> fetchReserves() async {
    emit(state.copyWith(status: ReserveStatus.attempting));

    try {
      // Load the reserve list from local storage
      final reserveList = await localStorage.loadReserves();

      emit(
        state.copyWith(
          status: ReserveStatus.success,
          reserveList: reserveList,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addReserve(Reserve reserve) async {
    emit(state.copyWith(status: ReserveStatus.attempting));

    try {
      if (!isCourtAvailable(reserve)) {
        emit(
          state.copyWith(
            status: ReserveStatus.failure,
            failure: 'The court is not available for this day!',
          ),
        );
        return;
      }

      final updatedReserveList = List<Reserve>.from(state.reserveList)
        ..add(reserve);
      emit(state.copyWith(reserveList: updatedReserveList));
      await localStorage.saveReserves(updatedReserveList);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeReserve(Reserve reserve) async {
    emit(state.copyWith(status: ReserveStatus.attempting));

    try {
      final updatedReserveList =
          state.reserveList.where((r) => r.id != reserve.id).toList();

      emit(
        state.copyWith(
          status: ReserveStatus.success,
          reserveList: updatedReserveList,
        ),
      );

      // Save the updated reserve list to local storage
      await localStorage.saveReserves(updatedReserveList);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchCourtAvailable() async {
    emit(state.copyWith(status: ReserveStatus.attempting));

    try {
      final courtsList = [
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

      emit(
        state.copyWith(
          status: ReserveStatus.success,
          courtList: courtsList,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  bool isCourtAvailable(Reserve reserve) {
    final reserves = state.reserveList
        .where((x) => x.reservedCourt.name == reserve.reservedCourt.name);

    final amountOfReservesSingleDay =
        reserves.map((e) => e.date == reserve.date).toList().where(
              (x) => x == true,
            );

    if (amountOfReservesSingleDay.length >= 3) {
      return false;
    }

    return true;
  }

  Future<void> getWeatherInformation(String date) async {
    emit(state.copyWith(status: ReserveStatus.attempting));

    try {
      final rainChance = await _weatherRepository.getWeatherByCity(date);

      emit(
        state.copyWith(
          status: ReserveStatus.successWeather,
          rainChance: rainChance,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
