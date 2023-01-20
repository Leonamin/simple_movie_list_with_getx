import 'package:get/get.dart';
import 'package:simple_movie_list_with_getx/data/datasource/remote/tmdb_remote_datasource.dart';
import 'package:simple_movie_list_with_getx/data/repository_impl/movie_repository_impl.dart';
import 'package:simple_movie_list_with_getx/domain/entity/movie_entity.dart';
import 'package:simple_movie_list_with_getx/domain/repository/movie_repository.dart';

class MovieLoadController extends GetxController {
  final MovieRepository _movieRepository =
      MovieRepositoryImpl(TmdbRemoteDataSource());

  final RxList<MovieEntity> _movieList = RxList<MovieEntity>();

  static const String moviePosterUrl = "https://image.tmdb.org/t/p/w500/";
  RxInt get movieListLength => _movieList.length.obs;
  RxDouble moviePopularity(int index) => _movieList[index].popularity.obs;
  RxString movieOriginTitle(int index) => _movieList[index].originalTitle.obs;
  RxString movieOverview(int index) => _movieList[index].overview.obs;
  RxString moviePosterPath(int index) =>
      (moviePosterUrl + _movieList[index].posterPath).obs;

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  void loadMovies() async {
    final result = await _movieRepository.getPopularMovieList();
    if (result.isSuccess) {
      _movieList.addAll(result.data!);
    }
  }
}
