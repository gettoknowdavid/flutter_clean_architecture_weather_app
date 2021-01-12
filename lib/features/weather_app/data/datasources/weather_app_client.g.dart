// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_app_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WeatherAppClient implements WeatherAppClient {
  _WeatherAppClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://api.openweathermap.org';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<WeatherAppModel> searchWeather(q, appid) async {
    ArgumentError.checkNotNull(q, 'q');
    ArgumentError.checkNotNull(appid, 'appid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': q, r'appid': appid};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/data/2.5/weather?',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WeatherAppModel.fromJson(_result.data);
    return value;
  }
}
