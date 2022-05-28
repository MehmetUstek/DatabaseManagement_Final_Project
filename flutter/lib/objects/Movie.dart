class Movie {
  final int MID;
  final String title;
  final String releaseDate;
  final int duration;
  final double voteAvg;
  final int voteCount;
  String? genreName;

  Movie({required this.MID,required this.title, required this.releaseDate, required this.duration,required this.voteAvg,required this.voteCount, this.genreName});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      MID: json['MID'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      duration: json['duration'],
      voteAvg: json['voteAvg'],
      voteCount: json['voteCount'],
      genreName: json['gname'],
    );
  }
}