import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:t_paris/data/repositories/local/line_local_repository.dart';
import 'package:t_paris/data/repositories/local/transport_stop_local_repository.dart';
import 'package:t_paris/data/services/api/transport_scheduling_api_service.dart';
import 'package:t_paris/data/services/local/transport_line_local_service.dart';
import 'package:t_paris/data/services/local/transport_map_local_service.dart';
import 'package:t_paris/data/services/local/transport_stop_local_service.dart';
import 'package:t_paris/domain/repositories/line_repository.dart';
import 'package:t_paris/domain/repositories/transport_map_repository.dart';
import 'package:t_paris/domain/repositories/transport_stop_repository.dart';

import '../data/repositories/api/transport_scheduling_api_repository.dart';
import '../data/repositories/local/transport_map_local_repository.dart';
import '../domain/repositories/scheduling_repository.dart';

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

  locator.registerSingleton<TransportLineLocalService>(
    TransportLineLocalService(),
  );

  locator.registerSingleton<TransportMapLocalService>(
      TransportMapLocalService(),
  );

  locator.registerSingleton<TransportStopLocalService>(
    TransportStopLocalService(),
  );

  locator.registerSingleton<LineRepository>(
    LineLocalRepository(locator<TransportLineLocalService>()),
  );

  locator.registerSingleton<TransportStopRepository>(
    TransportStopLocalRepository(locator<TransportStopLocalService>()),
  );
  
  locator.registerSingleton<TransportMapRepository>(
      TransportMapLocalRepository(locator<TransportMapLocalService>()),
  );

  locator.registerSingleton<TransportSchedulingApiService>(
    TransportSchedulingApiService(locator<Dio>()),
  );

  locator.registerSingleton<SchedulingRepository>(
    TransportSchedulingApiRepository(locator<TransportSchedulingApiService>()),
  );

}