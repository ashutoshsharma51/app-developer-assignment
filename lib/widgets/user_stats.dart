import 'package:flutter/material.dart';

class UserStatsText extends StatelessWidget {
  final stat;
  final statLabel;
  const UserStatsText({this.stat, this.statLabel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.stat,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Color(0xffffffff),
            ),
          ),
          Text(
            this.statLabel,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}

class UserStats extends StatelessWidget {
  final won;
  final played;
  const UserStats({this.won, this.played, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xffec7a00),
                    Color(0xffefaa00),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
              child: UserStatsText(
                stat: played.round().toString(),
                statLabel: 'Tournaments\nplayed',
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xbb550095),
                    Color(0xdab900be),
                  ],
                ),
              ),
              child: UserStatsText(
                stat: won.round().toString(),
                statLabel: 'Tournaments\nwon',
              ),
            ),
          ),
          SizedBox(
            width: 2.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xfff93e34),
                    Color(0xfff97742),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: UserStatsText(
                stat: (100.0 * won / played).round().toString() + '%',
                statLabel: 'Winning\npercentage',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
