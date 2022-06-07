class PairChart {
  final String gname;
  final double perc;

  PairChart({required this.gname,required this.perc,});

  factory PairChart.fromJson(Map<String, dynamic> json) {
    return PairChart(
      gname: json['gname'],
      perc: json['perc'],
    );
  }

}