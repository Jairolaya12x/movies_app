class Movie {
  String title;
  String releaseDate;
  String imageUrl;
  int id;
  String postUrl;
  double voteAverage;

  Movie({this.id,this.title,this.releaseDate, this.imageUrl});

  Movie.fromJson(Map<String,dynamic> json) {
    try {
      this.title = json['title'];
      this.releaseDate = json['release_date'];
      this.imageUrl = json['backdrop_path'];
      this.id = json['id'];
      this.postUrl = json['poster_path'];
      this.voteAverage = json['vote_average'] / 1;
    } on Exception catch (e) {
      print(e);
    }

  }
}