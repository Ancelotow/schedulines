import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/dto/responses/siri_response.dart';

abstract class TransportSchedulingApiService {


  Future<HttpResponse<SiriResponse>> getStopScheduling();

}