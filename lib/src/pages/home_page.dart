import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/Widgets/Home/banner_movie_container.dart';
import 'package:movies_app/src/Widgets/Home/poster_movier_container.dart';
import 'package:movies_app/src/models/movie.dart';
import 'package:movies_app/src/providers/data_preferences.dart';
import 'package:movies_app/src/providers/data_search_delegate.dart';
import 'package:movies_app/src/providers/movies_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _content(context),
    );
  }

  Widget _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Movies App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () => showSearch(context: context, delegate: DataSearch()),
        ),
      ],
      centerTitle: true,
    );
  }

  Widget _content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _userPanel(context),
          _comingSoonContainer(),
          _currentMoviesContainer(),
        ],
      ),
    );
  }

  Widget _userPanel(BuildContext context) {
    final circleSize = 40.0;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        children: [
          Container(
            height: circleSize,
            width: circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.orangeAccent,
                ],
              ),
            ),
            child: Center(
              child: Text(
                DataPreferences().currentUsername.substring(0,2).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                '${"\t" * 4} ${DataPreferences().currentUsername}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app_outlined),
            onPressed: () {
              DataPreferences().cleanDataPreferences();
              Navigator.pushNamedAndRemoveUntil(context, 'welcome', (route) => false);
            },
          ),
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
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                );
              } else {
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
          FutureBuilder(
            future: moviesProvider.getNowPlayingMovies(),
            builder: (BuildContext _, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(snapshot.data.length,
                        (index) => PosterMovieContainer(snapshot.data[index])),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
