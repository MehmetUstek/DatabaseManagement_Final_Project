import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'objects/Movie.dart';
import 'MoviesPage.dart';
import 'SearchPage.dart';
import 'dbQueries.dart';

class MovieDetailsPage extends StatefulWidget {

  const MovieDetailsPage(
      {Key? key,
        required this.movie,
        required this.genres,})
      : super(key: key);
  final Movie movie;
  final List<String> genres;
  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  var containerColor = Colors.black87;

  late String movieTitle;
  late String movieYear;
  late double voteAvg;
  late int voteCount;
  late int duration;
  late String genreNames;
  //late String actorNames;

  bool isAdded = false;
  String addLabel = "ADD TO WATCHLIST";
  String addedLabel = "ADDED TO WATCHLIST";
  String addHolder = "ADD TO WATCHLIST";
  var addTextColor = Colors.black87;
  var addBoxColor = Colors.white;

  @override
  void initState() {
    super.initState();
    addLabel = "ADD TO WATCHLIST";
    addedLabel = "ADDED TO WATCHLIST";
    addHolder = addLabel;
    isAdded = false;
    addTextColor = Colors.black87;
    addBoxColor = Colors.white;

    movieTitle = widget.movie.title;
    movieYear = widget.movie.releaseDate;
    voteAvg = widget.movie.voteAvg;
    voteCount = widget.movie.voteCount;
    duration = widget.movie.duration;
    genreNames = widget.genres[0];
    //actorNames = widget.actors[0];
    for( var i = 1 ; i < widget.genres.length; i++ ){
      genreNames += ", " + widget.genres[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.white,
          // margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: CircleBorder(),
                          primary: Colors.white,
                        ),
                        child: Icon(
                          CupertinoIcons.arrowtriangle_left_circle,
                          size: 30,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Image.asset('images/logo.png', width: 180),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Profile Name, username etc. here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          side: BorderSide(
                              width: 2.0,
                              color: Colors.black,
                              style: BorderStyle.solid),
                        ),
                        fixedSize: Size(220, 30),
                        primary: addBoxColor,
                      ),
                      child: Text(
                        addHolder,
                        style: TextStyle(fontSize: 15, color: addTextColor),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isAdded) {
                            isAdded = false;
                            addHolder = addLabel;
                            addBoxColor = Colors.white;
                            addTextColor = Colors.black87;
                          } else {
                            isAdded = true;
                            addHolder = addedLabel;
                            addBoxColor = Colors.black87;
                            addTextColor = Colors.white;
                          }
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Center(
                      child: Text(
                        movieTitle,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        movieYear,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 60,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              voteAvg.toString(),
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'out of ${voteCount}',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Duration
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${duration} minutes',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 30)),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Genres",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          // SQL: Limit 5
                          child: Text(
                            genreNames,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                      children: [
                        Text(
                          "Cast",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          // SQL: Limit 5
                          child: Text(
                            "Kerem Girenes, Mehmet Üstek, Büşra Işık, Atahan Tap, Emirhan Erel",
                            maxLines: 4,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                      children: [
                        Text(
                          "Reviews",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    // Review Box Neomorphic
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.grey.shade50,
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 0.0,
                                blurRadius: 3.0,
                                offset: Offset(3.0, 3.0)),
                            BoxShadow(
                                color: Colors.grey.shade400,
                                spreadRadius: 0.0,
                                blurRadius: 3.0 / 2.0,
                                offset: Offset(3.0, 3.0)),
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2.0,
                                blurRadius: 3.0,
                                offset: Offset(-3.0, -3.0)),
                            BoxShadow(
                                color: Colors.white,
                                spreadRadius: 2.0,
                                blurRadius: 3.0 / 2,
                                offset: Offset(-3.0, -3.0)),
                          ],
                        ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
