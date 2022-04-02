import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        color: Color(0xff333333),
      ),
    );
  }
}
