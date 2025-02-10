import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtrace3/config/theme/theme.dart';

//TEXTOS ///////////////////////////////////////////////////////////////////////
///Lineas
const int MAXLINES = 5;

///Pesos
const FontWeight TEXTO_NORMAL = FontWeight.w500;
const FontWeight TEXTO_MEDIO = FontWeight.w500;
const FontWeight TEXTO_NEGRITA = FontWeight.w600;
const FontWeight TEXTO_NEGRITA_SUPERIOR = FontWeight.w700;

const FontWeight TEXTO_TITULO_WEIGHT = FontWeight.w700;
const FontWeight TEXTO_SUBTITULO_WEIGHT = FontWeight.w700;
const FontWeight TEXTO_BODY_WEIGHT = FontWeight.w400;
const FontWeight TEXTO_BOTON_WEIGHT = FontWeight.w500;
const FontWeight TEXTO_CAPTION_WEIGHT = FontWeight.w400;

///Tamaños
const double TEXTO_EXTRAGRANDE_SIZE = 32;
const double TEXTO_TITULO_SIZE = 22;
const double TEXTO_SUBTITULO_SIZE = 16;
const double TEXTO_BODY_SIZE = 13;
const double TEXTO_BOTON_SIZE = 12;
const double TEXTO_CAPTION_SIZE = 11;
const double TEXTO_SMALL_SIZE = 10;


getEstilo(double size, FontWeight peso, Color color, {double letterspacing = 0, bool sombra = false, bool subrayado = false, double heigth = 1}){

  return GoogleFonts.poppins(
      fontSize: size,
      letterSpacing: letterspacing,
      height: heigth,
      fontWeight: peso,
      color: color,
      shadows: sombra ? <Shadow>[
        const Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 10.0,
          color: Colors.black87,
        ),
      ] : null
  );

}





//ESTILOS //////////////////////////////////////////////////////////////////////
TextStyle estiloExtragrande({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NEGRITA_SUPERIOR, double fontSize = TEXTO_EXTRAGRANDE_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(fontSize, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloTitulo({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_TITULO_WEIGHT, double size = TEXTO_TITULO_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloSubtitulo({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_SUBTITULO_WEIGHT, double size = TEXTO_SUBTITULO_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloBody({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BODY_WEIGHT, double size = TEXTO_BODY_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloBoton({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_BOTON_WEIGHT, double size = TEXTO_BOTON_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloCaption({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_CAPTION_WEIGHT, double size = TEXTO_CAPTION_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}

TextStyle estiloSmall({Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NORMAL, double size = TEXTO_SMALL_SIZE, double letterspacing = 0, bool sombra = false}){

  return getEstilo(size, fontWeight, color, letterspacing: letterspacing, sombra: sombra);

}



//WIDGETS //////////////////////////////////////////////////////////////////////
Widget TextoExtragrande(String texto, {double fontSize = TEXTO_EXTRAGRANDE_SIZE,Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_NEGRITA, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloExtragrande(fontSize: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoTitulo(String texto, {double fontSize = TEXTO_TITULO_SIZE, Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_TITULO_WEIGHT, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloTitulo(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoSubtitulo(String texto, {double fontSize = TEXTO_SUBTITULO_SIZE, Color color = COLOR_TEXT,  bool sombra = false, FontWeight fontWeight = TEXTO_SUBTITULO_WEIGHT, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloSubtitulo(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoBody(String texto, {double fontSize = TEXTO_BODY_SIZE, Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_BODY_WEIGHT, TextAlign textAlign = TextAlign.start, int? maxlines, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines == 0 ? null : maxlines,
      style: estiloBody(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoBoton(String texto, {double fontSize = TEXTO_BOTON_SIZE, bool sombra = false, Color color = COLOR_TEXT_BUTTONS, FontWeight fontWeight = TEXTO_BOTON_WEIGHT, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloBoton(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)

  );

}

Widget TextoCaption(String texto, {double fontSize = TEXTO_CAPTION_SIZE,Color color = COLOR_SUBTEXT, bool sombra = false, FontWeight fontWeight = TEXTO_CAPTION_WEIGHT, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloCaption(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoSmall(String texto, {double fontSize = TEXTO_SMALL_SIZE, Color color = COLOR_TEXT, bool sombra = false, FontWeight fontWeight = TEXTO_NORMAL, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: estiloSmall(size: fontSize, fontWeight: fontWeight, color: color, sombra: sombra)
  );

}

Widget TextoCustom(String texto, {double fontSize = TEXTO_BOTON_SIZE, bool sombra = false, Color color = COLOR_TEXT, FontWeight fontWeight = TEXTO_NEGRITA, TextAlign textAlign = TextAlign.start, int maxlines = MAXLINES, TextOverflow textOverflow = TextOverflow.ellipsis, double espacioLetras = 0}){

  return Text(
      texto,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxlines,
      style: getEstilo(fontSize, fontWeight, color, letterspacing: espacioLetras, sombra: sombra)

  );

}
