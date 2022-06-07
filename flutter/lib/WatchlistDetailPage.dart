import 'package:database_management_project/OtherProfilePage.dart';
import 'package:database_management_project/objects/Watchlist.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'MoviesPage.dart';
import 'dbQueries.dart';
import 'objects/Movie.dart';

class WatchlistDetailPage extends StatefulWidget {
  const WatchlistDetailPage(
      {Key? key,
        required this.movieList,
        required this.listTitle,})
      : super(key: key);
  final List<Movie> movieList;
  final String listTitle;

  @override
  _WatchlistDetailPageState createState() => _WatchlistDetailPageState();
}

class _WatchlistDetailPageState extends State<WatchlistDetailPage> {
  var containerColor = Colors.black87;
  late List<Movie> movieList;
  var isGenreVisible = true;
  var listTitle;

  @override
  void initState() {
    super.initState();
    movieList = widget.movieList;
    listTitle = widget.listTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 20),
                  child: Row(children: <Widget>[
                    Text(
                      listTitle,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      )),
                    ),
                  ]),
                ),

                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Movie movie = movieList[index];
                      return
                        ElevatedButton(
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
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Align(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 0),
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
                          onPressed: () async {},
                        );
                    }, separatorBuilder: (BuildContext context, int index) => const Divider(), itemCount: movieList.length,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
