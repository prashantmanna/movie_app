import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_app/Screens/AllMovie.dart';

import '../Screens/MovieDetailsScreen.dart';
class MovieThumbnail extends StatelessWidget {
  const MovieThumbnail({
    super.key,
    required this.movieName,
    required this.movieDesc,
    required this.icon
  });

  final String movieName;
  final String movieDesc;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(MovieDetailsScreen()),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.9),
          border: Border.all(color: Colors.black)
        ),
        height: 200,
        width: 150,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(image: AssetImage(icon),height: 250,width: 200,fit: BoxFit.cover,)
            ),
            Positioned(
                bottom: 15,
                left: 5,
                child: Text(movieName,style: TextStyle(fontSize: 20),)),
            Positioned(
                bottom: 5,
                left: 5,
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(movieDesc,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12),),
                ))
          ],
        ),


      ),
    );
  }
}
