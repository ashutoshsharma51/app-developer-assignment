import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({this.userImg, this.name, this.elo, Key? key})
      : super(key: key);
  final userImg;
  final name;
  final elo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.12 * MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImg),
              radius: 0.120 * MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  name.toString(),
                  style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  border: Border.all(
                    color: Color(0xff6600ff),
                    style: BorderStyle.solid,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        elo.toString(),
                        style: TextStyle(
                          color: Color(0xff6600ff),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Elo rating',
                        style: TextStyle(
                          color: Color(0xff676693),
                          fontSize: 18.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
