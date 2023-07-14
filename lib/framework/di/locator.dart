import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:t_paris/data/repositories/local/line_local_repository.dart';
import 'package:t_paris/data/repositories/local/stop_local_repository.dart';
import 'package:t_paris/domain/repositories/line_repository.dart';
import 'package:t_paris/domain/repositories/map_repository.dart';
import 'package:t_paris/domain/repositories/stop_repository.dart';

import '../../data/repositories/api/scheduling_api_repository.dart';
import '../../data/repositories/local/map_local_repository.dart';
import '../../data/services/api/scheduling_api_service.dart';
import '../../data/services/line_service.dart';
import '../../data/services/local/line_local_service.dart';
import '../../data/services/local/map_local_service.dart';
import '../../data/services/local/stop_local_service.dart';
import '../../data/services/map_service.dart';
import '../../data/services/scheduling_service.dart';
import '../../data/services/stop_service.dart';
import '../../domain/repositories/scheduling_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dioOptions = BaseOptions(
    baseUrl: dotenv.env['API_BASE_URI'] ?? "",
    headers: {
      'apiKey': dotenv.env['API_KEY'] ?? "",
    },
  );
  final dio = Dio(dioOptions);
  //dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<LineService>(
    LineLocalService(),
  );

  locator.registerSingleton<MapService>(
    MapLocalService(),
  );

  locator.registerSingleton<StopService>(
    StopLocalService(),
  );

  locator.registerSingleton<SchedulingService>(
    SchedulingApiService(locator<Dio>()),
  );

  locator.registerSingleton<LineRepository>(
    LineLocalRepository(locator<LineService>()),
  );

  locator.registerSingleton<StopRepository>(
    StopLocalRepository(locator<StopService>()),
  );

  locator.registerSingleton<MapRepository>(
    MapLocalRepository(locator<MapService>()),
  );

  locator.registerSingleton<SchedulingRepository>(
    SchedulingApiRepository(locator<SchedulingService>()),
  );
}
