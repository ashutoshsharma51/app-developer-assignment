class UserModel {
  final String? username;
  final String? name;
  final String? userImg;
  final int? elo;
  final int? played;
  final int? won;

  const UserModel({
    this.username,
    this.name,
    this.userImg,
    this.elo,
    this.played,
    this.won,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      username: jsonData['username'],
      name: jsonData['name'],
      userImg: jsonData['user_img'],
      elo: jsonData['elo'],
      played: jsonData['played'],
      won: jsonData['won'],
    );
  }
}
