import 'package:flutter/material.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:movie_app/Widgets/MovieThumbnails.dart';
class Allmovie extends StatelessWidget {
  const Allmovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              child: SGridLayout(itemCount: 10, itemBuilder: (_,index) => const MovieThumbnail(movieName: "RRR", movieDesc: "This movie is very good this movie is very good", icon: Images_String.rrr)),
            ),
          ),
        ),
      ),
    );
  }
}
