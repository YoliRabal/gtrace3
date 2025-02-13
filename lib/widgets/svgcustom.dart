import 'package:gtrace3/config/imports.dart';

Widget SvgCustom({String icon = "", Color color = COLOR_ACCENT, bool noColor = false, BlendMode blendMode = BlendMode.srcIn, double size = 24, String fullIcon = ""}){

  return SvgPicture.asset(
      fullIcon.isNotEmpty ? fullIcon : "assets/icons/$icon.svg",
      height: size,
      width: size,
      colorFilter: noColor ? null : ColorFilter.mode(
          color,
          blendMode
      )
  );
}


Widget SvgCustomNoColor({String icon = "", double size = 24, String fullIcon = ""}){

  return SvgPicture.asset(
    fullIcon.isNotEmpty ? fullIcon : "assets/icons/$icon.svg",
      height: size,
      width: size,
  );
}

Widget SvgCustomNoColorHome({String icon = "", String fullIcon = "", double size = 24,}){

  return SvgPicture.asset(
    fit: BoxFit.fitHeight,
    fullIcon.isNotEmpty ? fullIcon : "assets/icons/$icon.svg",
    height: size,
  );
}

Widget SvgCustomComplete({required String icon, bool noColor = false, Color color = COLOR_ACCENT, BlendMode blendMode = BlendMode.srcIn, double size = 24}){

  return SvgPicture.asset(
    icon,
    height: size,
    width: size,
    colorFilter:  noColor ? null : ColorFilter.mode(
        color, blendMode
    ),


  );
}