import 'package:simple_movie_list_with_getx/data/datasource/remote/tmdb_remote_datasource.dart';
import 'package:simple_movie_list_with_getx/data/mapper/mapper.dart';
import 'package:simple_movie_list_with_getx/data/mapper/movie_detail_entity_mapper.dart';
import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';
import 'package:simple_movie_list_with_getx/domain/repository/movie_repository.dart';
import 'package:simple_movie_list_with_getx/domain/resoures/data_result.dart';

class MovieRepositoryImpl extends MovieRepository {
  late TmdbRemoteDataSource _tmdbRemoteDataSource;

  MovieRepositoryImpl(TmdbRemoteDataSource tmdbRemoteDataSource) {
    _tmdbRemoteDataSource = tmdbRemoteDataSource;
  }

  @override
  Future<DataResult<List<MovieEntity>>> getPopularMovieList() async {
    try {
      // 생각해보면 Mapper의 map은 모두가 가진 함수니까 Mapper mapper로 하는게 맞아보인다.
      // 나중에 바꾸는 일이 생겨도 MovieDetailEntityMapper()만 바꾸면 된다.
      Mapper mapper = MovieDetailEntityMapper();
      final result = await _tmdbRemoteDataSource.loadMovies();
      final List<MovieEntity> mappedData = [
        for (final e in result) mapper.map(e)
      ];
      return DataResult(isSuccess: true, data: mappedData);
    } catch (e) {
      return DataResult(isSuccess: false);
    }
  }
}
