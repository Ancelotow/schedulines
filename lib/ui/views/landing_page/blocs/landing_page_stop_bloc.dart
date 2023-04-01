import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/extensions/hex_color.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/ui/cubits/states/transport_stop_state.dart';
import 'package:t_paris/ui/cubits/transport_stop_cubit.dart';
import 'package:t_paris/ui/widgets/error.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_paris/ui/widgets/transport_avaible_displayer.dart';

class LandingPageStopBloc extends StatelessWidget {
  const LandingPageStopBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportStopCubit>(context);
    viewModel.getAllStops();
    return BlocBuilder<TransportStopCubit, TransportStopState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TransportStopStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case TransportStopStateError:
            return Center(child: WidgetError(exception: state.error!));
          case TransportStopStateSuccess:
            return _getCard(state.data!.firstWhere((e) => e.idRef == "71370"));
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _getCard(Stop stop) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        color: HexColor.fromHex("182732"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              stop.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          TransportAvailableDisplayer(stop: stop),
        ],
      ),
    );
  }
}
