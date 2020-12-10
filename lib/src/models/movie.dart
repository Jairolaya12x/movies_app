class Movie {
  String title;
  String releaseDate;
  String imageUrl;
  int id;

  Movie({this.id,this.title,this.releaseDate, this.imageUrl});

  Movie.fromJson(Map<String,dynamic> json) {
    try {
      print(json);
      this.title = json['title'];
      this.releaseDate = json['release_date'];
      this.imageUrl = json['backdrop_path'];
      this.id = json['id'];
    } on Exception catch (e) {
      print(e);
    }

  }
}