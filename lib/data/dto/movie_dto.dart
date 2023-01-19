class MovieDTO {
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;

  MovieDTO({
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
    required this.popularity,
  });

  factory MovieDTO.fromJson(Map<String, dynamic> json) {
    return MovieDTO(
        overview: json["overview"] as String,
        posterPath: json["poster_path"] as String,
        originalTitle: json["original_title"] as String,
        popularity: json["popularity"] as double);
  }
}
