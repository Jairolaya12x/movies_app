import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class BannerMovieContainer extends StatelessWidget {
  const BannerMovieContainer(this.movie, {Key key}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15,
      ),
      height: 200,
      width: 300,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        //color: Colors.red,
        image: DecorationImage(
          image: NetworkImage(
            MoviesProvider().imageUrl(movie.imageUrl),
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black12, BlendMode.colorBurn),
        ),
        borderRadius: BorderRadius.circular(20),
        /*gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.red,
              Colors.transparent,
            ]
        ),*/
      ),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.releaseDate,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            Text(
              movie.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 22,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ]),
    );
  }
}
