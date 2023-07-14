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
import 'package:t_paris/ui/logic/scheduling/scheduling_bloc.dart';

class ScheduleView extends StatelessWidget {
  final Stop stop;

  const ScheduleView({
    Key? key,
    required this.stop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _getSchedulingStop(context);
    return BlocBuilder<SchedulingBloc, SchedulingState>(
      builder: (_, state) {
        switch (state.status) {
          case SchedulingStatus.loading:
            return const Center(child: CupertinoActivityIndicator());
          case SchedulingStatus.error:
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
            );
          default:
            return _getSchedules(context, state.schedules);
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
                              _getScheduleInformation(
                                  destination.elementAtOrNull(0)),
                              const SizedBox(width: 15),
                              _getScheduleInformation(
                                  destination.elementAtOrNull(1)),
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
          ArrivalStatusAssetAdapter.fromArrivalStatus(
              stopScheduling.departureStatus),
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

  void _getSchedulingStop(BuildContext context) {
    final bloc = BlocProvider.of<SchedulingBloc>(context);
    bloc.add(SchedulingEventFetch("STIF:StopPoint:Q:${stop.idRef}:"));
  }
}
