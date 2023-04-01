import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:t_paris/domain/models/entities/stop.dart';
import 'package:t_paris/ui/cubits/states/transport_map_state.dart';
import 'package:t_paris/ui/cubits/transport_map_cubit.dart';
import 'package:t_paris/ui/widgets/error.dart';

class LandingPageMapBloc extends StatelessWidget {
  final Function(GoogleMapController?)? onMapCreated;

  const LandingPageMapBloc({
    Key? key,
    this.onMapCreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = BlocProvider.of<TransportMapCubit>(context);
    viewModel.getLinesOnMaps();
    return BlocBuilder<TransportMapCubit, TransportMapState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case TransportMapStateLoading:
            return const Center(child: CupertinoActivityIndicator());
          case TransportMapStateError:
            return Center(child: WidgetError(exception: state.error!));
          case TransportMapStateSuccess:
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
              polylines: state.data!
                  .where((e) =>
                      e.mode.toLowerCase() == "subway" ||
                      e.mode.toLowerCase() == "tram" ||
                      (e.mode.toLowerCase() == "rail" &&
                          !e.line.toLowerCase().contains("ter")))
                  .map((e) => e.toPolyline())
                  .toSet(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
