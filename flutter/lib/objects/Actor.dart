class Actor {
  final int AID;
  final String fullName;
  final String gender;

  Actor({required this.AID,required this.fullName, required this.gender,});

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      AID: json['AID'],
      fullName: json['fullName'],
      gender: json['gender'],
    );
  }
}