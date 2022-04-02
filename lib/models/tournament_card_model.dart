class TournamentCardModel {
  final name;
  final coverUrl;
  final gameName;

  TournamentCardModel({this.name, this.coverUrl, this.gameName});

  factory TournamentCardModel.fromJson(Map<String, dynamic> jsonData) {
    return TournamentCardModel(
      name: jsonData['name'],
      coverUrl: jsonData['cover_url'],
      gameName: jsonData['game_name'],
    );
  }
}
