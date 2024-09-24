import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:readmore/readmore.dart';

import '../Widgets/MovieDescription.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text("Movie Details",style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
                MovieDescription(
                  title: "Titanic",
                  description: "This is my movie This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie",
                  actors: "This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie",
                  date: "24/09/2024",
                  rating: 9.0,
                  icon: Image.network(movie.show.image?.original ?? ''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

