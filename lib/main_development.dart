import 'package:court_scheduling/app/app.dart';
import 'package:court_scheduling/bootstrap.dart';

void main() {
  bootstrap((localStorage) => App(localStorage: localStorage));
}
