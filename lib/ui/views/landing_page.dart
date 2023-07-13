import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/domain/notifications/StopSelectedNotification.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_map_bloc.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_searhfield_bloc.dart';
import 'package:t_paris/ui/views/landing_page/blocs/landing_page_stop_bloc.dart';

class TransportSchedulingPage extends StatefulWidget {
  const TransportSchedulingPage({Key? key}) : super(key: key);

  @override
  State<TransportSchedulingPage> createState() =>
      _TransportSchedulingPageState();
}

class _TransportSchedulingPageState extends State<TransportSchedulingPage> {
  Stop? _stop;
  GoogleMapController? _mapController;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          LandingPageMapBloc(
              onMapCreated: (controller) => _mapController = controller
          ),
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: SafeArea(
              child: NotificationListener<StopSelectedNotification>(
                onNotification: (notification) {
                  setState(() => _stop = notification.stop);
                  if(_mapController != null) {
                    _mapController!.moveCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(target: _stop!.coordinates, zoom: 17)
                    ));
                  }
                  return true;
                },
                child: LandingPageSearchfieldBloc(currentStop: _stop),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LandingPageStopBloc(currentStop: _stop),
          ),
        ],
      ),
    );
  }
}
