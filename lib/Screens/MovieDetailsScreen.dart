import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Widgets/MovieAppBar.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: MovieDescription(
            title: "Titanic",
            description: "This is my movie This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie This is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movieThis is my movie",
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
        const MovieAppBar(title: Text("Back",style: TextStyle(fontFamily: "Poppins"),), showBackArrow: true),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(
              image: AssetImage(Images_String.titanic),
              height: 300,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Poppins"
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Iconsax.star5, color: Colors.yellow.shade700),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"
          ),
        ),
        const SizedBox(height: 5),
        ReadMoreText(
          description,
          trimLines: 5,
          style: TextStyle(fontFamily: "Poppins"),
          trimMode: TrimMode.Line,
          trimCollapsedText: " ..Show More",
          trimExpandedText: "  ..Less",
          moreStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue,fontFamily: "Poppins"),
          lessStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue,fontFamily: "Poppins"),
        ),
        const SizedBox(height: 10),
        const Text(
          "Cast",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"
          ),
        ),
        const SizedBox(height: 5),
        ReadMoreText(
          description,
          trimLines: 2,
          style: TextStyle(fontFamily: "Poppins"),
          trimMode: TrimMode.Line,
          trimCollapsedText: " ..Show More",
          trimExpandedText: "  ..Less",
          moreStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue),
          lessStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.blue),
        ),
        const SizedBox(height: 10),
        const Text(
          "Release Date",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"
          ),
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 16,fontFamily: "Poppins"),

        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
