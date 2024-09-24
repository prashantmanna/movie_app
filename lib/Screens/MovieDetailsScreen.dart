import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Widgets/MovieAppBar.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MovieDescription(
            title: "Titanic",
            description: "This is my movie This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie",
            actors: "This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie",
            date: "24/09/2024",
            rating: 9.0,
          ),
        ),
      ),
    );
  }
}

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.title,
    required this.description, required this.actors, required this.date, required this.rating,
  });

  final String title;
  final String description;
  final String actors;
  final String date;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieAppBar(title: Text("Back"), showBackArrow: true),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage(Images_String.titanic),
              height: 300,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Iconsax.star5, color: Colors.yellow.shade700),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Description",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        ReadMoreText(
          description,
          trimLines: 5,
          trimMode: TrimMode.Line,
          trimCollapsedText: " ..Show More",
          trimExpandedText: "  ..Less",
          moreStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue),
          lessStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        SizedBox(height: 10),
        Text(
          "Cast",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          actors,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Text(
          "Release Date",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          date,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
