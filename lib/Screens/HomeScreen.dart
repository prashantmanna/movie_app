import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:http/http.dart' as http;
import '../Repository/MoviesModel.dart';
import '../Widgets/MovieThumbnails.dart';
import 'package:html/parser.dart' show parse;
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

  Future<List<MoviesModel>> getData() async {
    final response = await http.get(Uri.parse("https://api.tvmaze.com/search/shows?q=all"));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      // Clear the movies list before adding new data
      movies.clear();

      for (Map<String, dynamic> item in data) {
        movies.add(MoviesModel.fromJson(item));
      }
      return movies;

      setState(() {}); // Update the UI after fetching the data
    } else {
      throw Exception('Failed to load movies');
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
                const Text(
                  "Movies App",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                ),
                FutureBuilder(
                  future: getData(),
                  builder: (context,snapshot) {
                    if (snapshot.hasData) {
                      return SGridLayout(
                        itemCount: movies.length,
                        itemBuilder: (_, index) =>
                            MovieThumbnail(
                              movieName: movies[index].show.name,
                              // Replace with actual movie name
                              movieDesc: trimCode(movies[index].show.summary),
                              // Replace with actual description
                              icon: movies[index].show.image?.medium ?? movies[index].show.image?.original ?? "https://tse2.mm.bing.net/th?id=OIP.GUk8sz7MvppUwEI-6bXpSwHaHa&pid=Api&P=0&h=180", // Replace with actual image URL
                            ),
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),);
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
