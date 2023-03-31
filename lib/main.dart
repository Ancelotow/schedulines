import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_paris/config/routes/app_router.dart';
import 'package:t_paris/data/repositories/api/transport_scheduling_api_repository.dart';
import 'package:t_paris/domain/repositories/transport_scheduling_repository.dart';
import 'package:t_paris/ui/cubits/transport_scheduling_cubit.dart';

import 'config/themes/theme.dart';
import 'helpers/locator.dart';

Future<void> main() async {
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
          create: (context) => TransportSchedulingCubit(
            locator<TransportSchedulingRepository>(),
          )..getSchedulingStop(),
        )
      ],
      child: MaterialApp.router(
        title: "T-Paris",
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.light,
      ),
    );
  }
}
