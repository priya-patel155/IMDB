import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../services/api_endpoint.dart';
import '../utils/text.dart';

class DiscoverMovies extends StatefulWidget {
  final List? discover;
  DiscoverMovies({Key? key, this.discover}) : super(key: key);

  @override
  State<DiscoverMovies> createState() => _DiscoverMoviesState();
}

class _DiscoverMoviesState extends State<DiscoverMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            modifiedtext(
              text: 'Top Rated Movies',
              size: 26,
            ),
            SizedBox(height: 10),
            Container(
                height: 270,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.discover!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          widget.discover![index]
                                              ['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modifiedtext(
                                size: 15,
                                text: widget.discover![index]['title'] != null
                                    ? widget.discover![index]['title']
                                    : 'Loading',
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
