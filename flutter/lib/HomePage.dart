import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          // color: Colors.white,
          // margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Image.asset(
                    'images/logo.png',
                    width: 250,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Padding(padding: EdgeInsets.only(left:30),
              child:
              Row(
                children: <Widget> [
              Text(
                'Welcome, Kerem!',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    )),
              ),
        ]
              ),
              ),

              Padding(padding: EdgeInsets.only(top: 40.0)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          side: BorderSide(
                              width: 5.0,
                              color: Colors.black,
                              style: BorderStyle.solid),
                        ),
                        fixedSize: const Size(175, 175),
                        primary: Colors.white,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.search,
                              size: 70,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Browse',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                )),
                              ),
                            ),
                          ]),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                      },
                    ),
                    Padding(padding: EdgeInsets.only(left:20),),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          side: BorderSide(
                              width: 5.0,
                              color: Colors.black,
                              style: BorderStyle.solid),
                        ),
                        fixedSize: const Size(175, 175),
                        primary: Colors.black,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.profile_circled,
                              size: 70,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Profile',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                )),
                              ),
                            ),
                          ]),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                      },
                    ),

                  ]),
              Padding(padding:EdgeInsets.only(top:50),child:
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    side: BorderSide(
                        width: 2.0,
                        color: Colors.black,
                        style: BorderStyle.solid),
                  ),
                  fixedSize:
                  Size(MediaQuery.of(context).size.width * 3/7, 52),
                  primary: Colors.white,
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                onPressed: () {
                },
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
