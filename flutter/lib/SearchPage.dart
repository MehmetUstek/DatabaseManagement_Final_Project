import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var containerColor = Colors.black87;
  final TextEditingController emailController = TextEditingController();
  var selectedColor = Color(0xffDEDEDE);
  var unselectedColor = Color(0xffBDBDBD);
  var selectedTextColor = Colors.black;
  var unselectedTextColor = Colors.white;
  var movieColor;
  var genreColor;
  var actorColor;
  var userColor;
  var movieTextColor;
  var genreTextColor;
  var actorTextColor;
  var userTextColor;

  @override
  void initState() {
    super.initState();
    movieColor = unselectedColor;
    genreColor = selectedColor;
    actorColor = unselectedColor;
    userColor = unselectedColor;

    movieTextColor = unselectedTextColor;
    genreTextColor = selectedTextColor;
    actorTextColor = unselectedTextColor;
    userTextColor = unselectedTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset(
                    'images/logo.png',
                    width: 250,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 6 / 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  // color: Colors.white,
                ),
                child: TextFormField(
                  autocorrect: false,
                  enableSuggestions: false,
                  cursorColor: Colors.black,
                  textAlign: TextAlign.start,
                  controller: emailController,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(CupertinoIcons.search,
                          size: 30, color: Color(0xffBDBDBD)),
                      onPressed: () {},
                    ),
                    labelText: 'Search',
                    labelStyle: TextStyle(
                        color: Color(0xffBDBDBD),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffBDBDBD), width: 4)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffBDBDBD), width: 4)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffBDBDBD), width: 4)),
                    disabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffBDBDBD), width: 4)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Color(0xffBDBDBD),
                            style: BorderStyle.solid),
                      ),
                      primary: movieColor,
                    ),
                    onPressed: () {
                      setState(() {
                        actorColor = unselectedColor;
                        actorTextColor = unselectedTextColor;
                        genreColor = unselectedColor;
                        genreTextColor = unselectedTextColor;
                        movieColor = selectedColor;
                        movieTextColor = selectedTextColor;
                        userColor = unselectedColor;
                        userTextColor = unselectedTextColor;
                      });
                    },
                    child: Text(
                      'Movie',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: movieTextColor,
                        fontSize: 18,
                      )),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Color(0xffBDBDBD),
                            style: BorderStyle.solid),
                      ),
                      primary: genreColor,
                    ),
                    onPressed: () {
                      setState(() {
                        actorColor = unselectedColor;
                        actorTextColor = unselectedTextColor;
                        genreColor = selectedColor;
                        genreTextColor = selectedTextColor;
                        movieColor = unselectedColor;
                        movieTextColor = unselectedTextColor;
                        userColor = unselectedColor;
                        userTextColor = unselectedTextColor;
                      });
                    },
                    child: Text(
                      'Genre',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: genreTextColor,
                        fontSize: 18,
                      )),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Color(0xffBDBDBD),
                            style: BorderStyle.solid),
                      ),
                      primary: actorColor,
                    ),
                    onPressed: () {
                      setState(() {
                        actorColor = selectedColor;
                        actorTextColor = selectedTextColor;
                        genreColor = unselectedColor;
                        genreTextColor = unselectedTextColor;
                        movieColor = unselectedColor;
                        movieTextColor = unselectedTextColor;
                        userColor = unselectedColor;
                        userTextColor = unselectedTextColor;
                      });
                    },
                    child: Text(
                      'Actor',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: actorTextColor,
                        fontSize: 18,
                      )),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            color: Color(0xffBDBDBD),
                            style: BorderStyle.solid),
                      ),
                      primary: userColor,
                    ),
                    onPressed: () {
                      setState(() {
                        actorColor = unselectedColor;
                        actorTextColor = unselectedTextColor;
                        genreColor = unselectedColor;
                        genreTextColor = unselectedTextColor;
                        movieColor = unselectedColor;
                        movieTextColor = unselectedTextColor;
                        userColor = selectedColor;
                        userTextColor = selectedTextColor;
                      });
                    },
                    child: Text(
                      'User',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: userTextColor,
                        fontSize: 18,
                      )),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 200, bottom: 10),
                  child: IconButton(
                      onPressed: () {Navigator.pop(context);},
                      icon: Icon(
                        CupertinoIcons.xmark_circle,
                        size: 70,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
