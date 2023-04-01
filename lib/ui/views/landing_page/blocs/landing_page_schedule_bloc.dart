import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/models/entities/arrival_status.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/domain/models/entities/stop_scheduling.dart';
import 'package:t_paris/ui/cubits/states/transport_scheduling_state.dart';
import 'package:t_paris/ui/cubits/transport_scheduling_cubit.dart';
import 'package:t_paris/ui/widgets/error.dart';

class LanfingPageScheduleBloc extends StatelessWidget {
  final Stop stop;

  const LanfingPageScheduleBloc({
    Key? key,
    required this.stop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportSchedulingCubit>(context);
    Timer.periodic(
        const Duration(minutes: 60), (timer) => viewModel.getSchedulingStop());
    viewModel.monitoringRef = "STIF:StopPoint:Q:${stop.idRef}:";
    print(viewModel.monitoringRef);
    viewModel.getSchedulingStop();
    return BlocBuilder<TransportSchedulingCubit, TransportSchedulingState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TransportSchedulingStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case TransportSchedulingStateError:
            return Center(child: WidgetError(exception: state.error!));
          case TransportSchedulingStateSuccess:

            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: state.data!
                      .where((e) =>
                          e.arrivalStatus != ArrivalStatus.unknown &&
                          !e.operatorRef.contains("BUS"))
                      .map((e) => Text(
                            "${e.destination} : ${e.departureAt.hour}:${e.departureAt.minute}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13
                            ),
                    textAlign: TextAlign.left,
                          ))
                      .toList(),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _getSchedulings(BuildContext context, List<StopScheduling> schedulings) {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: schedulings.length,
        itemBuilder: (context, index) {
          final schedule = schedulings[index];
          return Text(
              "${schedule.destination} : ${schedule.arrivedIn(DateTime.now())}"
          );
        }
    );
  }

}
