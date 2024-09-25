import 'package:flutter/material.dart';
import '../Repository/MoviesModel.dart';
import '../Widgets/MovieDescription.dart';
import 'package:html/parser.dart' show parse;

class MovieDetailsScreen extends StatelessWidget {
  final MoviesModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  // Helper function to clean HTML tags from the summary
  String trimCode(String html) {
    var document = parse(html);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // Ensure the data is not null and provide defaults where necessary
    final movieTitle = movie.show.name ?? "Untitled";
    final movieSummary = trimCode(movie.show.summary ?? "No summary available.");
    final moviePremiered = movie.show.premiered?.toUtc().toString() ?? "Unknown";
    final movieRating = movie.show.rating.average?.toString() ?? "5.0";
    final movieImage = movie.show.image?.original ??
        "https://tse2.mm.bing.net/th?id=OIP.GUk8sz7MvppUwEI-6bXpSwHaHa&pid=Api&P=0&h=180";
    final movieGenre = movie.show.genres.isNotEmpty ? movie.show.genres : ["Unknown"];
    final movieSite = movie.show.officialSite ?? "No official site available";

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                MovieDescription(
                  title: movieTitle,
                  description: movieSummary,
                  date: moviePremiered,
                  rating: movieRating,
                  icon: movieImage,
                  genre: movieGenre,
                  site: movieSite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
