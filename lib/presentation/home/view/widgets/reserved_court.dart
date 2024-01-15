import 'package:court_scheduling/domain/entity/reserve/reserve.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:court_scheduling/presentation/reserve/cubit/reserve_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservedCourt extends StatelessWidget {
  const ReservedCourt({required this.reserve, super.key});

  final Reserve reserve;

  @override
  Widget build(BuildContext context) {
    final reserveDate = reserve.date.toString().split(' ').first;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/200/300',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Court ${reserve.reservedCourt.name}',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Reserve by: ${reserve.userReserve}',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Reserve At: $reserveDate',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                    ),
                  ),
                  BlocConsumer<ReserveCubit, ReserveState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text('${reserve.rainChance}'),
                          const Icon(
                            Icons.water_drop_outlined,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 116,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ReserveCubit>()
                                    .removeReserve(reserve);
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.remove_circle_outline_sharp,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
