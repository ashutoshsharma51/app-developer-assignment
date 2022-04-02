import 'package:app/helpers/shared_pref.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueStacks Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int isUserLoggedIn = 0;
  void initState() {
    autoLogin();
    super.initState();
  }

  // Following function checks if a user is logged in already.
  // If yes, we route directly to the homescreen, otherwise,
  // we route to the loginscreen. However, a better way to do
  // this would be to add a splash screen to the app.
  void autoLogin() async {
    final loggedInUsername = await SharedPreferencesHelper().getLoggedInUser();
    Future.delayed(Duration(seconds: 2), () async {
      if (loggedInUsername != null && loggedInUsername.isNotEmpty) {
        setState(() {
          isUserLoggedIn = 1;
        });
      } else {
        setState(() {
          isUserLoggedIn = 2;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isUserLoggedIn == 0) {
      return SplashScreen();
    } else if (isUserLoggedIn == 1) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
