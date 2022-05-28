import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SearchPage.dart';
import 'objects/Movie.dart';
import 'objects/User.dart';

class UsersSearchPage extends StatefulWidget {
  const UsersSearchPage(
      {Key? key,
      required this.searchType,
      this.users})
      : super(key: key);
  final List<User>? users;
  final String searchType;

  @override
  _UsersSearchPageState createState() => _UsersSearchPageState();
}

class _UsersSearchPageState extends State<UsersSearchPage> {
  var containerColor = Colors.black87;
  late String searchType;
  late List<User> users;

  @override
  void initState() {
    super.initState();
    searchType = widget.searchType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(searchType,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ))),
      body: ListView.separated(
        padding: const EdgeInsets.only(left: 5, right: 5),
        scrollDirection: Axis.vertical,
        addAutomaticKeepAlives: false,
        cacheExtent: 100,
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return ElevatedButton(
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
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            user.username,
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
                            user.fname + " " + user.lname,
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
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: users.length,
      ),
    );
  }
}
