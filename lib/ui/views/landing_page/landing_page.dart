import 'package:flutter/material.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_map_bloc.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_stop_bloc.dart';

class TransportSchedulingPage extends StatefulWidget {
  const TransportSchedulingPage({Key? key}) : super(key: key);

  @override
  State<TransportSchedulingPage> createState() =>
      _TransportSchedulingPageState();
}

class _TransportSchedulingPageState extends State<TransportSchedulingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: const [
          LandingPageMapBloc(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LandingPageStopBloc(),
          ),
        ],
      ),
    );
  }
}
