import 'package:flutter/material.dart';
import 'package:simple_movie_list_with_getx/data/datasource/remote/tmdb_remote_datasource.dart';
import 'package:simple_movie_list_with_getx/data/repository_impl/movie_repository_impl.dart';
import 'package:simple_movie_list_with_getx/domain/usecase/get_popular_movies_usecase.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 잘되네
          // print(await TmdbRemoteDataSource().loadMovies().then(
          //     (DataResult<List<MovieDTO>> value) =>
          //         value.data!.first.originalTitle));
          GetPopularMoviesUseCase(
                  movieRepository: MovieRepositoryImpl(TmdbRemoteDataSource()))
              .getPopularMovieList()
              .then((value) => print(value.data?.first.overview));
        },
      ),
    );
  }
}
