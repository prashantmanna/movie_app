import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      onTap: ()=> Get.to(const MovieDetailsScreen()),
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
                child: Image.network(icon)
            ),
            const SizedBox(height: 10,),
            Positioned(
                bottom: 15,
                left: 5,
                child: Text(movieName,style: const TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.w900),)),
            Positioned(
                bottom: 5,
                left: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(movieDesc,overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 12,fontFamily: "Poppins",fontWeight: FontWeight.w600),),
                ))
          ],
        ),


      ),
    );
  }
}
