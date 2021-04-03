import 'dart:convert';

import 'package:http/http.dart';

import '../../model/rates/exchange_rate.dart';
import '../../utils/api_object.dart';
import '../../utils/wrapper.dart';

class RemoteService {
  final _baseUrl = 'openexchangerates.org';

  final _baseQueryParams = {
    'app_id': 'a6216ebda13342b0ad790c389ef1be1d',
  };

  Future<Wrapper<ExchangeRates>> fetchExchangeRates() async {
    final response = await _request(_http.get, '/api/latest.json');
    if (response.data != null) {
      return Wrapper(
          data: ExchangeRates.fromJson(response.data!),
          status: response.status);
    } else {
      return Wrapper(status: response.status);
    }
  }

  Future<Wrapper<Map<String, dynamic>>> _request(
    _http method,
    String url, {
    ApiObject? body,
  }) async {
    final uri = Uri.https(_baseUrl, url, _baseQueryParams);
    final encodedBody = body == null ? null : body.toJson();

    Response response;
    switch (method) {
      case _http.get:
        response = await get(uri);
        break;
      case _http.post:
        response = await post(uri, body: encodedBody);
        break;
      case _http.put:
        response = await put(uri, body: encodedBody);
        break;
      case _http.delete:
        response = await delete(uri);
        break;
    }
    return Wrapper(
        data: jsonDecode(response.body), status: response.statusCode);
  }
}

enum _http {
  get,
  post,
  put,
  delete,
}
