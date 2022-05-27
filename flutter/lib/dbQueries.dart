import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

var localIP = "10.0.2.2";
Future<String> dummyQuery() async {
  final queryParams = {
    'title': 'star',
    'dummy':"1"
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}