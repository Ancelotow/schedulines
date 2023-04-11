import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:t_paris/domain/models/adapter/arrival_status_asset_adapter.dart';
import 'package:t_paris/domain/models/entities/schedule.dart';
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
    viewModel.getSchedulingStop();
    return BlocBuilder<TransportSchedulingCubit, TransportSchedulingState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TransportSchedulingStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case TransportSchedulingStateError:
            return Center(child: WidgetError(exception: state.error!));
          case TransportSchedulingStateSuccess:
            return _getSchedules(context, state.data!);
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _getSchedules(BuildContext context, List<Schedule> schedules) {
    schedules = schedules
        .where((e) => e.line.mode.toLowerCase() != "bus")
        .sorted((a, b) => a.line.name.compareTo(b.line.name))
        .sorted((a, b) => a.line.mode.compareTo(b.line.mode) == 0 ? 0 : 1)
        .toList();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          final schedule = schedules.elementAt(index);
          final availableSchedules =
              schedule.schedules.where((e) => e.arrivedIn(DateTime.now()) >= 0);
          final destinations =
              groupBy(availableSchedules, (e) => e.destination);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      schedule.line.asset,
                      width: 35,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      schedule.direction,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(top: 5.0),
                  shrinkWrap: true,
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    final destination =
                        destinations.entries.elementAt(index).value;
                    final key = destinations.keys.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              key,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              _getScheduleInformation(destination.elementAtOrNull(0)),
                              const SizedBox(width: 15),
                              _getScheduleInformation(destination.elementAtOrNull(1)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getScheduleInformation(StopScheduling? stopScheduling) {
    if (stopScheduling == null) {
      return const Text(
        "inconnu",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.white,
        ),
      );
    }
    return Row(
      children: [
        SvgPicture.asset(
          ArrivalStatusAssetAdapter.fromArrivalStatus(stopScheduling.departureStatus),
          width: 10,
        ),
        const SizedBox(width: 5),
        Text(
          "${stopScheduling.arrivedIn(DateTime.now())}min",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
