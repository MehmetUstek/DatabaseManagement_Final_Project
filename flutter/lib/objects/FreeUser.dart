class FreeUser {
  final String username;
  final String email;
  final String password;
  final DateTime creationDate;
  final String fname;
  final String lname;
  final String gender;

  FreeUser({required this.username,required this.email, required this.password, required this.creationDate,required this.fname,required this.lname,required this.gender,});

  factory FreeUser.fromJson(Map<String, dynamic> json) {
    return FreeUser(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      creationDate: json['creationDate'],
      fname: json['fname'],
      lname: json['lname'],
      gender: json['gender'],
    );
  }
}