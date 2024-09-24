import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Widgets/MovieAppBar.dart';
import 'package:readmore/readmore.dart';
class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.title,
    required this.description,
    required this.actors,
    required this.date,
    required this.rating,
    required this.icon
  });

  final String title;
  final String description;
  final String actors;
  final String date;
  final double rating;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieAppBar(showBackArrow: true,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Image.network(icon)
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
          style: const TextStyle(fontFamily: "Poppins"),
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
          style: const TextStyle(fontFamily: "Poppins"),
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
