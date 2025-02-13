import 'package:gtrace3/config/imports.dart';

Widget HeroBackgroundOpacity({double opacity = 0.4}){

  return Hero(

    tag: "opacity",

    child: Container(
      decoration: BoxDecoration(

          gradient: LinearGradient(

              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(opacity)
              ]

          )
      ),
    ),

  );

}