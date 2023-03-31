import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:t_paris/data/services/api/transport_scheduling_api_service.dart';
import 'package:t_paris/domain/repositories/transport_scheduling_repository.dart';

import '../data/repositories/api/transport_scheduling_api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<TransportSchedulingApiService>(
    TransportSchedulingApiService(locator<Dio>()),
  );

  locator.registerSingleton<TransportSchedulingRepository>(
    TransportSchedulingApiRepository(locator<TransportSchedulingApiService>()),
  );

}