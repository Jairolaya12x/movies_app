import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class PosterMovieContainer extends StatelessWidget {
  PosterMovieContainer(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    MoviesProvider().imageUrl(movie.postUrl),
                  ),
                  fit: BoxFit.cover),
            ),
            width: 180,
          ),
          Text(
            movie.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.language,
                size: 17,
              ),
              Text('${movie.language.toUpperCase()} • '),
              Icon(Icons.star_half),
              Text(
                movie.voteAverage.toStringAsFixed(1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
