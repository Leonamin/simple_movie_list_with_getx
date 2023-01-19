import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';
import 'package:simple_movie_list_with_getx/domain/resoures/data_result.dart';

abstract class MovieRepository {
  Future<DataResult<List<MovieEntity>>> getPopularMovieList();
}
