import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_paris/domain/repositories/line_repository.dart';
import 'package:t_paris/domain/repositories/scheduling_repository.dart';
import 'package:t_paris/domain/repositories/stop_repository.dart';
import 'package:t_paris/ui/logic/map/map_bloc.dart';
import 'package:t_paris/ui/logic/scheduling/scheduling_bloc.dart';
import 'package:t_paris/ui/logic/stop/stop_bloc.dart';
import 'domain/repositories/map_repository.dart';
import 'framework/di/locator.dart';
import 'framework/routes/app_router.dart';
import 'framework/themes/theme.dart';

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
          create: (context) => MapBloc(
            repository: locator<MapRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => StopBloc(
            repository: locator<StopRepository>(),
          ),
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
