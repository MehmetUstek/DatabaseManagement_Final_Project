class Review {
  final int RID;
  final double  rating;
  final String comment;
  final DateTime date;
  final String username;
  final int MID;

  Review({required this.RID,required this.rating, required this.comment, required this.date,required this.username,required this.MID,});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      RID: json['RID'],
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      username: json['username'],
      MID: json['MID'],
    );
  }
}