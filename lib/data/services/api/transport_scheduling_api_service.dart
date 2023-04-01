import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:t_paris/domain/models/dto/responses/siri_response.dart';

part 'transport_scheduling_api_service.g.dart';

@RestApi(baseUrl: "https://prim.iledefrance-mobilites.fr/marketplace")
abstract class TransportSchedulingApiService {

  factory TransportSchedulingApiService (Dio dio, {String baseUrl}) = _TransportSchedulingApiService;

  @GET("/stop-monitoring")
  @Headers(<String, dynamic>{
    "apiKey" : "pjB7qiNhlBHc6RHsozpGdeUN1TjjU4db"
  })
  Future<HttpResponse<SiriResponse>> getStopScheduling(
    @Query("MonitoringRef") String monitoringRef,
    @Query("LineRef") String lineRef,
  );
}
