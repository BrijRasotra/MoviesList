class MovieModel {
  String? title;
  String? image;
  var rating;
  int? releaseYear;
  List<String>? genre;

  MovieModel(
      {this.title, this.image, this.rating, this.releaseYear, this.genre});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      image: json['image'],
      rating: json['rating'],
      releaseYear: json['releaseYear'],
      genre: List<String>.from(json["genre"].map((x) => x)),
    );
  }
}
