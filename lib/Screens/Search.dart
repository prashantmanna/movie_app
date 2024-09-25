import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Repository/MoviesModel.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:movie_app/Widgets/MovieThumbnails.dart';
import 'package:http/http.dart' as http;

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

  Future<void> searchData(String searchTerm) async {
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
                  itemBuilder: (_, index) => MovieThumbnail(
                    movieName: searchMovies[index].show.name,
                    movieDesc: searchMovies[index].show.summary,
                    icon: searchMovies[index].show.image?.original ?? '',
                  ),
                )
                    : const Center(
                  child: Text("No movies found."),
                ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}
