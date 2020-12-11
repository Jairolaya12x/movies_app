import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    return FutureBuilder(
      future: MoviesProvider().searchMovies(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: List.generate(
              snapshot.data.length,
              (index) => Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                height: 120,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.network(
                        MoviesProvider().imageUrl(snapshot.data[index].postUrl),
                        width: 70,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data[index].title),
                          Row(
                            children: [
                              Icon(Icons.star_half_rounded),
                              Text(snapshot.data[index].voteAverage.toStringAsFixed(1)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
