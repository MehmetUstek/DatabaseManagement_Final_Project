//import 'dart:ffi';

import 'dart:ffi';

import 'package:database_management_project/signIn.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'dbQueries.dart';

class RegisterPage extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool showValue = false;
  var containerColor = Colors.black87;
  String genderString = 'M';
  String paymentString = 'Free';
  int isPremium = 0;

  var selectedColor = Color(0xffDEDEDE);
  var unselectedColor = Color(0xffBDBDBD);
  var selectedTextColor = Colors.black;
  var unselectedTextColor = Colors.white;

  var maleColor;
  var femaleColor;
  var unspecifiedColor;
  var maleTextColor;
  var femaleTextColor;
  var unspecifiedTextColor;

  var freeColor;
  var cardColor;
  var cashColor;
  var freeTextColor;
  var cardTextColor;
  var cashTextColor;

  List<Color> genreColors = [];
  List<Color> genreTextColors = [];

  List<String> genres = [];
  List<String> selectedGenres = [];

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>-]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  @override
  void initState() {
    super.initState();
    maleColor = selectedColor;
    femaleColor = unselectedColor;
    unspecifiedColor = unselectedColor;

    maleTextColor = selectedTextColor;
    femaleTextColor = unselectedTextColor;
    unspecifiedTextColor = unselectedTextColor;

    freeColor = selectedColor;
    cardColor = unselectedColor;
    cashColor = unselectedColor;

    freeTextColor = selectedTextColor;
    cardTextColor = unselectedTextColor;
    cashTextColor = unselectedTextColor;

    genres = [
      'Adventure',
      'Fantasy',
      'Animation',
      'Drama',
      'Horror',
      'Action',
      'Comedy',
      'History',
      'Western',
      'Thriller',
      'Crime',
      'Documentary',
      'Science Fiction',
      'Mystery',
      'Music',
      'Romance',
      'Family',
      'War',
      'Foreign',
      'TV Movie'
    ];

    selectedGenres = [];

    for (int i = 0; i < genres.length; i++) {
      genreColors.add(unselectedColor);
      genreTextColors.add(unselectedTextColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          // color: Colors.white,
          // margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: ListView(
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
                    padding: EdgeInsets.only(left: 0, top: 0),
                    child: Text(
                      "Welcome, new user!",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      )),
                    )),

                const Padding(padding: EdgeInsets.only(top: 25)),

                // Email textfield.
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
                      color: Color(0xff575757),
                      decoration: TextDecoration.none,
                    ),
                    decoration: const InputDecoration(
                      labelText: 'E-Mail',
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
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Username textfield
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
                    controller: usernameController,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Color(0xff575757),
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
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
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Password textfield
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
                    controller: passwordController,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Color(0xff575757),
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                const Padding(padding: EdgeInsets.only(top: 20)),

                // First Name textfield
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
                    controller: firstNameController,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Color(0xff575757),
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      labelText: 'First Name',
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
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Last Name textfield
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
                    controller: lastNameController,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Color(0xff575757),
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Last Name',
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
                const Padding(padding: EdgeInsets.only(top: 30)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Gender:',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                                width: 1.0,
                                color: Color(0xffBDBDBD),
                                style: BorderStyle.solid)),
                        primary: maleColor,
                      ),
                      onPressed: () {
                        genderString = 'M';
                        setState(() {
                          maleColor = selectedColor;
                          femaleColor = unselectedColor;
                          unspecifiedColor = unselectedColor;

                          maleTextColor = selectedTextColor;
                          femaleTextColor = unselectedTextColor;
                          unspecifiedTextColor = unselectedTextColor;
                        });
                      },
                      child: Text(
                        'M',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: maleTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                                width: 1.0,
                                color: Color(0xffBDBDBD),
                                style: BorderStyle.solid)),
                        primary: femaleColor,
                      ),
                      onPressed: () {
                        genderString = 'F';
                        setState(() {
                          maleColor = unselectedColor;
                          femaleColor = selectedColor;
                          unspecifiedColor = unselectedColor;

                          maleTextColor = unselectedTextColor;
                          femaleTextColor = selectedTextColor;
                          unspecifiedTextColor = unselectedTextColor;
                        });
                      },
                      child: Text(
                        'F',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: femaleTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(
                            side: BorderSide(
                                width: 1.0,
                                color: Color(0xffBDBDBD),
                                style: BorderStyle.solid)),
                        primary: unspecifiedColor,
                      ),
                      onPressed: () {
                        genderString = 'U';
                        setState(() {
                          maleColor = unselectedColor;
                          femaleColor = unselectedColor;
                          unspecifiedColor = selectedColor;

                          maleTextColor = unselectedTextColor;
                          femaleTextColor = unselectedTextColor;
                          unspecifiedTextColor = selectedTextColor;
                        });
                      },
                      child: Text(
                        'U',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: unspecifiedTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Payment:',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            side: BorderSide(
                              width: 1.0,
                              color: Color(0xffBDBDBD),
                              style: BorderStyle.solid,
                            )),
                        primary: freeColor,
                      ),
                      onPressed: () {
                        isPremium = 0;
                        setState(() {
                          freeColor = selectedColor;
                          cardColor = unselectedColor;
                          cashColor = unselectedColor;

                          freeTextColor = selectedTextColor;
                          cardTextColor = unselectedTextColor;
                          cashTextColor = unselectedTextColor;
                        });
                      },
                      child: Text(
                        'Free',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: freeTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            side: BorderSide(
                                width: 1.0,
                                color: Color(0xffBDBDBD),
                                style: BorderStyle.solid)),
                        primary: cardColor,
                      ),
                      onPressed: () {
                        isPremium = 1;
                        setState(() {
                          freeColor = unselectedColor;
                          cardColor = selectedColor;
                          cashColor = unselectedColor;

                          freeTextColor = unselectedTextColor;
                          cardTextColor = selectedTextColor;
                          cashTextColor = unselectedTextColor;
                        });
                      },
                      child: Text(
                        'Card',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: cardTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            side: BorderSide(
                                width: 1.0,
                                color: Color(0xffBDBDBD),
                                style: BorderStyle.solid)),
                        primary: cashColor,
                      ),
                      onPressed: () {
                        isPremium = 1;
                        setState(() {
                          freeColor = unselectedColor;
                          cardColor = unselectedColor;
                          cashColor = selectedColor;

                          freeTextColor = unselectedTextColor;
                          cardTextColor = unselectedTextColor;
                          cashTextColor = selectedTextColor;
                        });
                      },
                      child: Text(
                        'Cash',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: cashTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),

                Text(
                  'Select Genres!',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),

                // Select Genres
                Wrap(
                  children: [
                    for (int i = 0; i < genres.length; i++)
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                side: BorderSide(
                                    width: 1.0,
                                    color: Color(0xffBDBDBD),
                                    style: BorderStyle.solid)),
                            primary: genreColors[i],
                          ),
                          onPressed: () {
                            setState(() {
                              if (selectedGenres.contains(genres[i])) {
                                selectedGenres.remove(genres[i]);
                                genreColors[i] = unselectedColor;
                                genreTextColors[i] = unselectedTextColor;
                              } else {
                                selectedGenres.add(genres[i]);
                                genreColors[i] = selectedColor;
                                genreTextColors[i] = selectedTextColor;
                              }
                            });
                          },
                          child: Text(
                            genres[i],
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                              color: genreTextColors[i],
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                        ),
                      ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 60)),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      side: BorderSide(
                          width: 0.0,
                          color: Colors.white,
                          style: BorderStyle.solid),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 4 / 7, 52),
                    primary: const Color(0xff272022),
                  ),
                  child: const Text(
                    'Complete',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () async {
                    await registerUser(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                        genderString,
                        paymentString,
                        isPremium);
                    for (int i = 0; i < selectedGenres.length; i++) {
                      await chooseInterestedGenres(
                          usernameController.text, selectedGenres[i]);
                    }
                    Navigator.pop(context);
                  },
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'BAKEM Interactive, LLC',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black45),
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
