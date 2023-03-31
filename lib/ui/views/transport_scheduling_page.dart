import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/domain/adapter/line_geo_adapter.dart';
import 'package:t_paris/ui/cubits/states/transport_scheduling_state.dart';
import 'package:t_paris/ui/cubits/transport_scheduling_cubit.dart';

class TransportSchedulingPage extends StatefulWidget {
  TransportSchedulingPage({Key? key}) : super(key: key);

  @override
  State<TransportSchedulingPage> createState() =>
      _TransportSchedulingPageState();
}

class _TransportSchedulingPageState extends State<TransportSchedulingPage> {
  final Set<Polyline> _polyline = {};

  @override
  void initState() {
    parseAndDrawAssetsOnMap();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportSchedulingCubit>(context);
    viewModel.getSchedulingStop();
    /*Timer.periodic(
        const Duration(minutes: 1), (timer) => viewModel.getSchedulingStop());*/
    viewModel.lineRef = "STIF:Line::C01742:";
    viewModel.monitoringRef = "STIF:StopPoint:Q:473921:";
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(48.866667, 2.333333),
          zoom: 13.0,
        ),
        mapType: MapType.normal,
        polylines: _polyline,
      ),
    );
  }

/*

FlutterMap(
        mapController: _mapController,
        key: ValueKey(MediaQuery.of(context).orientation),
        options: MapOptions(
          zoom: 13.0,
          center: LatLng(48.866667, 2.333333),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.ancelotow.t_paris',
          ),
          PolylineLayer(
            polylineCulling: false,
            polylines: _polyline,
          )
        ],
      )
 */
  Future<void> parseAndDrawAssetsOnMap() async {
    final result = await rootBundle.loadString('assets/geo/lines.geojson');
    final data = json.decode(result);
    for (var features in data["features"]) {
      final lines = LineGeoAdapter.fromGeojson(features);
      for (var line in lines) {
        _polyline.add(
          Polyline(
            polylineId: PolylineId(line.line),
            color: line.color,
            points: line.coordinates,
            width: 3,
          ),
        );
      }
      lines.remove(true);
    }
    setState(() {});
  }

/*BlocBuilder<TransportSchedulingCubit, TransportSchedulingState>(
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
                  children: state.data!
                      .map((e) => Text(
                          "${e.destination} : ${e.arrivedIn(DateTime.now())}m (${e.arrivalAt.hour}:${e.arrivalAt.minute})"))
                      .toList(),
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),*/
}
