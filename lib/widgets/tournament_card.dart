import 'package:flutter/material.dart';

class TournamentCard extends StatelessWidget {
  TournamentCard({
    @required this.name,
    @required this.coverUrl,
    @required this.gameName,
    Key? key,
  }) : super(key: key);

  final name;
  final coverUrl;
  final gameName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(coverUrl),
                  ),
                ),
                height: 120.0,
              ),
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: Color(0xffffffff),
                  gradient: LinearGradient(
                      colors: [Color(0xcc000000), Color(0x11000000)],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter),
                ),
              )
            ],
          ),
          FractionalTranslation(
            translation: Offset(0.0, -0.3),
            child: Container(
              padding: EdgeInsets.fromLTRB(12.0, 12.0, 20.0, 12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20.0,
                      color: Color(0x11000000),
                      spreadRadius: 2.0)
                ],
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.6 * MediaQuery.of(context).size.width,
                    child: Text(
                      name,
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xff4a4a4a),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    gameName,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xffa4a4a4),
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
