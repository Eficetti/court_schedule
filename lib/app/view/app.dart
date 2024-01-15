import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:court_scheduling/l10n/l10n.dart';
import 'package:court_scheduling/presentation/home/view/home_page.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/view/add_reserve_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({required this.localStorage, super.key});

  final LocalStorage localStorage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReserveCubit>(
      create: (context) => ReserveCubit(localStorage),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/reserve': (_) => const AddReservePage(),
        },
      ),
    );
  }
}
