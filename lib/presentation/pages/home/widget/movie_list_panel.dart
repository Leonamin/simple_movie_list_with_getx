import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_movie_list_with_getx/presentation/pages/home/controller/movie_load_controller.dart';
import 'package:simple_movie_list_with_getx/presentation/pages/home/widget/movie_card.dart';

class MovieListPanel extends StatelessWidget {
  MovieListPanel({super.key});
  final MovieLoadController movieLoadController =
      Get.put(MovieLoadController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return RefreshIndicator(
          onRefresh: () async {
            movieLoadController.loadMovies();
          },
          child: ListView.builder(
            itemCount: movieLoadController.movieListLength.value,
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: MovieCard(
                  title: movieLoadController.movieOriginTitle(index).value,
                  overview: movieLoadController.movieOverview(index).value,
                  popularity: movieLoadController.moviePopularity(index).value,
                  posterPath: movieLoadController.moviePosterPath(index).value,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
