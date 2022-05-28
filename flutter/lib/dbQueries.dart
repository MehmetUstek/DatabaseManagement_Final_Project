import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'objects/Movie.dart';

var localIP = "10.0.2.2";
Future<List<Movie>> searchMovieByMovieName(String title) async {
  final queryParams = {
    'title': title,
    'search_by_movie_name':"1"
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      Iterable l = json.decode(response.body);
      List<Movie> movies = List<Movie>.from(l.map((model)=> Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    }
    catch(e){
      throw Exception('Failed to load user');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}