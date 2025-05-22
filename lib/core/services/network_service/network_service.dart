import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_app/core/models/error_model.dart';
import 'package:test_app/core/services/network_service/custom_log.dart';
import 'package:test_app/core/services/network_service/network_config.dart';

abstract class INetworkService {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, Map<String, dynamic> body);
}

class HTTPNetworkService extends INetworkService {

  final Talker _talker = Talker();

  String _getPrettyJSONString(dynamic jsonObject) {
    const encoder = JsonEncoder.withIndent('\t');
    return encoder.convert(jsonObject);
  }

  @override
  Future<dynamic> get(String url) async {
    try {
      logRequest('get', url);
      final getIt = GetIt.instance;
      final String baseUrl = getIt<NetworkConfig>().baseUrl;
      http.Response response = await http.get(
        Uri.parse('$baseUrl$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer accessToken'
        },
      );
      logResponse(response.statusCode, jsonDecode(response.body), 'get', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
        // await refresh();
          logRequest('get', url);
          http.Response response = await http.get(
            Uri.parse('$baseUrl$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer accessToken'
            },
          );
          logResponse(response.statusCode, jsonDecode(response.body), 'get', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          throw ErrorModel(
              statusCode: response.statusCode,
              message: response.body
          );
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      logRequest('post', url, body: body);
      final getIt = GetIt.instance;
      final String baseUrl = getIt<NetworkConfig>().baseUrl;
      http.Response response = await http.post(
          Uri.parse('$baseUrl$url'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer accessToken'
          },
          body: jsonEncode(body)
      );
      logResponse(response.statusCode, jsonDecode(response.body), 'post', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
        // await refresh();
          logRequest('post', url);
          http.Response response = await http.post(
            Uri.parse('$baseUrl$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer accessToken'
            },
            body: jsonEncode(body),
          );
          logResponse(response.statusCode, jsonDecode(response.body), 'post', url);
          switch (response.statusCode) {
            case 200:
              return jsonDecode(response.body);
            default:
              throw ErrorModel(
                  statusCode: response.statusCode,
                  message: response.body
              );
          }
        default:
          return {
            'success': false,
            'status_code': response.statusCode
          };
      }
    }  catch (_) {
      rethrow;
    }
  }

  void logRequest(
      String type,
      String url,
      {Map<String, dynamic>? body}
      ){
    final getIt = GetIt.instance;
    final String baseUrl = getIt<NetworkConfig>().baseUrl;
    _talker.logCustom(CustomLog(
        '\nType: $type'
            '\nurl: $baseUrl$url'
            '${body == null ? '' : '\nbody: $body'}',
        // '${dio.options.headers}',
        'REQUEST',
        015
    ));
  }

  void logResponse(
      int statusCode,
      dynamic body,
      String type,
      String url
      ){
    final getIt = GetIt.instance;
    final String baseUrl = getIt<NetworkConfig>().baseUrl;
    _talker.logCustom(CustomLog(
        '\nType: $type'
            '\nurl: $baseUrl$url'
            '\nStatus: $statusCode'
            '\nBody: ${_getPrettyJSONString(body)}',
        'RESPONSE',
        statusCode >= 200 && statusCode <= 299 ? 046 : 009
    ));
  }
}