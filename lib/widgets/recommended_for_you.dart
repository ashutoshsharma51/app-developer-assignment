import 'package:app/models/tournament_card_model.dart';
import 'package:app/widgets/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecommendedForYou extends StatefulWidget {
  RecommendedForYou({Key? key}) : super(key: key);

  @override
  _RecommendedForYouState createState() => _RecommendedForYouState();
}

class _RecommendedForYouState extends State<RecommendedForYou> {
  List<TournamentCardModel> recommendations = [];

  ScrollController _scrollController = new ScrollController();
  String? apiCursor;
  bool recommendationsLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecommendations();

    _scrollController.addListener(() {
      // To create the loading indicator slightly before the user reaches the end of the screen.
      if (_scrollController.position.maxScrollExtent -
              _scrollController.position.pixels <
          100.0) {
        setState(() {
          recommendationsLoading = true;
          fetchRecommendations();
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  fetchRecommendations() async {
    final listItemLimit = 10;
    final fetchUrl;
    final url =
        'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?status=all&limit=';
    if (apiCursor == null) {
      fetchUrl = url + listItemLimit.toString();
    } else {
      fetchUrl =
          url + listItemLimit.toString() + '&cursor=' + apiCursor.toString();
    }

    final response = await http.get(Uri.parse(fetchUrl));

    if (response.statusCode == 200) {
      final respLen = json.decode(response.body)['data']['tournaments'].length;
      apiCursor = json.decode(response.body)['data']['cursor'];
      final recommendationsData =
          json.decode(response.body)['data']['tournaments'];
      for (var i = 0; i < respLen; i++) {
        final tmpRecommendation =
            TournamentCardModel.fromJson(recommendationsData[i]);
        setState(() {
          recommendations.add(tmpRecommendation);
          recommendationsLoading = false;
        });
      }
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      // TODO: Fix the overflow issue properly
      height: MediaQuery.of(context).size.height - 333,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Recommended for you',
            style: TextStyle(
                color: Color(0xff4a4a4a),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: recommendations.length + 1,
              itemBuilder: (context, index) {
                if (index == recommendations.length) {
                  if (recommendationsLoading) {
                    return Container(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        bottom: 30.0,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff4a4a4a),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      width: 0.0,
                      height: 0.0,
                    );
                  }
                } else {
                  return TournamentCard(
                    name: recommendations[index].name,
                    coverUrl: recommendations[index].coverUrl,
                    gameName: recommendations[index].gameName,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
