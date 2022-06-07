import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'FollowersPage.dart';
import 'FollowingPage.dart';
import 'MoviesPage.dart';
import 'ReviewsFullNamePage.dart';
import 'ReviewsMovieTitlePage.dart';
import 'SearchPage.dart';
import 'WatchlistListPage.dart';
import 'dbQueries.dart';
import 'objects/Movie.dart';
import 'objects/User.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({
    Key? key,
    required this.otherUser,
    required this.currentUser,
    required this.isuserFollowed,
    required this.followersList,
    required this.followingList,
    required this.commonMovies,
  }) : super(key: key);
  final User currentUser;
  final User otherUser;
  final bool isuserFollowed;
  final List<User> followersList;
  final List<User> followingList;
  final List<Movie> commonMovies;

  @override
  _OtherProfilePageState createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {
  var containerColor = Colors.black87;
  late User otherUser;
  late User currentUser;

  late bool isFollowed;
  late int followers;
  late int following;
  late bool isPro;
  late List<Movie> commonMovies;

  String followLabel = "FOLLOW";
  String followedLabel = "FOLLOWED";
  String followHolder = "FOLLOW";
  var followTextColor = Colors.black87;
  var followBoxColor = Colors.white;

  String proUserText = "PRO USER";
  String freeUserText = "FREE USER";
  String userTextHolder = "PRO USER";

  var proUserBoxColor = Color(0xffffbd1b);
  var freeUserBoxColor = Colors.black26;
  var userBoxColor = Color(0xffffbd1b);
  String commonMoviesHolder = "No common movies with this user";

  @override
  void initState() {
    super.initState();
    otherUser = widget.otherUser;
    currentUser = widget.currentUser;
    isFollowed = widget.isuserFollowed;
    commonMovies = widget.commonMovies;

    if (!commonMovies.isEmpty) {
      commonMoviesHolder = "";
      for (Movie movie in commonMovies) {
        commonMoviesHolder += movie.title + ", ";
      }
      commonMoviesHolder =
          commonMoviesHolder.substring(0, commonMoviesHolder.length - 2);
    }
    if (isFollowed) {
      followHolder = followedLabel;
      followBoxColor = Colors.black87;
      followTextColor = Colors.white;
    } else {
      followHolder = followLabel;
      followBoxColor = Colors.white;
      followTextColor = Colors.black87;
    }

    followers = widget.followersList.length;
    following = widget.followingList.length;

    followLabel = "FOLLOW";
    followedLabel = "FOLLOWED";

    isPro = otherUser.isPremium;
    proUserText = "PRO USER";
    freeUserText = "FREE USER";

    proUserBoxColor = Color(0xffffbd1b);
    freeUserBoxColor = Colors.black26;

    if (isPro) {
      userTextHolder = proUserText;
      userBoxColor = proUserBoxColor;
    } else {
      userTextHolder = freeUserText;
      userBoxColor = freeUserBoxColor;
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
              // crossAxisAlignment: CrossAxisAlignment.center,

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
                        fixedSize: Size(150, 30),
                        primary: followBoxColor,
                      ),
                      child: Text(
                        followHolder,
                        style: TextStyle(fontSize: 15, color: followTextColor),
                      ),
                      onPressed: () {
                        setState(() {
                          if (isFollowed) {
                            isFollowed = false;
                            followHolder = followLabel;
                            followBoxColor = Colors.white;
                            followTextColor = Colors.black87;
                            unfollowUser(
                                currentUser.username, otherUser.username);
                          } else {
                            isFollowed = true;
                            followHolder = followedLabel;
                            followBoxColor = Colors.black87;
                            followTextColor = Colors.white;
                            followUser(
                                currentUser.username, otherUser.username);
                          }
                        });
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Center(
                      child: Text(
                        otherUser.fname + " " + otherUser.lname,
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
                        "@" + otherUser.username,
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
                const Padding(padding: EdgeInsets.only(top: 10)),

                // FREE- PRO USER
                Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: userBoxColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Center(
                    child: Text(
                      userTextHolder,
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

                // Follower and Following
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FollowersPage(
                                        followers: widget.followersList,
                                        currentUser: currentUser,
                                      )));
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
                              followers.toString(),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FollowingPage(
                                        following: widget.followingList,
                                        currentUser: currentUser,
                                      )));
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
                              following.toString(),
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

                Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
                    onPressed: () async {
                      var watchlist =
                          await showWatchlistOfUser(widget.otherUser.username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WatchlistListPage(
                                    watchlistList: watchlist,
                                  )));
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
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
                    onPressed: () async {
                      var reviewList =
                          await showReviewsOfUser(widget.otherUser.username);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReviewsMovieTitlePage(
                                    reviewList: reviewList,
                                  )));
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
                        "Action, Adventure, Medieval, Fantasy",
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
                const Padding(padding: EdgeInsets.only(top: 30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Common Movies",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      commonMoviesHolder,
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
