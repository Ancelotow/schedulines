import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_paris/config/routes/app_router.dart';
import 'package:t_paris/domain/repositories/line_repository.dart';
import 'package:t_paris/domain/repositories/scheduling_repository.dart';
import 'package:t_paris/domain/repositories/transport_stop_repository.dart';
import 'package:t_paris/ui/cubits/transport_map_cubit.dart';
import 'package:t_paris/ui/cubits/transport_stop_cubit.dart';
import 'package:t_paris/ui/logic/scheduling/scheduling_bloc.dart';
import 'config/themes/theme.dart';
import 'domain/repositories/transport_map_repository.dart';
import 'helpers/locator.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransportMapCubit(
            locator<TransportMapRepository>(),
          )..getLinesOnMaps(),
        ),
        BlocProvider(
          create: (context) => TransportStopCubit(
            locator<TransportStopRepository>(),
          )..getAllStops(),
        ),
        BlocProvider(
          create: (context) => SchedulingBloc(
            repository: locator<SchedulingRepository>(),
            lineRepository: locator<LineRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: "Schedulines",
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.get(context),
      ),
    );
  }
}
