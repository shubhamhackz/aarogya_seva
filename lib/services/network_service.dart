import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkService {
  static Future<dynamic> fetchData(url) async {
    http.Response response = await http.get(url);
    var result = jsonDecode(response.body);
    return result;
  }
}
