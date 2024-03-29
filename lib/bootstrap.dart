import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:court_scheduling/data/local/local_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function(LocalStorage) builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create an instance of SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Create an instance of LocalStorageImpl
  final localStorage = LocalStorageImpl(
    sharedPreferences: sharedPreferences,
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder(localStorage));
}
