import 'dart:convert';
import 'dart:io';

import 'package:database_management_project/objects/PairData.dart';
import 'package:http/http.dart' as http;

import 'objects/Movie.dart';
import 'objects/PairChart.dart';
import 'objects/ReviewMovieTitle.dart';
import 'objects/User.dart';
import 'objects/ReviewFullName.dart';
import 'objects/Watchlist.dart';
import 'objects/PairData.dart';

var localIP = "10.0.2.2";

Future<List<Movie>> searchMovieByMovieName(String title) async {
  final queryParams = {'title': title, 'search_by_movie_name': "1"};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
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
    'search_by_movie_and_genre': "1",
    'title': title,
    'gName': genre
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<Movie>> searchByOnlyGenre(String genre) async {
  final queryParams = {'search_by_only_genre': "1", 'gName': genre};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<Movie>> searchByActor(String name) async {
  final queryParams = {'search_by_actor': "1", 'fullName': name};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);

      //List:
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // Singular:
      // Movie movie = Movie.fromJson(jsonDecode(response.body));

      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}

Future<List<User>> searchByUsername(String username) async {
  final queryParams = {'search_by_username': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<User> users =
          List<User>.from(l.map((model) => User.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return users;
    } catch (e) {
      throw Exception('Failed to load users.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load users.');
  }
}

Future<User> showProfilePage(String username) async {
  final queryParams = {'show_profile_page': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      var info = jsonDecode(response.body)[0];
      User user = User.fromJson(info);
      return user;
    } catch (e) {
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
Future<List<User>> showFollowingsOfUser(String username) async {
  final queryParams = {'show_followings_of_user': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<User> usernamesAndNames =
          List<User>.from(l.map((model) => User.fromJson(model)));
      return usernamesAndNames;
    } catch (e) {
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
Future<List<User>> showFollowersOfUser(String username) async {
  final queryParams = {'show_followers_of_user': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<User> usernamesAndNames =
          List<User>.from(l.map((model) => User.fromJson(model)));
      return usernamesAndNames;
    } catch (e) {
      throw Exception('Failed to load usernames.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load usernames.');
  }
}

Future<List<Watchlist>> showWatchlistOfUser(String username) async {
  final queryParams = {'show_watchlist_of_user': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Watchlist> wl =
          List<Watchlist>.from(l.map((model) => Watchlist.fromJson(model)));
      return wl;
    } catch (e) {
      throw Exception('Failed to load the watchlist.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load the watchlist.');
  }
}

Future<List<ReviewMovieTitle>> showReviewsOfUser(String username) async {
  final queryParams = {'show_reviews_of_user': "1", 'username': username};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<ReviewMovieTitle> reviews = List<ReviewMovieTitle>.from(
          l.map((model) => ReviewMovieTitle.fromJson(model)));
      return reviews;
    } catch (e) {
      print(e);
      throw Exception('Failed to load reviews.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load reviews.');
  }
}

Future<List<PairChart>> percentagesOfGenres(int LID) async {
  final queryParams = {'pie_chart_percentages': "1", 'LID': LID.toString()};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<PairChart> reviews =
          List<PairChart>.from(l.map((model) => PairChart.fromJson(model)));
      return reviews;
    } catch (e) {
      print(e);
      throw Exception('Failed to load reviews.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load reviews.');
  }
}

Future<List<String>> showingActorsInMovie(int mid) async {
  final queryParams = {'showing_actors_in_movie': "1", 'MID': mid.toString()};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<String> aNames = List<String>.from(l.map((e) => e['fullName']));
      return aNames;
    } catch (e) {
      throw Exception('Failed to load actors.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load actors.');
  }
}

Future<List<String>> findingGenresOfMovie(int mid) async {
  final queryParams = {'finding_genres_of_movie': "1", 'MID': mid.toString()};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<String> gNames = List<String>.from(l.map((e) => e['gname']));
      return gNames;
    } catch (e) {
      throw Exception('Failed to load genres.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load genres.');
  }
}

Future<List<ReviewFullName>> showReviewsOfMovie(int mid) async {
  final queryParams = {'show_reviews_of_movie': "1", 'MID': mid.toString()};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<ReviewFullName> reviews = List<ReviewFullName>.from(
          l.map((model) => ReviewFullName.fromJson(model)));
      return reviews;
    } catch (e) {
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
Future<String> registerUser(
  String username,
  String email,
  String password,
  String fname,
  String lname,
  String gender,
  String paymentMethod,
  int isPremium,
) async {
  final queryParams = {
    'register_user': "1",
    'username': username,
    'email': email,
    'password': password,
    'fname': fname,
    'lname': lname,
    'gender': gender,
    'payment_method': paymentMethod,
    'isPremium': isPremium.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return response.body;
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
    'choose_interested_genres': "1",
    'username': username,
    'genre_name': gName,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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
    'check_password': "1",
    'username': username,
    'password': password
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      bool isAccepted = json.decode(response.body);
      return isAccepted;
    } catch (e) {
      throw Exception('Failed to log in.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to log in.');
  }
}

//This query does not return anything.
Future<String> creatingReview(
    int rating, String comment, String username, int mid) async {
  final queryParams = {
    'creating_a_review': "1",
    'rating': rating.toString(),
    'comment': comment,
    'username': username,
    'MID': mid.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      return "ok";
    } catch (e) {
      throw Exception('Failed to create a review.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to create a review.');
  }
}

//This query does not return anything.
Future<String> creatingWatchlist(String name, String username) async {
  final queryParams = {
    'creating_a_watchlist': "1",
    'name': name,
    'username': username,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      return "ok";
    } catch (e) {
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
    'add_movie_to_list': "1",
    'MID': mid.toString(),
    'LID': lid.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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

Future<String> followUser(String follower, String following) async {
  final queryParams = {
    'follow_user': "1",
    'follower': follower,
    'following': following,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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

Future<String> unfollowUser(String follower, String following) async {
  final queryParams = {
    'unfollow_user': "1",
    'follower': follower,
    'following': following,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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

Future<String> deleteMovieFromList(int mid, int lid) async {
  final queryParams = {
    'delete_movie_from_list': "1",
    'MID': mid.toString(),
    'LID': lid.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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

Future<bool> checkMovieInList(String username, int mid, int lid) async {
  final queryParams = {
    'check_movie_in_list': "1",
    'username': username,
    'MID': mid.toString(),
    'LID': lid.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body) == "1";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to check if movie in list.');
  }
}

Future<bool> checkIfUserFollowed(String username, String otherUsername) async {
  final queryParams = {
    'check_is_user_followed': "1",
    'username': username,
    'otherUsername': otherUsername,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body) == "1";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to add movie to the list.');
  }
}

Future<List<Movie>> showMoviesOfWatchlist(int lid) async {
  final queryParams = {
    'show_movies_in_list':"1",
    'LID': lid.toString()
  };
  final response = await http
      .post(Uri.parse('http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'), headers: {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
  }, body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies = List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      return movies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}


////////////////////////////////COMPLEX QUERIES/////////////////////////////////
Future<List<Movie>> showTopRatedMoviesPerGenre() async {
  final queryParams = {'show_top_rated_movies_per_genre': "1"};
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
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
    'num_movies_by_liked_genre': "1",
    'username': username,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<PairData> genreNumPairs =
          List<PairData>.from(l.map((model) => PairData.fromJson(model)));
      return genreNumPairs;
    } catch (e) {
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
    'updating_vote_avg': "1",
    'MID': mid.toString(),
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
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

Future<List<Movie>> showCommonMoviesOfTwoUsers(
    String username_1, String username_2) async {
  final queryParams = {
    'find_common_movies': "1",
    'username_1': username_1,
    'username_2': username_2,
  };
  final response = await http.post(
      Uri.parse(
          'http://$localIP:80/DatabaseManagement_Final_Project/php_backend/result.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
      },
      body: queryParams);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    try {
      Iterable l = json.decode(response.body);
      List<Movie> movies =
          List<Movie>.from(l.map((model) => Movie.fromJson(model)));
      // print(List<Movie>.from(l.map((model) => model)));
      return movies;
    } catch (e) {
      throw Exception('Failed to load movies.');
    }
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load movies.');
  }
}
