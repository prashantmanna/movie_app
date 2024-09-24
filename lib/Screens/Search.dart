import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/Constants/Images_String.dart';
import 'package:movie_app/Screens/AllMovie.dart';
import 'package:movie_app/Widgets/GridLayout.dart';
import 'package:movie_app/Widgets/MovieThumbnails.dart';
class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchBar(hintText: "Enter movie name",leading: Icon(Iconsax.search_normal),),
                SizedBox(height: 15,),
                Container(
                  child: SGridLayout(itemCount: 10, itemBuilder: (_,index)=>(MovieThumbnail(movieName: "Titanic",movieDesc: "This movie is very very good",icon: Images_String.titanic,))),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
