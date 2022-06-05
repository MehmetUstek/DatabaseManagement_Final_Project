class Watchlist {
  final int LID;
  final String name;
  final String creationDate;
  final String username;

  Watchlist({required this.LID,required this.name, required this.creationDate,required this.username,});

  factory Watchlist.fromJson(Map<String, dynamic> json) {
    return Watchlist(
      LID: json['LID'],
      name: json['name'],
      creationDate: json['creationDate'],
      username: json['username'],
    );
  }
}