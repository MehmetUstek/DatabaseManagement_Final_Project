import 'dart:convert';
import 'dart:io';

import 'package:database_management_project/objects/PairData.dart';
import 'package:database_management_project/objects/Triplet.dart';
import 'package:http/http.dart' as http;

import 'objects/Movie.dart';
import 'objects/User.dart';
import 'objects/Review.dart';
import 'objects/Watchlist.dart';
import 'objects/PairData.dart';
import 'objects/Triplet.dart';

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
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<Movie>> searchByMovieAndGenre(String title, String genre) async {
  final queryParams = {
    'search_by_movie_and_genre':"1",
    'title': title,
    'gName': genre
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
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<Movie>> searchByOnlyGenre(String genre) async {
  final queryParams = {
    'search_by_only_genre':"1",
    'gName': genre
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
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<Movie>> searchByActor(String name) async {
  final queryParams = {
    'search_by_actor':"1",
    'fullName': name
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
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<User>> searchByUsername(String username) async {
  final queryParams = {
    'search_by_username':"1",
    'username': username
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
      throw Exception('Failed to load users.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load users.');
  }
}

Future<User> showProfilePage(String username) async {
  final queryParams = {
    'show_profile_page':"1",
    'username': username
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      var info = jsonDecode(response.body)[0];
      User user = User.fromJson(info);
      return user;
    }
    catch(e){
      throw Exception('Failed to load the user.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the user.');
  }
}

//This returns just the usernames so I made it a list of string, not sure if it works
//I changed it to a list of a list of strings (Kerem).
Future<List<Triplet>> showFollowingsOfUser(String username) async {
  final queryParams = {
    'show_followings_of_user':"1",
    'username': username
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
      List<Triplet> usernamesAndNames = List<Triplet>.from(l.map((model)=> Triplet.fromJson(model)));
      return usernamesAndNames;
    }
    catch(e){
      throw Exception('Failed to load usernames.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load usernames.');
  }
}

//This returns just the usernames so I made it a list of string, not sure if it works
//I changed it to a list of a list of strings (Kerem).
Future<List<Triplet>> showFollowersOfUser(String username) async {
  final queryParams = {
    'show_followers_of_user':"1",
    'username': username
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
      List<Triplet> usernamesAndNames = List<Triplet>.from(l);
      return usernamesAndNames;
    }
    catch(e){
      throw Exception('Failed to load usernames.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load usernames.');
  }
}

Future<Watchlist> showWatchlistOfUser(String username) async {
  final queryParams = {
    'show_watchlist_of_user':"1",
    'username': username
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      Watchlist wl = Watchlist.fromJson(jsonDecode(response.body));
      return wl;
    }
    catch(e){
      throw Exception('Failed to load the watchlist.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the watchlist.');
  }
}

Future<List<Review>> showReviewsOfUser(String username) async {
  final queryParams = {
    'show_reviews_of_user':"1",
    'username': username
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
      List<Review> reviews = List<Review>.from(l.map((model)=> Review.fromJson(model)));
      return reviews;
    }
    catch(e){
      throw Exception('Failed to load reviews.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load reviews.');
  }
}

Future<List<String>> showingActorsInMovie(int mid) async {
  final queryParams = {
    'showing_actors_in_movie':"1",
    'MID': mid.toString()
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
      List<String> aNames = List<String>.from(l.map((e) => e['fullName']));
      return aNames;
    }
    catch(e){
      throw Exception('Failed to load actors.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load actors.');
  }
}

Future<List<String>> findingGenresOfMovie(int mid) async {
  final queryParams = {
    'finding_genres_of_movie':"1",
    'MID': mid.toString()
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
      List<String> gNames = List<String>.from(l.map((e) => e['gname']));
      return gNames;
    }
    catch(e){
      throw Exception('Failed to load genres.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load genres.');
  }
}

Future<List<Review>> showReviewsOfMovie(int mid) async {
  final queryParams = {
    'show_reviews_of_movie':"1",
    'MID': mid
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
      List<Review> reviews = List<Review>.from(l.map((model)=> Review.fromJson(model)));
      return reviews;
    }
    catch(e){
      throw Exception('Failed to load reviews.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load reviews.');
  }
}

//This query does not return anything. So I made it return the user it created as an object.
//I took gender as String, but not sure how it is in database. Kerem wanted it String I remember.
//I made isPremium boolean, I don't know if this will cause a problem in query because in database it is a bit field.
//I gave everyone a default creationDate, no need for another query.
Future<String> registerUser(String username, String email, String password, String fname,
    String lname, String gender, String paymentMethod, bool isPremium,) async {
  final queryParams = {
    'register_user':"1",
    'username': username,
    'email': email,
    'password': password,
    'fname': fname,
    'lname': lname,
    'gender': gender,
    'paymentMethod': paymentMethod,
    'isPremium': isPremium
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return "OK";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to register.');
  }
}

//Query does not return anything, so I made it void.
//Call this query for each genre.
Future<String> chooseInterestedGenres(String username, String gName) async {
  final queryParams = {
    'choose_interested_genres':"1",
    'username': username,
    'genre_name': gName,
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return "OK";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to choose genre.');
  }
}

//Not sure how this works either. I tried to return true if it's a successful log in,
//if not throw exception.
Future<bool> checkPassword(String username, String password) async {
  final queryParams = {
    'check_password':"1",
    'username': username,
    'password': password
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      bool isAccepted = json.decode(response.body);
      return isAccepted;
    }
    catch(e){
      throw Exception('Failed to log in.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to log in.');
  }
}

//This query does not return anything. So I made it return the review it created as an object.
//I gave every review a default creationDate and RID, no need for another query.
Future<Review> creatingReview(double rating, String comment, String username, int mid) async {
  final queryParams = {
    'creating_a_review':"1",
    'rating': rating,
    'comment': comment,
    'username': username,
    'MID': mid,
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      Review review = Review(RID: 0, rating: rating, comment: comment, date: DateTime.now(), username: username, MID: mid);
      return review;
    }
    catch(e){
      throw Exception('Failed to create a review.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to create a review.');
  }
}

//This query does not return anything. So I made it return the watchlist it created as an object.
//I gave every watchlist a default creationDate and LID, no need for another query.
//This might cause problems when we want insert to a movie and we get LID from front-end object list.
Future<Watchlist> creatingWatchlist(String name, String username) async {
  final queryParams = {
    'creating_a_watchlist':"1",
    'name': name,
    'username': username,
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try{
      Watchlist watchlist = Watchlist(LID: 0, name: name, creationDate: DateTime.now(), username: username);
      return watchlist;
    }
    catch(e){
      throw Exception('Failed to create a watchlist.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to create a watchlist.');
  }
}

//Query does not return anything, so I made it void.
Future<String> addMovieToList(int mid, int lid) async {
  final queryParams = {
    'add_movie_to_list':"1",
    'MID': mid,
    'LID': lid,
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return "OK";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add movie to the list.');
  }
}
////////////////////////////////COMPLEX QUERIES/////////////////////////////////
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
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<PairData>> numMoviesByLikedGenre(String username) async {
  final queryParams = {
    'num_movies_by_liked_genre':"1",
    'username': username,
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
      List<PairData> genreNumPairs = List<PairData>.from(l.map((model)=> PairData.fromJson(model)));
      return genreNumPairs;
    }
    catch(e){
      throw Exception('Failed to show genres.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to show genres.');
  }
}

//Query does not return anything, so I made it void.
Future<String> updatingVoteAvg(int mid) async {
  final queryParams = {
    'updating_vote_avg':"1",
    'MID': mid,
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return "OK";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }
}