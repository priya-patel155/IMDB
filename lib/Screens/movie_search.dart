import 'package:flutter/material.dart';

import '../funcations.dart';
import '../model_class/movie.dart';
import '../services/api_endpoint.dart';

class MovieSerach extends StatefulWidget {
  const MovieSerach({Key? key}) : super(key: key);

  @override
  State<MovieSerach> createState() => _MovieSerachState();
}

class _MovieSerachState extends State<MovieSerach> {
  TextEditingController _search = TextEditingController();

  List<Movie>? moviesList;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: _search,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.yellow,
            ),
            onChanged: (value) {
              fetchMovies(Endpoints.movieSearchUrl(_search.text)).then((value) {
                setState(() {
                  moviesList = value;
                });
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.yellow,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              fillColor: Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: moviesList == null
                ? Center(
                    child: Text(
                      "Search Movie here!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : moviesList!.length == 0
                    ? Center(
                        child: Text(
                          "Oops! couldn't find the movie",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: moviesList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // widget.onTap!(moviesList![index]);
                              },
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 70,
                                        height: 80,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child:
                                              moviesList![index].posterPath ==
                                                      null
                                                  ? Image.asset(
                                                      'assets/images/na.jpg',
                                                      fit: BoxFit.cover,
                                                    )
                                                  : FadeInImage(
                                                      image: NetworkImage(Endpoints
                                                              .TMDB_BASE_IMAGE_URL +
                                                          'w500/' +
                                                          moviesList![index]
                                                              .posterPath!),
                                                      fit: BoxFit.cover,
                                                      placeholder: AssetImage(
                                                          'assets/images/loading.gif'),
                                                    ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                moviesList![index].title!,
                                                style: TextStyle(
                                                    color: Colors.white),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                      moviesList![index]
                                                          .voteAverage!,
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Icon(Icons.star,
                                                      color: Colors.green)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0),
                                    child: Divider(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
