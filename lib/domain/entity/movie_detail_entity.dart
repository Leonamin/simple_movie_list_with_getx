import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';

class MovieDetailEntity extends MovieEntity {
  MovieDetailEntity(
      {required super.overview,
      required super.posterPath,
      required super.originalTitle,
      required super.popularity});
}
