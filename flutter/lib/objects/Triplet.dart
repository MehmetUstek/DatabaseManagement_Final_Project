class Triplet {
  final String username;
  final String fname;
  final String lname;

  Triplet({required this.username,required this.fname, required this.lname,});

  factory Triplet.fromJson(Map<String, dynamic> json) {
    return Triplet(
      username: json['username'],
      fname: json['fname'],
      lname: json['lname'],
    );
  }
}