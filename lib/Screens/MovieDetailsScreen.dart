import 'package:flutter/material.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:movie_app/Widgets/MovieThumbnails.dart';
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              child: SGridLayout(itemCount: 10, itemBuilder: (_,index) => MovieThumbnail(movieName: "Titanic", movieDesc: "This movie is very good this movie is very good", icon: Images_String.titanic)),
            ),
          ),
        ),
      ),
    );
  }
}
