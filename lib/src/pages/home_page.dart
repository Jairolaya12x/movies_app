import 'package:flutter/material.dart';
import 'package:movies_app/src/Widgets/Home/banner_movie_container.dart';
import 'package:movies_app/src/models/movie.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _content(),
    );
  }

  Widget _appbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Movies App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _comingSoonContainer(),
          _currentMoviesContainer(),
        ],
      ),
    );
  }

  Widget _comingSoonContainer() {
    print('Algo¡');
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coming Soon',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: moviesProvider.getComingMovies(),
            builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                );
              } else
                {
                  print(snapshot.data.length);
                  return Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        snapshot.data.length,
                            (index) => BannerMovieContainer(snapshot.data[index]),
                      ),
                    ),
                  );
                }

            },
          )
        ],
      ),
    );
  }

  Widget _currentMoviesContainer() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Movies',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Placeholder(
            fallbackHeight: 200,
          ),
        ],
      ),
    );
  }
}
