class ReviewFullName {
  final int RID;
  final double  rating;
  final String comment;
  final String date;
  final String username;
  final int MID;
  final String fname;
  final String lname;

  ReviewFullName({required this.RID,required this.rating, required this.comment, required this.date,required this.username,required this.MID, required this.fname, required this.lname});

  factory ReviewFullName.fromJson(Map<String, dynamic> json) {
    return ReviewFullName(
      RID: json['RID'],
      rating: (json['rating'] as int).toDouble(),
      comment: json['comment'],
      date: json['date'],
      username: json['username'],
      MID: json['MID'],
      fname: json['fname'],
      lname: json['lname'],
    );
  }
}