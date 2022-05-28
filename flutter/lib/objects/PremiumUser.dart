class PremiumUser {
  final String username;
  final String email;
  final String password;
  final DateTime creationDate;
  final String fname;
  final String lname;
  final String gender;
  final String paymentMethod;

  PremiumUser({required this.username,required this.email, required this.password, required this.creationDate,required this.fname,required this.lname,required this.gender,required this.paymentMethod,});

  factory PremiumUser.fromJson(Map<String, dynamic> json) {
    return PremiumUser(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      creationDate: json['creationDate'],
      fname: json['fname'],
      lname: json['lname'],
      gender: json['gender'],
      paymentMethod: json['paymentMethod']
    );
  }
}