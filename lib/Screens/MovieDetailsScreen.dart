import 'package:flutter/material.dart';

import '../Repository/MoviesModel.dart';
import '../Widgets/MovieDescription.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MoviesModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                MovieDescription(
                  title: movie.show.name,
                  description: movie.show.summary,
                  date: movie.show.premiered!.toLocal().toString(),
                  rating: movie.show.rating.toString(),
                  icon: movie.show.image!.original ?? "https://tse2.mm.bing.net/th?id=OIP.GUk8sz7MvppUwEI-6bXpSwHaHa&pid=Api&P=0&h=180"
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

