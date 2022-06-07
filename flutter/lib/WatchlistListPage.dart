import 'package:database_management_project/objects/Watchlist.dart';
import 'package:database_management_project/pieChartWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';

import 'MoviesPage.dart';
import 'WatchlistDetailPage.dart';
import 'dbQueries.dart';
import 'objects/Movie.dart';
import 'objects/PairChart.dart';

class WatchlistListPage extends StatefulWidget {
  const WatchlistListPage(
      {Key? key,
        required this.watchlistList,})
      : super(key: key);
  final List<Watchlist> watchlistList;
  @override
  _WatchlistListPageState createState() => _WatchlistListPageState();
}

Map<String, double> toMap(List<PairChart> list){
  Map<String, double> map = {};
  for(PairChart pair in list){
    map.putIfAbsent(pair.gname, () => pair.perc);
  }
  return map;
}

class _WatchlistListPageState extends State<WatchlistListPage> {
  var containerColor = Colors.black87;
  late List<Watchlist> watchlistList;

  @override
  void initState() {
    super.initState();
    watchlistList = widget.watchlistList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: CircleBorder(),
                          primary: Colors.white,
                        ),
                        child: Icon(
                          CupertinoIcons.arrowtriangle_left_circle,
                          size: 30,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Image.asset('images/logo.png', width: 180),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 20),
                  child: Row(children: <Widget>[
                    Text(
                      'Watchlists',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      )),
                    ),
                  ]),
                ),
                const Padding(padding: EdgeInsets.only(top:10)),

                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    addAutomaticKeepAlives: false,
                    cacheExtent: 100,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      Watchlist watchlist = watchlistList[index];
                      return
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(40.0)),
                              side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                            ),
                            elevation: 20.0,
                            fixedSize: const Size(350, 100),
                            primary: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Column(children: [
                                          Icon(
                                            CupertinoIcons.play_rectangle_fill,
                                            size: 50,
                                            color: Colors.black,
                                          ),
                                        ]),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0),
                                                child: Text(
                                                  watchlist.name,
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                      )),
                                                ),
                                              ),
                                            ]),
                                            Row(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0),
                                                child: Text(
                                                  'Movies:  dummy',
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color: Colors.black45,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold,
                                                      )),
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          onPressed: () async {
                            var pieChartData = await percentagesOfGenres(watchlist.LID);
                            Map<String, double> pieChartMap = toMap(pieChartData);

                            var movieList = await showMoviesOfWatchlist(watchlist.LID);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WatchlistDetailPage(movieList: movieList, listTitle: watchlist.name, dataMap: pieChartMap)));
                          },
                        );
                    }, separatorBuilder: (BuildContext context, int index) => const Divider(), itemCount: watchlistList.length,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
