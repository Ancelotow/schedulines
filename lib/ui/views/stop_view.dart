import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/domain/extensions/hex_color.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/ui/logic/stop/stop_bloc.dart';
import 'package:t_paris/ui/views/schedule_view.dart';
import 'package:t_paris/ui/widgets/transport_avaible_displayer.dart';

class StopView extends StatefulWidget {
  Stop? currentStop;

  StopView({
    Key? key,
    this.currentStop,
  }) : super(key: key);

  @override
  State<StopView> createState() => _StopViewState();
}

class _StopViewState extends State<StopView> {
  bool _isOpen = false;
  late double _height;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!_isOpen) {
      _height = MediaQuery.of(context).size.height / 10;
    }
    BlocProvider.of<StopBloc>(context).add(StopEventFetch());
    return BlocBuilder<StopBloc, StopState>(
      builder: (_, state) {
        switch (state.status) {
          case StopStatus.loading:
            return const Center(child: CupertinoActivityIndicator());
          case StopStatus.error:
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
            );
          default:
            if (widget.currentStop != null) {
              return _getCard(state.stops.firstWhere(
                      (e) => e.idRef == widget.currentStop!.idRef
              ));
            }
            return Container();
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
      return ScheduleView(stop: widget.currentStop!);
    }
    return null;
  }
}
