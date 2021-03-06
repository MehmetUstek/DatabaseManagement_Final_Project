import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dbQueries.dart';
import 'objects/Movie.dart';
import 'objects/Triplet.dart';
import 'OtherProfilePage.dart';
import 'objects/User.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage(
      {Key? key, required this.currentUser, required this.following})
      : super(key: key);
  final List<User> following;
  final User currentUser;

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  var containerColor = Colors.black87;
  late List<User> following;
  late User currentUser;

  @override
  void initState() {
    super.initState();
    following = widget.following;
    currentUser = widget.currentUser;
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
                  padding: EdgeInsets.only(left: 30, bottom: 30),
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
                Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      addAutomaticKeepAlives: false,
                      cacheExtent: 100,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: following.length,
                      itemBuilder: (BuildContext context, int index) {
                        User follower = following[index];
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
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
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Column(children: [
                                          Icon(
                                            CupertinoIcons.profile_circled,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                        ]),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0),
                                                child: Text(
                                                  follower.fname +
                                                      " " +
                                                      follower.lname,
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  )),
                                                ),
                                              ),
                                            ]),
                                            Row(children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0),
                                                child: Text(
                                                  '@' + follower.username,
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                            onPressed: () async {
                              bool userFollowed = await checkIfUserFollowed(currentUser.username, follower.username);
                              List<User> followersList = await showFollowersOfUser(currentUser.username);
                              List<User> followingList  = await showFollowingsOfUser(currentUser.username);
                              List<Movie> commonMovies = await showCommonMoviesOfTwoUsers(currentUser.username, follower.username);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OtherProfilePage(otherUser:follower, currentUser: currentUser, isuserFollowed: userFollowed,followingList: followingList, followersList: followersList, commonMovies: commonMovies, )));
                            },
                          );
                      }
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
