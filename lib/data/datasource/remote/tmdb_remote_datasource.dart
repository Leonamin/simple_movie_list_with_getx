import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_movie_list_with_getx/data/dto/movie_dto.dart';
import 'package:simple_movie_list_with_getx/domain/resoures/data_result.dart';

class TmdbRemoteDataSource {
  final apiQueryParam = {
    'api_key': 'YOUR_KEY',
  };

  Future<DataResult<List<MovieDTO>>> loadMovies() async {
    final Uri uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', apiQueryParam);
    final Response response = await get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      if (body["results"] != null) {
        final List<dynamic> results = body["results"];
        final data =
            results.map<MovieDTO>((item) => MovieDTO.fromJson(item)).toList();
        return DataResult(isSuccess: true, data: data);
      }
    }
    return DataResult(
      isSuccess: false,
      messeage: response.body,
    );
  }
}
