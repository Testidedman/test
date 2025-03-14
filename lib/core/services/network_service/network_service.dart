import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/core/models/error_model.dart';
import 'package:test_app/core/services/network_service/network_config.dart';

abstract class INetworkService {
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body);
}

class HTTPNetworkService extends INetworkService {

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      // logRequest('get', url);
      final getIt = GetIt.instance;
      final String baseUrl = getIt<NetworkConfig>().baseUrl;
      http.Response response = await http.get(
        Uri.parse('$baseUrl$url'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer accessToken'
        },
      );
      // logResponse(response.statusCode!, response.data, 'get', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
        // await refresh();
        // logRequest('get', url);
          http.Response response = await http.get(
            Uri.parse('$baseUrl$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer accessToken'
            },
          );
          // logResponse(response.statusCode!, response.data, 'get', url);
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
    } catch (e, trace) {
      // log(e.toString());
      // log(trace.toString());
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    try {
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
      // logResponse(response.statusCode, response.body, 'post', url);
      switch (response.statusCode) {
        case 200:
          return jsonDecode(response.body);
        case 401:
        // await refresh();
        // logRequest('post', url);
          http.Response response = await http.post(
            Uri.parse('$baseUrl$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer accessToken'
            },
            body: jsonEncode(body),
          );
          // logResponse(response.statusCode, response.body, 'post', url);
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
}