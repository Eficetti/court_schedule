import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/home/view/widgets/reserved_court.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:court_scheduling/presentation/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ReserveCubit>().fetchReserves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
      body: BlocBuilder<ReserveCubit, ReserveState>(
        builder: (context, state) {
          if (state.status.isAttempting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status.isSuccess) {
            final reserves = _sortReservesByDate(state.reserveList);
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.reserveList.length,
              itemBuilder: (context, index) {
                return ReservedCourt(
                  reserve: reserves[index],
                );
              },
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}

List<Reserve> _sortReservesByDate(List<Reserve> reserves) {
  final modifiableList = List<Reserve>.from(reserves);
  modifiableList.sort((a, b) => a.date.compareTo(b.date));
  return modifiableList;
}
