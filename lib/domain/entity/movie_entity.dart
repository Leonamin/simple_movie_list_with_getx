abstract class MovieEntity {
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;

  MovieEntity({
    required this.overview,
    required this.posterPath,
    required this.originalTitle,
    required this.popularity,
  });
}
