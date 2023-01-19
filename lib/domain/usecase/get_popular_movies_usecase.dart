import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';
import 'package:simple_movie_list_with_getx/domain/repository/movie_repository.dart';
import 'package:simple_movie_list_with_getx/domain/resoures/data_result.dart';

class GetPopularMoviesUseCase {
  late MovieRepository movieRepository;

  GetPopularMoviesUseCase({required this.movieRepository});

  Future<DataResult<List<MovieEntity>>> getPopularMovieList() {
    return movieRepository.getPopularMovieList();
  }
}
