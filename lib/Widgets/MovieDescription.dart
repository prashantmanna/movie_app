import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Widgets/MovieAppBar.dart';
import 'package:readmore/readmore.dart';
import 'package:html/parser.dart' show parse;
class MovieDescription extends StatelessWidget {
  const MovieDescription(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.rating,
        required this.site,
      required this.icon, required this.genre});

  final String title;
  final String description;
  final String date;
  final String rating;
  final String icon;
  final List<String> genre;
  final String site;

  String trimCode(String html) {
    var document = parse(html);
    return document.body?.text ?? '';
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieAppBar(
          showBackArrow: true,
          title: Text("Go Back",style: TextStyle(fontFamily: "Poppins"),),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              icon,
              fit: BoxFit.cover, // Use BoxFit to control image scaling
              height: MediaQuery.of(context).size.height*0.5, // Adjust the height as necessary
              width: double.infinity, // Ensure it takes full width
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
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
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(width: 10),
                  Icon(Iconsax.star5, color: Colors.yellow.shade700),
                ],
              ),
            ],
          ),
        ),
        Row(children: [
          Text(genre[0],style: TextStyle(fontFamily: "Poppins"),),
          SizedBox(width: 10,),
          Text(genre[1],style: TextStyle(fontFamily: "Poppins"),),
        ],),
        const SizedBox(height: 10),
        const Text(
          "Description",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        ),
        const SizedBox(height: 5),
        ReadMoreText(
          description,
          trimLines: 5,
          style: const TextStyle(fontFamily: "Poppins"),
          trimMode: TrimMode.Line,
          trimCollapsedText: " ..Show More",
          trimExpandedText: "  ..Less",
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              fontFamily: "Poppins"),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              fontFamily: "Poppins"),
        ),
        const SizedBox(height: 10),
        const Text(
          "Release Date",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Poppins"),
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: const TextStyle(fontSize: 16, fontFamily: "Poppins"),
        ),
        const SizedBox(height: 20),
        Text("Offical Site " + site,style: TextStyle(fontFamily: "Poppins",color: Colors.blue),)
      ],
    );
  }
}
