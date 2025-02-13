import 'package:gtrace3/config/imports.dart';

class onboarding_datos extends StatefulWidget {
  final Function function;

  onboarding_datos({required this.function});

  @override
  _onboarding_datosState createState() => _onboarding_datosState();
}

class _onboarding_datosState extends State<onboarding_datos> {

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
              "¿Quién eres?",
              maxlines: 2,
              textAlign: TextAlign.start,
            ),
          ),

          Espacio(ESPACIO_EXTRAPEQUENO),

          ShowUpAnimationCustom(
            order: 2,
            child: TextoBody(
              "Añade tu nombre y una pequeña bio para que te conozcan el resto de usuarios.",
              maxlines: 2,
              textAlign: TextAlign.start,
            ),
          ),

          Espacio(ESPACIO_MEDIANO),

          //NOMBRE
          ShowUpAnimationCustom(
            order: 3,
            child: TextFormFieldCustom(
              controller: onboarding_name,
              labelText: "Nombre*",
              textInputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
          ),

          Espacio(ESPACIO_PEQUENO),

          //BIO
          ShowUpAnimationCustom(
            order: 4,
            child: TextFormFieldCustom(
              controller: onboarding_bio,
              labelText: "Bio",
              textInputType: TextInputType.name,
              textCapitalization: TextCapitalization.sentences,
              minLines: 10,
              maxLines: 15,
            ),
          ),

          Espacio(ESPACIO_PEQUENO),


        ],
      ),
    );

  }

}
