import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/ui/logic/map/map_bloc.dart';
import 'package:t_paris/ui/widgets/error.dart';

class MapView extends StatelessWidget {
  final Function(GoogleMapController?)? onMapCreated;

  const MapView({
    Key? key,
    this.onMapCreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MapBloc>(context).add(MapEventFetch());
    return BlocBuilder<MapBloc, MapState>(
      builder: (_, state) {
        switch (state.status) {
          case MapStatus.loading:
            return const Center(child: CupertinoActivityIndicator());
          case MapStatus.error:
            return const Center(
              child: Icon(
                Icons.error,
                color: Colors.red,
                size: 30,
              ),
            );
          default:
            return GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(48.866667, 2.333333),
                zoom: 15.0,
              ),
              onMapCreated: onMapCreated,
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              polylines: state.lines
                  .where((e) =>
                      e.mode.toLowerCase() == "subway" ||
                      e.mode.toLowerCase() == "tram" ||
                      (e.mode.toLowerCase() == "rail" &&
                          !e.line.toLowerCase().contains("ter")))
                  .map((e) => e.toPolyline())
                  .toSet(),
            );
        }
      },
    );
  }
}
