import 'package:gtrace3/config/imports.dart';

const double radiusCustom = 15;
const double radiusCustomBig = 30;

DecorationImage decorationImageNetwork(String imagen, {Color color = COLOR_BACKGROUND, BoxFit boxFit = BoxFit.cover}){

  return DecorationImage(
    image: NetworkImage(imagen),
    filterQuality: FilterQuality.high,
    colorFilter: ColorFilter.mode(COLOR_BACKGROUND.withOpacity(0.2), BlendMode.darken),
    fit: boxFit,
  );

}

DecorationImage decorationImageAsset(String imagen, {Color color = COLOR_BACKGROUND, BoxFit boxFit = BoxFit.cover, double opacity = 1,}){

  return DecorationImage(
    image: AssetImage(imagen),
    filterQuality: FilterQuality.high,
    opacity: opacity,
    colorFilter: ColorFilter.mode(COLOR_BACKGROUND.withOpacity(0.2), BlendMode.darken),
    fit: boxFit,
  );

}

//BORDERS
BorderRadius BorderRadiusFull(){

  return BorderRadius.circular(100);

}

BorderRadius BorderRadiusAll({double radius = radiusCustom}){

  return BorderRadius.circular(radius);

}

BorderRadius BorderRadiusOnlyTop({double radius = radiusCustomBig}){

  return BorderRadius.only(topRight: Radius.circular(radius), topLeft: Radius.circular(radius));

}

BorderRadius BorderRadiusOnlyBottom({double radius = radiusCustomBig}){

  return BorderRadius.only(bottomLeft: Radius.circular(radius), bottomRight: Radius.circular(radius));

}

//SHADOWS
BoxShadow BoxShadowCustom(){

  return BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 1,
    blurRadius: 20,
    offset: const Offset(0, 0), // changes position of shadow
  );

}

//DECORATIONS
BoxDecoration boxDecorationCustom(){

  return  BoxDecoration(

    color: COLOR_BACKGROUND_SECONDARY,

    borderRadius: BorderRadiusAll(),

    boxShadow: [
      BoxShadowCustom()
    ],

  );

}

