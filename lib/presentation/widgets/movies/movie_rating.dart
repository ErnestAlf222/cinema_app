import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {

  final double voteAverage; 


  const MovieRating({
    super.key,
    required this.voteAverage
  });

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.stars, color: Colors.yellow.shade800),
          Icon(Icons.stars, color: Colors.yellow.shade800),
          const SizedBox(width: 8),
          const SizedBox(width: 3),
          Text(HumanFormats.number(voteAverage, 1),
              style: const TextStyle(fontSize: 17)
                  ?.copyWith(color: Colors.yellow.shade800)),
          
        ],
      ),
    );
  }
}