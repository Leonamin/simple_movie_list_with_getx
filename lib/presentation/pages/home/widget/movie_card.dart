import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String overview;
  final double popularity;
  final String posterPath;

  const MovieCard({
    super.key,
    required this.title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Image.network(posterPath),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
