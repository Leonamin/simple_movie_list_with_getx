import 'package:get/get.dart';
import 'package:simple_movie_list_with_getx/presentation/config/app_route_constants.dart';
import 'package:simple_movie_list_with_getx/presentation/pages/home_page.dart';

List<GetPage> appRoutes() => [
      GetPage(
        name: AppRouteConstants.homePagePath,
        page: () => const HomePage(),
      ),
    ];
