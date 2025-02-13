import 'package:gtrace3/config/imports.dart';

Widget ButtonsDown(context, {required Function() function, required String icon, String iconNoColor = ""}){

  return  Row(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [

      Container(

        height: 65,
        width: 65,

        decoration: BoxDecoration(

            shape: BoxShape.circle,
            color: COLOR_ACCENT.withOpacity(0.1)
        ),

        child: ButtonCustomIcon(

            iconSvg: iconNoColor.isEmpty ? icon : "",
            iconSvgNoColor: iconNoColor,
            colorBackground: COLOR_BACKGROUND_SECONDARY,
            size: 25,
            onPressed: (){

              function();

            }

        ),

      ),

    ],

  );

}