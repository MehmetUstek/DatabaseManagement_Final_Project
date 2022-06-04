class PairData {
  final String gname;
  final int count;

  PairData({required this.gname,required this.count,});

  factory PairData.fromJson(Map<String, dynamic> json) {
    return PairData(
      gname: json['gname'],
      count: json['MID'],
    );
  }
}