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

class ReviewAddPage extends StatefulWidget {
  const ReviewAddPage({
    Key? key,
    required this.username,
    required this.MID,
  }) : super(key: key);
  final String username;
  final int MID;

  @override
  _ReviewAddPageState createState() => _ReviewAddPageState();
}

class _ReviewAddPageState extends State<ReviewAddPage> {
  final TextEditingController reviewController = TextEditingController();
  var containerColor = Colors.black87;
  late String username;
  late int MID;
  int rating = 0;

  Color starFilled = Colors.black87;
  Color starEmpty = Colors.black38;

  Color star1color = Colors.black38;
  Color star2color = Colors.black38;
  Color star3color = Colors.black38;
  Color star4color = Colors.black38;
  Color star5color = Colors.black38;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    MID = widget.MID;
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
                      'Leave a Review!',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      )),
                    ),
                  ]),
                ),
                Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width * 6 / 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.black26,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        height: 200,
                        child: TextField(
                          cursorColor: Colors.black,
                          controller: reviewController,
                          onEditingComplete: () {},
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rating',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      )),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: star1color,
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: CircleBorder(),
                        primary: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 1;
                          star1color = starFilled;
                          star2color = starEmpty;
                          star3color = starEmpty;
                          star4color = starEmpty;
                          star5color = starEmpty;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: star2color,
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: CircleBorder(),
                        primary: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 2;
                          star1color = starFilled;
                          star2color = starFilled;
                          star3color = starEmpty;
                          star4color = starEmpty;
                          star5color = starEmpty;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: star3color,
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: CircleBorder(),
                        primary: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 3;
                          star1color = starFilled;
                          star2color = starFilled;
                          star3color = starFilled;
                          star4color = starEmpty;
                          star5color = starEmpty;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: star4color,
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: CircleBorder(),
                        primary: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 4;
                          star1color = starFilled;
                          star2color = starFilled;
                          star3color = starFilled;
                          star4color = starFilled;
                          star5color = starEmpty;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: Icon(
                        CupertinoIcons.star_fill,
                        color: star5color,
                        size: 35,
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: CircleBorder(),
                        primary: Colors.transparent,
                      ),
                      onPressed: () {
                        setState(() {
                          rating = 5;
                          star1color = starFilled;
                          star2color = starFilled;
                          star3color = starFilled;
                          star4color = starFilled;
                          star5color = starFilled;
                        });
                      },
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 50)),
                ElevatedButton(
                  child: Icon(
                    CupertinoIcons.checkmark_circle,
                    color: starFilled,
                    size: 70,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: CircleBorder(),
                    primary: Colors.transparent,
                  ),
                  onPressed: () async {
                    await creatingReview(
                        rating*2, reviewController.text, username, MID);

                    await updatingVoteAvg(MID);

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
