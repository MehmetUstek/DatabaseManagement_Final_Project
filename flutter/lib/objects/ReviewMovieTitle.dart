class ReviewMovieTitle {
  final int RID;
  final double  rating;
  final String comment;
  final String date;
  final String username;
  final int MID;
  final String movieName;

  ReviewMovieTitle({required this.RID,required this.rating, required this.comment, required this.date,required this.username,required this.MID, required this.movieName});

  factory ReviewMovieTitle.fromJson(Map<String, dynamic> json) {
    return ReviewMovieTitle(
      RID: json['RID'],
      rating: (json['rating'] as int).toDouble(),
      comment: json['comment'],
      date: json['date'],
      username: json['username'],
      MID: json['MID'],
      movieName: json['title'],
    );
  }
}