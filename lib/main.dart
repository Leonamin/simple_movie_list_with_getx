import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_movie_list_with_getx/presentation/config/app_route_constants.dart';
import 'package:simple_movie_list_with_getx/presentation/config/router.dart';

void main() {
  runApp(const MyApp());
}

const seedColor = Color.fromARGB(255, 48, 159, 167);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simple Moview List',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: AppRouteConstants.homePagePath,
      getPages: appRoutes(),
    );
  }
}
