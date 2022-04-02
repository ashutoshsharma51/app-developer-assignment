import 'package:app/providers/login_api.dart';
import 'package:app/screens/home.dart';
import 'package:app/helpers/globals.dart' as globals;
import 'package:flutter/material.dart';

GlobalKey<FormState>? _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isUsernameValid = false;
  bool isPasswordValid = false;
  bool isLoginValid = false;
  bool? isFormValid;

  final vertSpacing = 50.0;

  bool validateCredentials(String uname, String pass) {
    final users = globals.users;
    final pwds = globals.passwords;
    for (var i = 0; i < users.length; i++) {
      if (uname == users[i] && pass == pwds[i]) return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    username.clear();
    password.clear();
  }

  showLoginFailedDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Login Error",
              style: TextStyle(color: Color(0xffcc0000)),
            ),
            content: Text(
                "Failed to log in. Invalid username or password! Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/logo.png'),
                width: 0.6 * MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: vertSpacing,
              ),
              TextFormField(
                onChanged: (value) {
                  if (value.length <= 10 && value.length >= 3) {
                    setState(() {
                      isUsernameValid = true;
                    });
                  } else {
                    setState(() {
                      isUsernameValid = false;
                    });
                  }
                },
                controller: username,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                validator: (value) {
                  if (value == null) {
                    return 'Username cannot be empty!';
                  }
                  if (value.length > 10 || value.length < 3) {
                    return 'Username should have at least 3 and atmost 10 characters!';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Color(0xff222222)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff333333), width: 1.0),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff000000), width: 2.0)),
                ),
              ),
              SizedBox(
                height: vertSpacing,
              ),
              TextFormField(
                onChanged: (value) {
                  if (value.length <= 10 && value.length >= 3) {
                    setState(() {
                      isPasswordValid = true;
                    });
                  } else {
                    setState(() {
                      isPasswordValid = false;
                    });
                  }
                },
                controller: password,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                enableSuggestions: false,
                obscureText: true,
                autocorrect: false,
                validator: (value) {
                  if (value == null) {
                    return 'Password cannot be empty!';
                  }
                  if (value.length > 10 || value.length < 3) {
                    return 'Password should have at least 3 and atmost 10 characters!';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Color(0xff222222)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff333333), width: 1.0),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff000000), width: 2.0),
                  ),
                ),
              ),
              SizedBox(
                height: vertSpacing,
              ),
              ElevatedButton(
                onPressed: () => {
                  isFormValid = _formKey?.currentState?.validate(),
                  isUsernameValid && isPasswordValid
                      ? {
                          isLoginValid =
                              validateCredentials(username.text, password.text),
                          if (isFormValid == true)
                            {
                              isLoginValid
                                  ? {
                                      LoginApi().loginUser(username.text),
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          )),
                                    }
                                  : {
                                      showLoginFailedDialog(context),
                                    }
                            }
                        }
                      // Display the errors
                      : _formKey?.currentState?.validate()
                },
                child: Text('Submit'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(double.infinity, 60),
                  ),
                  backgroundColor: isUsernameValid && isPasswordValid
                      ? MaterialStateProperty.all(
                          Color(0xff333333),
                        )
                      : MaterialStateProperty.all(
                          Color(0xffcccccc),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
