import 'package:gtrace3/config/imports.dart';

bienvenida(context,{required Function() function}){

  return SizedBox(

    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,

    child: Container(

        padding: PADDING,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Espacio(90),

            Relleno(),

            Image.asset("assets/icon/icon.png", width: 150,),

            Espacio(ESPACIO_PEQUENO),

            ShowUpAnimationCustom(

                order: 1,

                child: TextoTitulo("Bienvenido a Grados", maxlines: 10, textAlign: TextAlign.center, fontWeight: FontWeight.w600,)

            ),

            Espacio(ESPACIO_EXTRAPEQUENO),

            ShowUpAnimationCustom(

                order: 2,
                child: TextoBody("¿Quieres crear tu perfil antes de empezar?", textAlign: TextAlign.center, maxlines: 5)

            ),

            Espacio(ESPACIO_MEDIANO),

            ShowUpAnimationCustom(

                order: 3,

                child:  ButtonCustom(

                  width: 200,
                  height: 55,
                  onPressed: (){
                    function();
                  },
                  texto: "Crear perfil",


                )

            ),

            Relleno(),

            ShowUpAnimationCustom(

                order: 4,

                child:  ButtonCustom(

                  width: 200,
                  height: 55,
                  onlyText: true,
                  onPressed: () async {

                    USUARIO.image = DEFAULT.image_profile;
                    USUARIO.onboarding = true;

                    await updateUser(USUARIO);

                    goToClear(context, const HomePage());

                  },
                  texto: "Empezar sin perfil",


                )

            ),


          ],

        )
    ),

  );


}