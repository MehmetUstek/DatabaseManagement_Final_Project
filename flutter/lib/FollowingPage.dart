import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FollowersPage extends StatefulWidget {
  @override
  _FollowersPageState createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(CupertinoIcons.arrow_left_circle_fill),
                          iconSize: 36)),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset('images/logo.png', width: 180),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom:30),
                child: Row(children: <Widget>[
                  Text(
                    'Following',
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
                  elevation: 20.0,
                  fixedSize: const Size(350, 100),
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Kerem Girenes',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    '3',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '@username',
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
                                'watchlists',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ]),

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
