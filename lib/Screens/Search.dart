import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Repository/MoviesModel.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:movie_app/Widgets/MovieThumbnails.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'MovieDetailsScreen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<MoviesModel> searchMovies = [];
  final TextEditingController _searchController = TextEditingController(); // Controller for search input

  @override
  void initState() {
    super.initState();
  }

  String trimCode(String html) {
    var document = parse(html);
    return document.body?.text ?? '';
  }

  Future<void> searchData(String searchTerm) async {
    if (searchTerm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a search term")),
      );
      return; // Exit if the search term is empty
    }

    try {
      final response = await http.get(Uri.parse("https://api.tvmaze.com/search/shows?q=$searchTerm"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        setState(() {
          // Clear the movies list before adding new data
          searchMovies.clear();

          for (Map<String, dynamic> item in data) {
            searchMovies.add(MoviesModel.fromJson(item));
          }
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print("Error fetching movies: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load movies")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Search Bar to enter the movie name
                SearchBar(
                  controller: _searchController,
                  hintText: "Enter Movie Name",
                  leading: Icon(Iconsax.search_normal),
                  onSubmitted: (value) {
                    searchData(value); // Trigger search when the user submits the search term
                  },
                ),
                const SizedBox(height: 15),
                // Display the movie thumbnails
                searchMovies.isNotEmpty
                    ? SGridLayout(
                  itemCount: searchMovies.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      // Navigate to movie details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(movie: searchMovies[index]), // Pass movie data
                        ),
                      );
                    },
                    child: MovieThumbnail(
                      movieName: searchMovies[index].show.name,
                      movieDesc: trimCode(searchMovies[index].show.summary),
                      icon: searchMovies[index].show.image?.original ??
                          "https://tse2.mm.bing.net/th?id=OIP.GUk8sz7MvppUwEI-6bXpSwHaHa&pid=Api&P=0&h=180",
                    ),
                  ),
                )
                    : const Center(child: Text("Movies not found")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
