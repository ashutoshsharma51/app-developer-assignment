import 'package:app/helpers/shared_pref.dart';
import 'package:app/models/user_model.dart';
import 'package:app/providers/login_api.dart';
import 'package:app/providers/user_details_api.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';
import 'package:app/widgets/recommended_for_you.dart';
import 'package:app/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

GlobalKey<FormState>? formKey = GlobalKey<FormState>();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? username;
  UserModel? _userModel;
  final vertSpacing = 50.0;

  @override
  void initState() {
    getLoggedInUserDetails();
    super.initState();
  }

  void getLoggedInUserDetails() async {
    final loggedInUsername = await SharedPreferencesHelper().getLoggedInUser();
    final userDetails =
        await UserDetailsApi().fetchUserByUsername(loggedInUsername);
    setState(() {
      username = loggedInUsername;
      _userModel = userDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _userModel == null
        ? SplashScreen()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => {
                  LoginApi().logoutUser(),
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  ),
                },
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi),
                  child: Icon(
                    Icons.short_text,
                    color: Color(0xff4a4a4a),
                    size: 32,
                  ),
                ),
              ),
              title: Text(username.toString(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.bold,
                  )),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Color(0xfff9f9f9),
            body: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserDetails(
                      name: _userModel?.name,
                      userImg: _userModel?.userImg,
                      elo: _userModel?.elo,
                      played: _userModel?.played,
                      won: _userModel?.won,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RecommendedForYou(),
                  ],
                ),
              ),
            ),
          );
  }
}
