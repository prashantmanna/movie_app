import 'package:flutter/material.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Widgets/GridLayout.dart';

import '../Widgets/MovieThumbnails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
            body: SingleChildScrollView(
              child: SGridLayout(itemCount: 10, itemBuilder: (_,index)=>MovieThumbnail(movieName: "Titanic", movieDesc: "This movie is very good This movie is very good", icon: Images_String.titanic))
            )
        ),
      ),
    );
  }
}

