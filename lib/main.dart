import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imdb/services/api_endpoint.dart';
import 'package:flutter_imdb/utils/text.dart';

import 'package:tmdb_api/tmdb_api.dart';

import 'Screens/discover_description.dart';
import 'Screens/splash.dart';
import 'Screens/toprated.dart';
import 'Screens/trending.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: const Splash(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List discovermovies = [];
  List tv = [];
  int _selectedIndex = 0;
  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
        ApiKeys(Endpoints.TMDB_API_KEY, Endpoints.TMDB_API_READ_ACCESS_TOKEN),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
        dio: Dio());

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map discoverresult = await tmdbWithCustomLogs.v3.discover.getTvShows();

    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      discovermovies = discoverresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: discovermovies == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        disableCenter: true,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder:
                          (BuildContext context, int index, pageViewIndex) {
                        return discovermovies.length == 0
                            ? Container()
                            : Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DiscoverDescription(
                                                  name: discovermovies[index]
                                                      ['title'],
                                                  bannerurl:
                                                      'https://image.tmdb.org/t/p/w500' +
                                                          discovermovies[index]
                                                              ['backdrop_path'],
                                                  posterurl:
                                                      'https://image.tmdb.org/t/p/w500' +
                                                          discovermovies[index]
                                                              ['poster_path'],
                                                  description:
                                                      discovermovies[index]
                                                          ['overview'],
                                                  vote: discovermovies[index]
                                                          ['vote_average']
                                                      .toString(),
                                                  launch_on:
                                                      discovermovies[index]
                                                          ['release_date'],
                                                )));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              discovermovies[index]
                                                  ['poster_path']),
                                      fit: BoxFit.cover,
                                      placeholder: AssetImage(
                                          'assets/images/loading.gif'),
                                    ),
                                  ),
                                ),
                              );
                      },
                      itemCount:
                          discovermovies != null ? discovermovies.length : 0,
                    ),
            ),
            // DiscoverMovies(
            //   discover: discovermovies,
            // ),
            SizedBox(
              height: 30,
            ),
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopRatedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }
}
