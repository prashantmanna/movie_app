import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:http/http.dart' as http;
import '../Repository/MoviesModel.dart';
import '../Widgets/MovieThumbnails.dart';
import 'package:html/parser.dart' show parse;

import 'MovieDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MoviesModel> movies = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse("https://api.tvmaze.com/search/shows?q=all"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        // Clear the movies list before adding new data
        setState(() {
          movies.clear();
          for (Map<String, dynamic> item in data) {
            movies.add(MoviesModel.fromJson(item));
          }
        });
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print("Error fetching movies: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to load movies")),
      );
    }
  }

  String trimCode(String html) {
    var document = parse(html);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Movies App",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                  ),
                ),
                movies.isNotEmpty
                    ? SGridLayout(
                  itemCount: movies.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      // Directly navigate since we know the index is valid here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(movie: movies[index]), // Pass movie data
                        ),
                      );
                    },
                    child: MovieThumbnail(
                      movieName: movies[index].show.name,
                      movieDesc: trimCode(movies[index].show.summary),
                      icon: movies[index].show.image?.medium ??
                          movies[index].show.image?.original ??
                          "https://tse2.mm.bing.net/th?id=OIP.GUk8sz7MvppUwEI-6bXpSwHaHa&pid=Api&P=0&h=180",
                    ),
                  ),
                )
                    : const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
