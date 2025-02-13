import 'package:gtrace3/config/imports.dart';

SnackBar snackbar(Color color, String texto, IconData icono,{Color background = COLOR_BACKGROUND_SECONDARY, Color colorText = COLOR_TEXT}){

  return SnackBar(

    behavior: SnackBarBehavior.floating,
    backgroundColor: background,
    elevation: 100,

    content: Row(

      children: [

        Icon(
          icono,
          color: colorText,
          size: 18,
        ),

        Espacio(ESPACIO_PEQUENO),

        Expanded(child: TextoCaption(texto, maxlines: 5, color: colorText)),

      ],

    ),
  );
}


SnackBar snackbarBottom(Color color, String texto, IconData icono){

  return SnackBar(

    behavior: SnackBarBehavior.floating,
    backgroundColor: color,

    content: Row(
      children: [
        Icon(
          icono,
          color: COLOR_BACKGROUND,
          size: 18,
        ),
        Espacio(
            ESPACIO_PEQUENO
        ),
        Text(
          texto,
          style: estiloSmall(color: COLOR_BACKGROUND),
        )
      ],
    ),
  );
}


SnackBar snackbarTop(BuildContext context, Color color, String texto, IconData icono, double altura){

  return SnackBar(

    behavior: SnackBarBehavior.floating,
    backgroundColor: color,

    margin: EdgeInsets.only(
        bottom: altura),

    content: Row(
      children: [
        Icon(
          icono,
          color: COLOR_BACKGROUND,
          size: 18,
        ),
        Espacio(
            ESPACIO_PEQUENO
        ),
        Text(
          texto,
          style: estiloCaption(color: COLOR_BACKGROUND),
        )
      ],
    ),
  );

}