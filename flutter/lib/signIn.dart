import 'package:database_management_project/HomePage.dart';
import 'package:database_management_project/registerPage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'objects/User.dart';
import 'dbQueries.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool showValue = false;
  var containerColor = Colors.black87;

  @override
  void initState() {
    super.initState();
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text("EEEH BEE NAPTIN BAKEM"),
      content: Text("Wrong Password."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          // color: Colors.white,
          // margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Image.asset(
                    'images/logo.png',
                    width: 250,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),

              // Username textfield.
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 6 / 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: containerColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 25,
                      child: TextField(
                        autocorrect: false,
                        enableSuggestions: false,
                        cursorColor: Colors.white54,
                        textAlign: TextAlign.start,
                        controller: usernameController,
                        onEditingComplete: () {
                          isEmailValid = EmailValidator.validate(
                              usernameController.text.trim());
                          if (isEmailValid) {
                            print("Valid");
                          } else {
                            print("Not Valid");
                          }
                        },
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 20.0)),

              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 6 / 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: containerColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 25,
                      child: TextField(
                        cursorColor: Colors.white70,
                        obscureText: true,
                        controller: passwordController,
                        onEditingComplete: () {},
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 30)),
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
                  'Sign In',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () async {
                  // TODO: If user signed in correctly, go onto the next page.
                  bool isAccepted = await checkPassword(
                      usernameController.text, passwordController.text);
                  if (isAccepted) {
                    User user = await showProfilePage(usernameController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(currentUser: user)));
                  } else {
                    showAlertDialog(context);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      side: BorderSide(
                          width: 2.0,
                          color: Colors.black,
                          style: BorderStyle.solid),
                    ),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 4 / 7, 52),
                    primary: Colors.white,
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 150, bottom: 20),
                child: Text(
                  'BAKEM Interactive, LLC',
                  style: TextStyle(fontSize: 13, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
