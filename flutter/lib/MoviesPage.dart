import 'package:database_management_project/MovieDetailsPage.dart';
import 'package:database_management_project/dbQueries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SearchPage.dart';
import 'objects/Movie.dart';
import 'objects/User.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage(
      {Key? key,
      required this.searchType,
      this.movies,
      required this.isGenreVisible, required this.username})
      : super(key: key);
  final List<Movie>? movies;
  final String searchType;
  final bool isGenreVisible;
  final String username;

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviesPage> {
  var containerColor = Colors.black87;
  late List<Movie> movies;
  late String searchType;
  late bool isGenreVisible;

  @override
  void initState() {
    super.initState();
    movies = widget.movies!;
    searchType = widget.searchType;
    isGenreVisible = widget.isGenreVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(searchType,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ))),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 5, right: 5),
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        cacheExtent: 100,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Movie movie = movies[index];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                side: BorderSide(
                    width: 1.0, color: Colors.white, style: BorderStyle.solid),
              ),
              elevation: 10.0,
              fixedSize: const Size(350, 150),
              primary: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Rating: " +
                                  movie.voteAvg.toString() +
                                  "  (" +
                                  movie.voteCount.toString() +
                                  ")",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            movie.releaseDate,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                        Visibility(
                          visible: isGenreVisible,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              movie.genreName.toString(),
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            movie.duration.toString() + " mins",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      ]),
              ),
            ),
            onPressed: () async {
              var genres = await findingGenresOfMovie(movie.MID);
              var actors = await showingActorsInMovie(movie.MID);
              var isAdded = await checkMovieInList(widget.username, movie.MID, 1);
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage(movie: movie, genres: genres, actors: actors, username: widget.username, isAdded: isAdded,)));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: movies.length,
      ),
    );
  }
}
