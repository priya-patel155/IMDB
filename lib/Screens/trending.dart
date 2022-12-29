import 'package:flutter/material.dart';

import '../utils/text.dart';
import 'movie_description.dart';

class TrendingMovies extends StatefulWidget {
  final List? trending;
  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedtext(
            text: 'Latest movies',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.trending!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: widget.trending![index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              widget.trending![index]
                                                  ['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              widget.trending![index]
                                                  ['poster_path'],
                                      description: widget.trending![index]
                                          ['overview'],
                                      vote: widget.trending![index]
                                              ['vote_average']
                                          .toString(),
                                      launch_on: widget.trending![index]
                                          ['release_date'],
                                    )));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          widget.trending![index]
                                              ['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modifiedtext(
                                  size: 15,
                                  text: widget.trending![index]['title'] != null
                                      ? widget.trending![index]['title']
                                      : 'Loading'),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
