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
                  color: Colors.white,
                ),
                child:
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 25,
                      child: TextField(
                        autocorrect: false,
                        enableSuggestions: false,

                        cursorColor: Colors.white54,
                        textAlign: TextAlign.start,
                        controller: emailController,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,

                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
