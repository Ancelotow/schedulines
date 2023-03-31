import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/ui/cubits/states/transport_scheduling_state.dart';
import 'package:t_paris/ui/cubits/transport_scheduling_cubit.dart';

import '../widgets/error.dart';

class TransportSchedulingPage extends StatelessWidget {

  const TransportSchedulingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportSchedulingCubit>(context);
    viewModel.getSchedulingStop();
    Timer.periodic(const Duration(minutes: 60), (timer) => viewModel.getSchedulingStop());
    viewModel.lineRef = "STIF:Line::C01742:";
    viewModel.monitoringRef = "STIF:StopPoint:Q:473921:";
    return Scaffold(
      body: BlocBuilder<TransportSchedulingCubit, TransportSchedulingState>(
        builder: (_, state) {
          switch (state.runtimeType) {
            case TransportSchedulingStateLoading:
              return const Center(child: CupertinoActivityIndicator());
            case TransportSchedulingStateError:
              return Center(child: WidgetError(exception: state.error!));
            case TransportSchedulingStateSuccess:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: state.data!.map((e) => Text("${e.destination} : ${e.arrivalAt.hour}:${e.arrivalAt.minute} (${e.arrivalStatus})")).toList(),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
