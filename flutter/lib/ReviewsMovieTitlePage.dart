import 'package:database_management_project/OtherProfilePage.dart';
import 'package:database_management_project/objects/ReviewFullName.dart';
import 'package:database_management_project/objects/Watchlist.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'MoviesPage.dart';
import 'objects/ReviewMovieTitle.dart';

class ReviewsMovieTitlePage extends StatefulWidget {
  const ReviewsMovieTitlePage(
      {Key? key,
        required this.reviewList,})
      : super(key: key);
  final List<ReviewMovieTitle> reviewList;
  @override
  _ReviewsMovieTitlePageState createState() => _ReviewsMovieTitlePageState();
}

class _ReviewsMovieTitlePageState extends State<ReviewsMovieTitlePage> {
  var containerColor = Colors.black87;
  late List<ReviewMovieTitle> reviewList;

  @override
  void initState() {
    super.initState();
    reviewList = widget.reviewList;
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
                      'Reviews',
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
                      ReviewMovieTitle review = reviewList[index];
                      return
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width - 50,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                CupertinoIcons.bubble_left,
                                                size: 45,
                                                color: Colors.grey.shade500,
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(left: 10)),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                review.movieName,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight.w600)),
                                              ),
                                              Text(
                                                review.date,
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.w500)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 8)),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:
                                            MediaQuery.of(context).size.width -
                                                90,
                                            child: Text(
                                              review.comment,
                                              maxLines: 2,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w300)),
                                            ),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5)),
                                          Text(
                                            "Rating:  " + review.rating.toInt().toString() + "/5",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
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
                        );
                    }, separatorBuilder: (BuildContext context, int index) => const Divider(), itemCount: reviewList.length,
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
