import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviesPage> {
  var containerColor = Colors.black87;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 0),
              //   child: FittedBox(
              //     fit: BoxFit.fitWidth,
              //     child: Image.asset(
              //       'images/logo.png',
              //       width: 250,
              //     ),
              //   ),
              // ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Row(children: <Widget>[
                  Text(
                    'Movies',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                    )),
                  ),
                ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    side: BorderSide(
                        width: 1.0,
                        color: Colors.white,
                        style: BorderStyle.solid),
                  ),
                  elevation: 10.0,

                  fixedSize: const Size(350, 150),
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    child:
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.only(right:20),
                          child:
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Rating: 9 (31)',
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
                              'Movie Title',
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
                              '2009',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'Action, Fantasy',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              '150 mins',
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
                onPressed: () {},
              ),
              Padding(
                  padding: EdgeInsets.only(top: 200, bottom: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.xmark_circle,
                        size: 70,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
