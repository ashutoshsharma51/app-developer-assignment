import 'package:app/widgets/user_info.dart';
import 'package:app/widgets/user_stats.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  UserDetails(
      {this.userImg, this.name, this.elo, this.played, this.won, Key? key})
      : super(key: key);
  final userImg;
  final name;
  final elo;
  final played;
  final won;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          UserInfo(
            userImg: this.userImg,
            name: this.name,
            elo: this.elo,
          ),
          SizedBox(
            height: 20.0,
          ),
          UserStats(
            played: this.played,
            won: this.won,
          ),
        ],
      ),
    );
  }
}
