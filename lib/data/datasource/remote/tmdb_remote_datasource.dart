import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_movie_list_with_getx/data/dto/movie_dto.dart';

class TmdbRemoteDataSource {
  // 터미널에서 실행시 --dart-define TMDB_KEY=YOUR_KEY
  // 혹은 .vscode/launch.json에서 실행 설정에 추가
  final apiQueryParam = {
    'api_key': const String.fromEnvironment('TMDB_KEY'),
  };

  // 응답에 대한 판단은 repository에서 하는게 바람직해보인다.
  // DataSource의 역할은 데이터를 주는것에 한정하고 판단은 하지 않는것이 유연성이 있어보인다.
  // 아니면 HTTP 응답은 HTTPResult를 따로 만들거나 라이브러리에 있는 Reponse를 받아서 status code, body를 보면 된다고 생각한다.
  // 그러니 성공 -> 데이터,
  // 실패 -> 예외 발생 (추후 API 설명에 나온 에러에 따라 예외처리를 일으키는게 나아보이지 않을까)
  Future<List<MovieDTO>> loadMovies() async {
    final Uri uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', apiQueryParam);
    final Response response = await get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      if (body["results"] != null) {
        final List<dynamic> results = body["results"];
        return results
            .map<MovieDTO>((item) => MovieDTO.fromJson(item))
            .toList();
      }
    }
    throw Exception();
  }
}
