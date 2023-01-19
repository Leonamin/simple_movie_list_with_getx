import 'package:simple_movie_list_with_getx/data/dto/movie_dto.dart';
import 'package:simple_movie_list_with_getx/data/mapper/mapper.dart';
import 'package:simple_movie_list_with_getx/domain/entity/movie_detail_entity.dart';
import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';

class MovieDetailEntityMapper extends Mapper<MovieDTO, MovieEntity> {
  @override
  map(object) {
    return MovieDetailEntity(
      originalTitle: object.originalTitle,
      overview: object.overview,
      popularity: object.popularity,
      posterPath: object.posterPath,
    );
  }
}
