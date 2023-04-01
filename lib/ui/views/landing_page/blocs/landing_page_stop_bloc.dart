import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/extensions/hex_color.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/ui/cubits/states/transport_stop_state.dart';
import 'package:t_paris/ui/cubits/transport_stop_cubit.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_schedule_bloc.dart';
import 'package:t_paris/ui/widgets/error.dart';
import 'package:t_paris/ui/widgets/transport_avaible_displayer.dart';

class LandingPageStopBloc extends StatefulWidget {
  Stop? currentStop;

  LandingPageStopBloc({
    Key? key,
    this.currentStop,
  }) : super(key: key);

  @override
  State<LandingPageStopBloc> createState() => _LandingPageStopBlocState();
}

class _LandingPageStopBlocState extends State<LandingPageStopBloc> {
  bool _isOpen = false;
  late double _height;

  @override
  void initState() {
    super.initState();
    _height = MediaQuery.of(context).size.height / 10;
  }

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
            if (widget.currentStop != null) {
              return _getCard(state.data!
                  .firstWhere((e) => e.idRef == widget.currentStop!.idRef));
            }
            return Container();
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _getCard(Stop stop) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < 0 && !_isOpen) {
          setState(() {
            _isOpen = true;
            _height = (MediaQuery.of(context).size.height / 3) * 2;
          });
        } else if (details.delta.dy > 0 && _isOpen) {
          setState(() {
            _isOpen = false;
            _height = MediaQuery.of(context).size.height / 10;
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          color: HexColor.fromHex("182732"),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(height: 20),
            _getSchedule(context) ?? Container()
          ],
        ),
      ),
    );
  }


  Widget? _getSchedule(BuildContext context) {
    if(_isOpen && widget.currentStop != null) {
      return LanfingPageScheduleBloc(stop: widget.currentStop!);
    }
    return null;
  }
}
