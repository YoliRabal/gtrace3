import 'package:gtrace3/config/imports.dart';

///STYLES
ButtonStyle estiloTransparente() {
  return TextButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.zero, // Elimina cualquier tamaño mínimo
    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce el área de toque
    splashFactory: NoSplash.splashFactory,
    foregroundColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    disabledForegroundColor: Colors.transparent,
    disabledBackgroundColor: Colors.transparent,
    side: BorderSide.none,
    elevation: 0,
  );
}



///BUTTON
class ButtonCustom extends StatelessWidget {
  final void Function()? onPressed;

  final double? width;
  final double? height;
  final MainAxisAlignment mainAxisAlignment;

  //TEXT
  final Color textColor;
  final String texto;
  final bool onlyText;
  final double customSizeText;

  //RICHTEXT
  final List<Map<String, String>> richTexts;

  //BORDER
  final bool border;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  //ICONS
  final double iconSize;
  final String iconBegin;
  final String iconFinal;
  final Color iconColor;
  final bool iconNoColor;

  //COLOR
  final Color color;
  final Color colorSplash;
  final bool hasGradient;
  final Color colorGradientPrimary;
  final Color colorGradientSecondary;

  const ButtonCustom({
    super.key,
    this.onPressed,
    this.width = double.infinity,
    this.height = 60,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.border = false,
    this.borderColor = COLOR_BORDER,
    this.borderWidth = 1,
    this.borderRadius = RADIUS,
    this.texto = "",
    this.customSizeText = 0,
    this.richTexts = const [],
    this.textColor = COLOR_TEXT,
    this.color = COLOR_ACCENT,
    this.colorSplash = COLOR_ACCENT_PRESSED,
    this.hasGradient = true,
    this.colorGradientPrimary = COLOR_ACCENT,
    this.colorGradientSecondary = COLOR_ACCENT_SECONDARY,
    this.iconBegin = "",
    this.iconFinal = "",
    this.iconColor = Colors.white,
    this.iconNoColor = false,
    this.iconSize = 22,
    this.onlyText = false,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: richTexts.isNotEmpty || onlyText ? 35 : height,
      width: width,

      child: Material(

        type: MaterialType.transparency,
        clipBehavior: Clip.antiAlias,
        shape: border
            ? RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: borderWidth, strokeAlign: BorderSide.strokeAlignInside))
            : RoundedRectangleBorder(borderRadius:BorderRadius.circular(borderRadius)),

        child: InkWell(

            splashColor: richTexts.isNotEmpty || onlyText || border ? colorSplash.withOpacity(0.02) : colorSplash,
            highlightColor: richTexts.isNotEmpty || onlyText || border ? colorSplash.withOpacity(0.02) : colorSplash.withOpacity(0.5),
            onTap: onPressed,

            child: Ink(

              decoration: BoxDecoration(

                gradient: !hasGradient || richTexts.isNotEmpty || onlyText || border ? null : LinearGradient(
                  colors: [colorGradientPrimary, colorGradientSecondary],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                color: !hasGradient || richTexts.isNotEmpty || onlyText ||  border ? null : color,

              ),

              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: PADDING_DOUBLE),

                child: Row(

                  mainAxisAlignment: mainAxisAlignment,

                  children: [

                    iconBegin.isNotEmpty ? iconNoColor
                        ? SvgCustomNoColor(icon: iconBegin, size: iconSize)
                        : SvgCustom(icon: iconBegin, size: iconSize, color: iconColor) : iconFinal.isNotEmpty && texto.isNotEmpty ? Espacio(iconSize) : Nada(),

                    // Renderizado del texto normal o RichText
                    texto.isNotEmpty
                        ? TextoBoton(texto, color: onlyText || border ? textColor : COLOR_TEXT_BUTTONS, fontSize: customSizeText != 0 ? customSizeText : TEXTO_BOTON_SIZE)
                        : richTexts.isNotEmpty
                        ? RichText(text: TextSpan(children: richTexts.map((textData) => generateRichText(textData)).toList(),),)
                        : const SizedBox(),

                    iconFinal.isNotEmpty ? iconNoColor
                        ? SvgCustomNoColor(icon: iconFinal, size: iconSize)
                        : SvgCustom(icon: iconFinal, size: iconSize, color: iconColor) : iconBegin.isNotEmpty && texto.isNotEmpty ? Espacio(iconSize) : Nada(),
                  ],

                ),

              ),

            )
        ),

      ),

    );

  }

  TextSpan generateRichText(Map<String, String> textData) {
    String key = textData.keys.first;
    String value = textData.values.first;

    switch (key) {
      case "destacado":
        return TextSpan(
          text: value,
          style: estiloBody(fontWeight: FontWeight.bold, color: COLOR_ACCENT),
        );
      default:
        return TextSpan(
          text: value,
          style: estiloBody(), // Estilo por defecto
        );
    }
  }

}

///BUTTON ICON
class ButtonCustomIcon extends StatelessWidget {

  ///Parametros normales
  final Function()? onPressed;
  final String iconSvg;
  final String iconSvgNoColor;
  final IconData iconData;

  final double size;
  final double? iconSize;
  final double padding;

  final double radius;
  final bool isCircular;
  final Color color;
  final Color colorBackground;

  const ButtonCustomIcon({super.key,
    this.onPressed,

    this.iconData = Icons.add,
    this.iconSvg = "",
    this.iconSvgNoColor = "",
    this.color = COLOR_TEXT,

    this.radius = 5,
    this.isCircular = true,

    this.size = 55,
    this.iconSize,
    this.padding = 15,
    this.colorBackground = COLOR_BACKGROUND_SECONDARY});

  @override
  Widget build(BuildContext context) {

    return Container(

      width: size,
      height: size,

      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircular ? null : BorderRadius.circular(radius),
        color: colorBackground
      ),

      clipBehavior: Clip.antiAlias,

      child: TextButton(

        style: estiloTransparente(),

        onPressed: (){
          if(onPressed!=null){
            onPressed!();
          }
        },

        child: Padding(

          padding: EdgeInsets.all(padding),

          child: Align(

            alignment: Alignment.center,

            child: LayoutBuilder(

              builder: (BuildContext context, BoxConstraints constraints) {

                if(iconSvgNoColor.isNotEmpty){

                  return SvgCustomNoColor(icon: iconSvgNoColor, size: iconSize ?? 24);

                }else if(iconSvg.isNotEmpty){

                  return SvgCustom(icon: iconSvg, color: color, size: iconSize ?? 24);

                }else{

                  return Icon(iconData, color: color, size: iconSize,);

                }

              },


            ),

          ),
        )

      ),

    );

  }
}

///WIDGETS
Widget ButtonSheetCustomOneButton({Function()? onPressed, required String title, bool shadow = false}){

  return Container(

    padding: const EdgeInsets.only(bottom: ESPACIO_GRANDE, left: PADDING_DOUBLE, right:PADDING_DOUBLE, top:PADDING_DOUBLE),
    decoration: BoxDecoration(

        color: COLOR_BACKGROUND,
        boxShadow: shadow ? [BoxShadowCustom()] : null,

    ),

    child: ButtonCustom(

      texto: title,
      onPressed: (){


        if(onPressed!=null){
          onPressed();
        }

      },
    ),

  );

}











