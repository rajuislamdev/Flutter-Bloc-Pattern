import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiClient {
  static Future<Response> get({
    required String apiUrl,
    Map<String, String>? queryParams,
  }) async {
    var client = http.Client();
    try {
      final url =
          Uri.https('jsonplaceholder.typicode.com', apiUrl, queryParams);
      final response =
          await client.get(url, headers: {"Accept": "application/json"});
      return response;
    } finally {
      client.close();
    }
  }
}
