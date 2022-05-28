import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'objects/Movie.dart';
import 'objects/User.dart';

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

Future<List<Movie>> searchByOnlyGenre(String title) async {
  final queryParams = {
    'search_by_only_genre':"1",
    'gName': title
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

Future<List<Movie>> searchByActor(String title) async {
  final queryParams = {
    'search_by_actor':"1",
    'fullName': title
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

      //List:
      List<Movie> movies = List<Movie>.from(l.map((model)=> Movie.fromJson(model)));
      // Singular:
      // Movie movie = Movie.fromJson(jsonDecode(response.body));

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

Future<List<User>> searchByUsername(String title) async {
  final queryParams = {
    'search_by_username':"1",
    'fullName': title
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
      List<User> users = List<User>.from(l.map((model)=> User.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return users;
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

Future<List<Movie>> showTopRatedMoviesPerGenre() async {
  final queryParams = {
    'show_top_rated_movies_per_genre':"1"
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