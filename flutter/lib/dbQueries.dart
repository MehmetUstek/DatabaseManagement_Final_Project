import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

var localIP = "10.0.2.2";
Future<String> dummyQuery() async {
  final response = await http
      .post(Uri.parse('http://$localIP:8080/dummy'), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}