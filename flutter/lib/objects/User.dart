class User {
  final String username;
  final String email;
  final String password;
  final String creationDate;
  final String fname;
  final String lname;
  final String gender;
  String? paymentMethod;
  final bool isPremium;

  User({required this.username,required this.email, required this.password, required this.creationDate,required this.fname,required this.lname,required this.gender, this.paymentMethod,required this.isPremium});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        password: json['password'].toString(),
        creationDate: json['creationDate'],
        fname: json['fname'],
        lname: json['lname'],
        gender: json['gender'],
        paymentMethod: json['paymentMethod'],
        isPremium: json['isPremium'] == 1
    );
  }
}