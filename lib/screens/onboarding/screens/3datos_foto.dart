import 'package:gtrace3/config/imports.dart';


class onboarding_foto extends StatefulWidget {
  final Function() function;

  const onboarding_foto({Key? key, required this.function}) : super(key: key);

  @override
  _onboarding_fotoState createState() => _onboarding_fotoState();
}

class _onboarding_fotoState extends State<onboarding_foto> {

  double size = 200;

  @override
  Widget build(BuildContext context) {

    return Container(

      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: PADDING,

      child: ListView(

        shrinkWrap: true,
        children: [

          Espacio(ESPACIO_MEDIANO),

          ShowUpAnimationCustom(
            order: 1,
            child: TextoTitulo(
              "Añade tu foto de perfil",
              maxlines: 2,
              textAlign: TextAlign.start,
            ),
          ),

          Espacio(ESPACIO_PEQUENO),

          ShowUpAnimationCustom(
            order: 2,
            child: TextoBody(
              "Añade una foto de perfil para que los demás te conozcan",
              maxlines: 2,
              textAlign: TextAlign.start,
            ),
          ),

          Espacio(ESPACIO_MEDIANO),

          ImagePublish(
            width: size,
            height: size,
            isCircular: true,
            boxFit: BoxFit.cover,
            onFinish: (value){
              onboarding_image = value;
              setState(() {});
            },
            imageFile: onboarding_image,

          )


        ],

      ),

    );

  }


}


