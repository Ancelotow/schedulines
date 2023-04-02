// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_scheduling_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TransportSchedulingApiService implements TransportSchedulingApiService {
  _TransportSchedulingApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://prim.iledefrance-mobilites.fr/marketplace';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SiriResponse>> getStopScheduling(monitoringRef) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'MonitoringRef': monitoringRef};
    final _headers = <String, dynamic>{
      r'apiKey': 'pjB7qiNhlBHc6RHsozpGdeUN1TjjU4db'
    };
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<SiriResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/stop-monitoring',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SiriResponse.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
