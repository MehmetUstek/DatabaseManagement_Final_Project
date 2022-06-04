import 'package:database_management_project/registerPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'FollowersPage.dart';
import 'FollowingPage.dart';
import 'MovieDetailsPage.dart';
import 'MoviesPage.dart';
import 'OtherProfilePage.dart';
import 'SearchPage.dart';
import 'WatchlistListPage.dart';
import 'dbQueries.dart';
import 'objects/User.dart';
import 'objects/PairData.dart';
import 'objects/Triplet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {Key? key,
        required this.currentUser,
        required this.followersList,
        required this.followingList,
        required this.genreInterestsList})
      : super(key: key);
  final User currentUser;
  final List<Triplet> followersList;
  final List<Triplet> followingList;
  final List<PairData> genreInterestsList;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var containerColor = Colors.black87;
  late String username;
  late String name;
  late int followers;
  late int following;
  late String genreInterests;

  @override
  void initState() {
    super.initState();

    username = widget.currentUser.username;
    name = widget.currentUser.fname + " " + widget.currentUser.lname;
    followers = widget.followersList.length;
    following = widget.followingList.length;

    if (!widget.genreInterestsList.isEmpty) {
      genreInterests = widget.genreInterestsList[0].gname + " (" +
          widget.genreInterestsList[0].count.toString() + ") ";
      for (var i = 1; i < widget.genreInterestsList.length; i++) {
        genreInterests += ", " + widget.genreInterestsList[i].gname + " (" +
            widget.genreInterestsList[i].count.toString() + ") ";
      }
    } else {
      genreInterests = "";
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
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Profile Name, username etc. here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0)
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'YOUR PROFILE',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Center(
                      child: Text(
                        name,
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
                        '@' + username,
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
                const Padding(padding: EdgeInsets.only(top: 50)),

                // Follower and Following
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowersPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(),
                          primary: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$followers',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'followers',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FollowingPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(),
                          primary: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$following',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              'following',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            side: BorderSide(
                                width: 5.0,
                                color: Colors.black,
                                style: BorderStyle.solid),
                          ),
                          fixedSize: const Size(160, 140),
                          primary: Colors.white,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.person_2_square_stack,
                                size: 50,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Watchlists',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  )),
                                ),
                              ),
                            ]),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WatchlistListPage()));
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            side: BorderSide(
                                width: 5.0,
                                color: Colors.black,
                                style: BorderStyle.solid),
                          ),
                          fixedSize: const Size(160, 140),
                          primary: Colors.black,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                CupertinoIcons.bubble_left_fill,
                                size: 50,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Reviews',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                                ),
                              ),
                            ]),
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage()));
                        },
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Genre Interests",
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
                        genreInterests,
                        textAlign: TextAlign.center,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
