import 'package:gtrace3/config/imports.dart';

loadingOnBoarding(context){

  return SizedBox(

    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,

    child: Container(

        padding: PADDING,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [


            ShowUpAnimationCustom(

                order: 3,

                child: TextoExtragrande("Creando tu perfil", maxlines: 10, textAlign: TextAlign.center)

            ),

            Espacio(ESPACIO_PEQUENO),

            ShowUpAnimationCustom(

                order: 4,

                child: TextoBody("Espera por favor...", textAlign: TextAlign.center, maxlines: 5)

            ),

            Espacio(ESPACIO_MEDIANO),

            ShowUpAnimationCustom(

                order: 5,

                child: Container(

                  width: 200,

                  child: const LinearProgressIndicator(

                    color: COLOR_ACCENT,
                  ),
                )

            ),




            Espacio(ESPACIO_GRANDE),

          ],

        )
    ),

  );

}