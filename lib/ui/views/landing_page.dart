import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/domain/notifications/StopSelectedNotification.dart';
import 'package:t_paris/ui/views/map_view.dart';
import 'package:t_paris/ui/views/searchfield_view.dart';
import 'package:t_paris/ui/views/stop_view.dart';

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
          MapView(
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
                child: SearchFieldView(currentStop: _stop),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: StopView(currentStop: _stop),
          ),
        ],
      ),
    );
  }
}
