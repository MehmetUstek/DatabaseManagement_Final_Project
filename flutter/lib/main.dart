import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:database_management_project/signIn.dart';
import 'package:database_management_project/HomePage.dart';
import 'package:database_management_project/User.dart';

import 'SearchPage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              // primarySwatch: Colors.b,

            ),
            home: const AuthenticationWrapper(),
          );
    // return MultiProvider(
    //   // providers: [
    //     // Provider<AuthenticationService>(
    //     //   create: (_) => AuthenticationService(FirebaseAuth.instance),
    //     // ),
    //     // StreamProvider(
    //     //   create: (context) =>
    //     //   context.read<AuthenticationService>().authStateChanges,
    //     //   initialData: null,
    //     // ),
    //   // ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       // This is the theme of your application.
    //       //
    //       // Try running your application with "flutter run". You'll see the
    //       // application has a blue toolbar. Then, without quitting the app, try
    //       // changing the primarySwatch below to Colors.green and then invoke
    //       // "hot reload" (press "r" in the console where you ran "flutter run",
    //       // or simply save your changes to "hot reload" in a Flutter IDE).
    //       // Notice that the counter didn't reset back to zero; the application
    //       // is not restarted.
    //       // primarySwatch: Colors.b,
    //
    //     ),
    //     home: const AuthenticationWrapper(),
    //   ),
    // );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User?>();
    // if(firebaseUser == null){
    //   // if (FirebaseAuth.instance.currentUser?.uid == null) {
    //   return SignInPage();
    // }
    //TODO: Change this.
    // return MyHomePage(
    //     title: 'Flutter Memo Home Page',
    //     userUID: "aa");
    return SignInPage();
    // return HomePage();
    // return SearchPage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.userUID})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String? userUID;

  @override
  _MyHomePageState createState() => _MyHomePageState(userUID);
}

class _MyHomePageState extends State<MyHomePage> {
  String? userUID;
  UserData? _user;
  final List<Tab> myTabs = <Tab>[
    // Tab(
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: const [
    //       Icon(
    //         CupertinoIcons.home,
    //         color: Colors.white,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 6)),
    //       Text(
    //         "Home",
    //         style: TextStyle(fontSize: 13),
    //       ),
    //     ],
    //   ),
    // ),
    // Tab(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     mainAxisSize: MainAxisSize.min,
    //     children: const [
    //       Icon(
    //         CupertinoIcons.bag,
    //         color: Colors.white,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 2),child:
    //       Text(
    //         "Bag",
    //         style: TextStyle(fontSize: 13, color: Colors.white),
    //       ),
    //       ),
    //     ],
    //   ),
    // ),
    // Tab(
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: const [
    //       Icon(
    //         CupertinoIcons.profile_circled,
    //         color: Colors.white,
    //       ),
    //       Padding(padding: EdgeInsets.only(left: 6)),
    //       Text(
    //         "Profile",
    //         style: TextStyle(fontSize: 13),
    //       ),
    //     ],
    //   ),
    // ),
  ];
  final List<Widget> profileTabWidgets = <Widget>[];

  _MyHomePageState(this.userUID);



  @override
  void initState() {
    super.initState();
    // setState((){
    // print(futureFullData);
    // futureHomeContent = fetchHomeContent();

    // fetchUser(userUID!).then((value) => _user = value);
    // user.initUser(userUID!).then((value) {
    //   print(value);
    //   print("outside" + user.toString());
    //   _user = value;
    //
    //
    //
    //   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // });
    setState(() {
      // getLocation();
      // fetchUser(userUID!).then((value) =>_user = value);
    });
    // });

    // isPremium = user.isPremiumUser();
    // if(user.isPremiumUser()){
    //   print("PREMIUM");
    // }
    // else if(user.getUserRole()== UserRole.USER){
    //   print("CLASSIC");
    // }
  }

  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     // getDatabase();
  //     // _counter++;
  //     insertOne({
  //       'userId': userUID!,
  //       'contentId': 1,
  //       'registerId': 1,
  //       'registerTime': DateTime.now(),
  //       'happinessLevel': 10,
  //       'title': 'test3',
  //       'platform': 'Android',
  //     });
  //     // print(v.toString());
  //   });
  //   // return RefreshIndicator(child: child, onRefresh: onRefresh)
  // }

  Widget menu() {
    return Container(
      color: Colors.white,
      // child: TabBar(
      //   labelColor: Colors.white,
      //   unselectedLabelColor: Colors.white70,
      //   indicatorColor: Colors.white,
      //   tabs: myTabs,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  Scaffold(
          // backgroundColor: Colors.deepOrangeAccent,
          backgroundColor: Colors.white,
          // bottomNavigationBar: TabBar(tabs: myTabs,),
          bottomNavigationBar: SizedBox(height: 65, child: menu()),
          // appBar: AppBar(
          //   // Here we take the value from the MyHomePage object that was created by
          //   // the App.build method, and use it to set our appbar title.
          //   title: Text(widget.title),
          // ),

    );
  }
}
