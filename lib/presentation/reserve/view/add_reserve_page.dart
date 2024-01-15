import 'package:court_scheduling/domain/entity/court/court.dart';
import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:court_scheduling/presentation/widgets/bottom_navigation_bar.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddReservePage extends StatelessWidget {
  const AddReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddReserveView();
  }
}

class AddReserveView extends StatefulWidget {
  const AddReserveView({super.key});

  @override
  State<AddReserveView> createState() => _AddReserveViewState();
}

class _AddReserveViewState extends State<AddReserveView> {
  final _formKey = GlobalKey<FormState>();
  final format = DateFormat('yyyy-MM-dd');
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  Court? _court;

  @override
  void initState() {
    context.read<ReserveCubit>().fetchCourtAvailable();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    dateTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0),
      body: Center(
        child: Form(
          key: _formKey,
          child: BlocBuilder<ReserveCubit, ReserveState>(
            builder: (context, state) {
              if (state.status.isFailure) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.failure ?? ''),
                    ),
                  );
                });
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select the Court',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonFormField(
                      alignment: Alignment.center,
                      items: state.courtList.map((court) {
                        return DropdownMenuItem(
                          value: court,
                          child: Text(court.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _court = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Select The date of the Reserve',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DateTimeField(
                      controller: dateTimeController,
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                      },
                      onChanged: (date) {
                        context.read<ReserveCubit>().getWeatherInformation(
                              dateTimeController.text,
                            );
                      },
                    ),
                  ),
                  BlocBuilder<ReserveCubit, ReserveState>(
                    builder: (context, state) {
                      if (state.status.isFailure) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.failure ?? ''),
                            ),
                          );
                        });
                      }

                      if (state.status.isSuccessWeather) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rain chance ${state.rainChance.toStringAsFixed(2)}%',
                            ),
                            const Icon(
                              Icons.water_drop_outlined,
                              color: Colors.blue,
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter your name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: userNameController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final reserve = Reserve(
                          date: DateTime.parse(dateTimeController.text),
                          userReserve: userNameController.text,
                          reservedCourt: _court!,
                          rainChance: double.parse(
                            state.rainChance.toStringAsFixed(2),
                          ),
                          createdAt: DateTime.now(),
                          updatedAt: DateTime.now(),
                        );

                        await context.read<ReserveCubit>().addReserve(reserve);
                        // dateTimeController.clear();
                        // userNameController.clear();

                        await Navigator.of(context).pushReplacementNamed('/');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
