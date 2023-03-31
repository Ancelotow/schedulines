// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    TransportSchedulingRoute.name: (routeData) {
      final args = routeData.argsAs<TransportSchedulingRouteArgs>(
          orElse: () => const TransportSchedulingRouteArgs());
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: TransportSchedulingPage(key: args.key),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          TransportSchedulingRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [TransportSchedulingPage]
class TransportSchedulingRoute
    extends PageRouteInfo<TransportSchedulingRouteArgs> {
  TransportSchedulingRoute({Key? key})
      : super(
          TransportSchedulingRoute.name,
          path: '/',
          args: TransportSchedulingRouteArgs(key: key),
        );

  static const String name = 'TransportSchedulingRoute';
}

class TransportSchedulingRouteArgs {
  const TransportSchedulingRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'TransportSchedulingRouteArgs{key: $key}';
  }
}
